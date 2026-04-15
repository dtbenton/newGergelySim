###############################################################################
# VAN OVERWALLE-STYLE SIMULATION OF THE GERGELY ET AL. (1995) OBSTACLE PARADIGM
# MODIFIED SO THAT:
#   - GOAL INFORMATION IS ABSENT DURING HABITUATION
#   - AT TEST, BOTH EVENTS USE THE SAME CENTER OBSTACLE
#   - THE ONLY DIFFERENCE AT TEST IS WHEN THE GOAL UNIT TURNS ON:
#       * CONSISTENT   = final step
#       * INCONSISTENT = one step before final
###############################################################################


###############################################################################
# SECTION 1 — GLOBAL MODEL PARAMETERS
###############################################################################

GRID_ROWS = 5
GRID_COLS = 5

ETA = 0.10
N_CYCLES = 4

WMIN = -0.2
WMAX =  0.2

N_HABITUATION = 10
N_PARTICIPANTS = 20

#set.seed(1)

# captures the seed before the simulation is run
seed_used = sample.int(.Machine$integer.max, 1)
set.seed(seed_used)

print(seed_used)


###############################################################################
# SECTION 2 — UNIT NAMING
###############################################################################

unit_name = function(r, c) {
  paste0("R", r, "C", c)
}

all_unit_names = function() {
  
  grid = character()
  
  for (r in 1:GRID_ROWS) {
    for (c in 1:GRID_COLS) {
      grid = c(grid, unit_name(r, c))
    }
  }
  
  c("Agent", "Goal", grid)
}

UNITS = all_unit_names()
N_UNITS = length(UNITS)


###############################################################################
# SECTION 3 — GRID NEIGHBOR RELATIONS
###############################################################################

orth_neighbors = function(r, c) {
  
  candidates = rbind(
    c(r + 1, c),
    c(r - 1, c),
    c(r, c + 1),
    c(r, c - 1)
  )
  
  keep =
    candidates[, 1] >= 1 &
    candidates[, 1] <= GRID_ROWS &
    candidates[, 2] >= 1 &
    candidates[, 2] <= GRID_COLS
  
  candidates[keep, , drop = FALSE]
}


###############################################################################
# SECTION 4 — INITIALIZE WEIGHTS
###############################################################################

init_weights = function() {
  
  W = matrix(
    runif(N_UNITS * N_UNITS, min = WMIN, max = WMAX),
    nrow = N_UNITS,
    ncol = N_UNITS,
    dimnames = list(UNITS, UNITS)
  )
  
  diag(W) = 0
  
  W
}


###############################################################################
# SECTION 5 — EXTERNAL PATTERN ENCODING
###############################################################################
# Goal activation is now controlled by a separate logical argument:
#   goalOnThisStep = TRUE/FALSE
#
# This lets us turn the goal on:
#   - never during habituation
#   - at the final step for the consistent test event
#   - one step before the final step for the inconsistent test event
###############################################################################

make_external_pattern = function(cell,
                                 obstacleCells = character(),
                                 goalOnThisStep = FALSE) {
  
  ext = setNames(rep(0, N_UNITS), UNITS)
  
  ext["Agent"] = 1
  
  r = cell[1]
  c = cell[2]
  cur = unit_name(r, c)
  
  ext[cur] = 1
  
  nbrs = orth_neighbors(r, c)
  
  if (nrow(nbrs) > 0) {
    for (i in 1:nrow(nbrs)) {
      
      rr = nbrs[i, 1]
      cc = nbrs[i, 2]
      nm = unit_name(rr, cc)
      
      if (nm %in% obstacleCells) {
        ext[nm] = -1
      } else {
        ext[nm] = 0.5
      }
    }
  }
  
  if (goalOnThisStep) {
    ext["Goal"] = 1
  }
  
  ext
}


###############################################################################
# SECTION 6 — RECURRENT SETTLING
###############################################################################

settle_internal = function(ext, W, n_cycles = N_CYCLES) {
  
  int = setNames(rep(0, N_UNITS), UNITS)
  
  for (cycle in 1:n_cycles) {
    sender = ext + int
    int = as.vector(sender %*% W)
    names(int) = UNITS
  }
  
  int
}


###############################################################################
# SECTION 7 — DELTA RULE LEARNING
###############################################################################

delta_update = function(W, ext, int) {
  
  sender = ext + int
  error = ext - int
  
  dW = ETA * outer(sender, error)
  dimnames(dW) = dimnames(W)
  
  W_new = W + dW
  diag(W_new) = 0
  
  W_new
}


###############################################################################
# SECTION 8 — RUN A SINGLE MOVEMENT STEP
###############################################################################

