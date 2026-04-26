###############################################################################
# MODIEF VAN OVERWALLE-STYLE SIMULATION OF THE INFERRING GOALS CONDITION 
# (SANS OVERSHOOTING)
# RECAST IN A GERGELY-STYLE OBSTACLE SETUP
#
# WHAT THIS SCRIPT DOES
# ---------------------
# Habituation:
#   - The agent follows a jumping path over a center obstacle.
#   - The obstacle is present.
#   - NO goal information is provided during habituation.
#
# Test:
#   - The agent follows a straight path in BOTH test events.
#   - The obstacle is ABSENT at test, allowing a straight approach.
#   - The only difference between test events is goal presence:
#       * CONSISTENT   = goal present at the final step
#       * INCONSISTENT = goal absent throughout the test event
#
# IMPORTANT:
#   This is an adaptation of the Overwalle (2010) architecture to capture
#   the logic of the Inferring Goals condition in Csibra et al. (2003),
#   but within a Gergely-style obstacle framework.
#
#   In this version, the habituation jump path overshoots the obstacle,
#   consistent with the original Overwalle-style implementation.
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

# Capture and print the random seed used
seed_used = sample.int(.Machine$integer.max, 1)
set.seed(seed_used)
print(seed_used)


###############################################################################
# SIGMOID FUNCTION (NEW)
###############################################################################
sigmoid = function(x) {
  1 / (1 + exp(-x))
}



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
# Goal activation is controlled by goalOnThisStep.
#
# Rules:
#   - Agent = +1 on every step
#   - current location = +1
#   - orthogonal neighbors = +0.5
#   - obstacle neighbors = -1
#   - Goal = +1 only when goalOnThisStep = TRUE
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
      
      # Ordinary neighboring cells get weak activation,
      # unless they are obstacle cells.
      if (!(nm %in% obstacleCells)) {
        ext[nm] = 0.5
      }
    }
  }
  
  # Barrier is always visible whenever present.
  if (length(obstacleCells) > 0) {
    ext[obstacleCells] = -1
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
    int = sigmoid(as.vector(sender %*% W))
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
# straight_path():
#   used at test in both conditions
#
# jumping_path():
#   used during habituation
#   overshoots the obstacle in the original Overwalle-style manner
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


###############################################################################
# SECTION 10 — ENVIRONMENT DEFINITIONS
###############################################################################

# Center obstacle used during habituation
obstacle_cells_present = function() {
  c(unit_name(1, 3), unit_name(2, 3))
}

obstacle_cells_absent = function() {
  character()
}


###############################################################################
# SECTION 11 — RUN A WHOLE TRIAL
###############################################################################
# goalStep:
#   - NA           -> goal never appears
#   - length(path) -> goal appears on final step
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
# SECTION 12 — PREDICTION / EXPECTATION PROBE
###############################################################################
# The probe turns on Agent and a weak Goal signal and reads activation
# in critical cells.
###############################################################################

prediction_score = function(W, criticalCells) {
  
  ext = setNames(rep(0, N_UNITS), UNITS)
  ext["Agent"] = 1
  ext["Goal"] = 0.4
  
  int = settle_internal(ext, W)
  
  mean(int[criticalCells])
}


###############################################################################
# SECTION 13 — CRITICAL CELLS
###############################################################################
# Because the test events use a straight path, score the straight-path cells.
###############################################################################

straight_critical_cells = function() {
  c(unit_name(1, 2), unit_name(1, 3), unit_name(1, 4))
}


###############################################################################
# SECTION 14 — RUN ONE EXPERIMENTAL CONDITION
###############################################################################
# testType:
#   "consistent"   -> straight test path, no obstacle, goal present at end
#   "inconsistent" -> straight test path, no obstacle, goal absent throughout
#
# Habituation:
#   - jump path
#   - center obstacle present
#   - NO goal information
###############################################################################

run_condition = function(testType) {
  
  W = init_weights()
  
  # Habituation: jumping path, obstacle present, no goal information
  habObs = obstacle_cells_present()
  
  for (t in 1:N_HABITUATION) {
    W = run_trial(
      W = W,
      path = jumping_path(),
      obstacleCells = habObs,
      goalStep = NA
    )
  }
  
  # Test: straight path, no obstacle
  testObs = obstacle_cells_absent()
  
  if (testType == "consistent") {
    
    # Full path: reaches goal
    path = straight_path()
    goalStep = length(path)
    
  } else if (testType == "inconsistent") {
    
    # Shorter path: stops before goal
    full_path = straight_path()
    path = full_path[1:(length(full_path) - 1)]
    
    # Goal appears AFTER agent stops (i.e., final step of shortened path)
    goalStep = length(path)
    
  } else {
    stop("testType must be 'consistent' or 'inconsistent'")
  }
  
  W = run_trial(
    W = W,
    path = path,
    obstacleCells = testObs,
    goalStep = goalStep
  )
  
  score = prediction_score(W, straight_critical_cells())
  
  score
}


###############################################################################
# SECTION 15 — RUN THE FULL SIMULATION ACROSS PARTICIPANTS
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
# SECTION 16 — SUMMARIZE RESULTS
###############################################################################

summarize_results = function(results) {
  aggregate(score ~ condition, data = results, FUN = mean)
}


###############################################################################
# SECTION 17 — RUN THE MODEL
###############################################################################

results = simulate_all()
cat("Condition means:\n")
print(summarize_results(results))

# To inspect participant-level results:
# fix(results)

# set working directory to move data below to the right folder
#setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleModified/sim3d")
# save data to text file
write.table(results,
            file = "C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/OverwalleModified/sim3d/overwalleModifed_sim3d.txt",
            sep = " ",
            row.names = FALSE,
            col.names = FALSE,
            quote = FALSE
)