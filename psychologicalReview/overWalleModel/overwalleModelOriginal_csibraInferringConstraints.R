###############################################################################
# OCCLUSION VERSION OF THE GERGELY / VAN OVERWALLE-STYLE MODEL
#
# WHAT THIS SCRIPT DOES
# ---------------------
# This script models a version of the obstacle paradigm in which:
#
#   1. During habituation, the agent performs a jumping action.
#   2. The center of the path is occluded.
#   3. An obstacle is actually present behind the occluder during habituation.
#   4. At test, the occluder is removed and the model sees one of two events:
#        - revealedObstacle   : the obstacle is present
#        - revealedNoObstacle : the obstacle is absent
#
# The action at test remains the same jumping action. What varies is whether
# the hidden middle region contains an obstacle once it is revealed.
#
# The network contains:
#   - 1 Agent unit
#   - 1 Goal unit
#   - 25 spatial grid units arranged as a 5 x 5 grid
#
# Total units = 27
#
# The model is:
#   - single-layer recurrent
#   - fully connected
#   - no self-connections
#   - trained with the delta rule
#
# IMPORTANT GEOMETRY CONVENTION
# -----------------------------
# row 1 = bottom row
# col 1 = leftmost column
#
# So:
#   R1C1 = bottom-left
#   R1C5 = bottom-right
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

set.seed(1)


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
# SECTION 5 — EXTERNAL PATTERN ENCODING WITH OCCLUSION
###############################################################################
# This function constructs the external input pattern for one step.
#
# Rules:
#   - Agent = +1 on every step
#   - current location = +1, unless that location is occluded
#   - orthogonal neighbors = +0.5, unless occluded
#   - obstacle neighbors = -1, unless occluded
#   - Goal = +1 only on final step
#
# IMPORTANT:
#   If a cell is occluded, the model receives no direct external information
#   about that cell, whether it contains an obstacle or not.
###############################################################################

make_external_pattern = function(cell,
                                 obstacleCells = character(),
                                 occludedCells = character(),
                                 isFinal = FALSE) {
  
  ext = setNames(rep(0, N_UNITS), UNITS)
  
  ext["Agent"] = 1
  
  r = cell[1]
  c = cell[2]
  cur = unit_name(r, c)
  
  # Only show the current location if it is not occluded.
  if (!(cur %in% occludedCells)) {
    ext[cur] = 1
  }
  
  nbrs = orth_neighbors(r, c)
  
  if (nrow(nbrs) > 0) {
    for (i in 1:nrow(nbrs)) {
      
      rr = nbrs[i, 1]
      cc = nbrs[i, 2]
      nm = unit_name(rr, cc)
      
      # Occluded cells provide no direct perceptual input.
      if (nm %in% occludedCells) {
        next
      }
      
      if (nm %in% obstacleCells) {
        ext[nm] = -1
      } else {
        ext[nm] = 0.5
      }
    }
  }
  
  if (isFinal) {
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
# SECTION 8 — RUN A SINGLE STEP
###############################################################################

run_step = function(W, cell, obstacleCells, occludedCells, isFinal) {
  
  ext = make_external_pattern(
    cell = cell,
    obstacleCells = obstacleCells,
    occludedCells = occludedCells,
    isFinal = isFinal
  )
  
  int = settle_internal(ext, W)
  W = delta_update(W, ext, int)
  
  list(W = W, ext = ext, int = int)
}


###############################################################################
# SECTION 9 — TRAJECTORY DEFINITIONS
###############################################################################
# We use the jump path because the critical manipulation is whether the
# middle region that is jumped over contains an obstacle once revealed.
###############################################################################

jumping_path = function() {
  list(
    c(1, 1),
    c(1, 2),
    c(2, 2),
    c(3, 2),
    c(3, 3),
    c(2, 3),
    c(1, 3),
    c(1, 4)
  )
}


###############################################################################
# SECTION 10 — ENVIRONMENT DEFINITIONS
###############################################################################

# Obstacle truly present in the hidden middle region
obstacle_cells_present = function() {
  c(unit_name(1, 3))
}

# No obstacle present
obstacle_cells_absent = function() {
  character()
}

# Occluder hides the center of the jump path during habituation
occluder_cells = function() {
  c(unit_name(1, 3), unit_name(2, 3))
}


###############################################################################
# SECTION 11 — RUN A WHOLE TRIAL
###############################################################################

run_trial = function(W, path, obstacleCells, occludedCells = character()) {
  
  for (k in seq_along(path)) {
    
    isFinal = (k == length(path))
    
    out = run_step(
      W = W,
      cell = path[[k]],
      obstacleCells = obstacleCells,
      occludedCells = occludedCells,
      isFinal = isFinal
    )
    
    W = out$W
  }
  
  W
}


###############################################################################
# SECTION 12 — PREDICTION / EXPECTATION PROBE
###############################################################################
# The expectation probe turns on Agent and a weak Goal signal and lets the
# learned weights settle.
#
# For the occlusion experiment, we care about activation in the middle region
# that was previously hidden.
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
# For the occlusion version, we score the hidden middle region.
###############################################################################

middle_critical_cells = function() {
  c(unit_name(1, 3), unit_name(2, 3))
}


###############################################################################
# SECTION 14 — RUN ONE OCCLUSION CONDITION
###############################################################################
# Inputs:
#   testReveal = "revealedObstacle" or "revealedNoObstacle"
#
# Procedure:
#   1. initialize random weights
#   2. habituate to jump path with:
#        - hidden obstacle really present
#        - middle region occluded
#   3. test with same jump path, occluder removed, and either:
#        - obstacle present
#        - obstacle absent
#   4. probe the expected middle-region representation
###############################################################################

run_condition = function(testReveal) {
  
  W = init_weights()
  
  # Habituation: obstacle exists, but the middle is occluded.
  habObs = obstacle_cells_present()
  habOcc = occluder_cells()
  
  for (t in 1:N_HABITUATION) {
    W = run_trial(
      W = W,
      path = jumping_path(),
      obstacleCells = habObs,
      occludedCells = habOcc
    )
  }
  
  # Test: occluder removed; reveal either obstacle or no obstacle.
  testOcc = character()
  
  if (testReveal == "revealedObstacle") {
    testObs = obstacle_cells_present()
  } else if (testReveal == "revealedNoObstacle") {
    testObs = obstacle_cells_absent()
  } else {
    stop("testReveal must be 'revealedObstacle' or 'revealedNoObstacle'")
  }
  
  W = run_trial(
    W = W,
    path = jumping_path(),
    obstacleCells = testObs,
    occludedCells = testOcc
  )
  
  score = prediction_score(W, middle_critical_cells())
  
  score
}


###############################################################################
# SECTION 15 — RUN THE FULL SIMULATION
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
        condition = "revealedObstacle",
        score = run_condition("revealedObstacle"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "revealedNoObstacle",
        score = run_condition("revealedNoObstacle"),
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

# To inspect the full participant-level data:
# fix(results)

# set working directory to move data below to the right folder
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/OverwalleOriginal/sim3a")
# save data to text file
write.table(results,
            file = "C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/OverwalleOriginal/sim3a/overwalleOriginal_sim3a.txt",
            sep = " ",
            row.names = FALSE,
            col.names = FALSE,
            quote = FALSE
)