run_step = function(W, cell, obstacleCells, goalOnThisStep) {
  
  ext = make_external_pattern(
    cell = cell,
    obstacleCells = obstacleCells,
    goalOnThisStep = goalOnThisStep
  )
  
  int = settle_internal(ext, W)
  W = delta_update(W, ext, int)
  
  list(W = W, ext = ext, int = int)
}


###############################################################################
# SECTION 9 — TRAJECTORY DEFINITIONS
###############################################################################

straight_path = function() {
  list(
    c(1, 1),
    c(1, 2),
    c(1, 3),
    c(1, 4),
    c(1, 5)
  )
}

jumping_path = function() {
  list(
    c(1, 1),
    c(1, 2),
    c(2, 2),
    c(3, 2),
    c(3, 3),
    c(3, 4),
    c(2, 4),
    c(1, 4),
    c(1, 5)
  )
}

# Center obstacle present in habituation and test
obstacle_cells_present = function() {
  c(unit_name(1, 3))
}

obstacle_cells_absent = function() {
  character()
}


###############################################################################
# SECTION 10 — RUN A WHOLE TRIAL
###############################################################################
# goalStep:
#   - NA               -> goal never appears
#   - length(path)     -> goal appears on final step
#   - length(path) - 1 -> goal appears one step before final
###############################################################################

run_trial = function(W, path, obstacleCells, goalStep = NA) {
  
  for (k in seq_along(path)) {
    
    goalOnThisStep = (!is.na(goalStep) && k == goalStep)
    
    out = run_step(
      W = W,
      cell = path[[k]],
      obstacleCells = obstacleCells,
      goalOnThisStep = goalOnThisStep
    )
    
    W = out$W
  }
  
  W
}


###############################################################################
# SECTION 11 — PREDICTION / EXPECTATION PROBE
###############################################################################

prediction_score = function(W, criticalCells) {
  
  ext = setNames(rep(0, N_UNITS), UNITS)
  ext["Agent"] = 1
  ext["Goal"] = 0.4
  
  int = settle_internal(ext, W)
  
  mean(int[criticalCells])
}


###############################################################################
# SECTION 12 — CRITICAL CELLS
###############################################################################

straight_critical_cells = function() {
  c(unit_name(1, 2), unit_name(1, 3), unit_name(1, 4))
}

jump_critical_cells = function() {
  c(unit_name(3, 2), unit_name(3, 3), unit_name(3, 4))
}


###############################################################################
# SECTION 13 — RUN ONE EXPERIMENTAL CONDITION
###############################################################################
# testType:
#   "consistent"   -> goal turns on at final step
#   "inconsistent" -> goal turns on one step before final
#
# Habituation:
#   - jump path
#   - center obstacle present
#   - NO goal information
#
# Test:
#   - jump path
#   - center obstacle present
#   - only difference is timing of Goal activation
###############################################################################

run_condition = function(testType) {
  
  W = init_weights()
  
  habObs = obstacle_cells_present()
  
  # Habituation: same jump event, but NO goal information.
  for (t in 1:N_HABITUATION) {
    W = run_trial(
      W = W,
      path = jumping_path(),
      obstacleCells = habObs,
      goalStep = NA
    )
  }
  
  testObs = obstacle_cells_present()
  path = jumping_path()
  
  if (testType == "consistent") {
    goalStep = length(path)
  } else if (testType == "inconsistent") {
    goalStep = length(path) - 1
  } else {
    stop("testType must be 'consistent' or 'inconsistent'")
  }
  
  W = run_trial(
    W = W,
    path = path,
    obstacleCells = testObs,
    goalStep = goalStep
  )
  
  score = prediction_score(W, jump_critical_cells())
  
  score
}


###############################################################################
# SECTION 14 — RUN THE FULL SIMULATION ACROSS PARTICIPANTS
###############################################################################

simulate_all = function() {
  
  results = data.frame(
    participant = integer(),
    condition = character(),
    score = numeric(),
    stringsAsFactors = FALSE
  )
  
  for (p in 1:N_PARTICIPANTS) {
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "consistent",
        score = run_condition("consistent"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "inconsistent",
        score = run_condition("inconsistent"),
        stringsAsFactors = FALSE
      )
    )
  }
  
  results
}


###############################################################################
# SECTION 15 — SUMMARIZE RESULTS
###############################################################################

summarize_results = function(results) {
  aggregate(score ~ condition, data = results, FUN = mean)
}


###############################################################################
# SECTION 16 — RUN THE MODEL
###############################################################################

results = simulate_all()
cat("Condition means:\n")
print(summarize_results(results))

# fix(results)