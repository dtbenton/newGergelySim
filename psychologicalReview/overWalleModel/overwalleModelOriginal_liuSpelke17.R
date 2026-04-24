###############################################################################
# VAN OVERWALLE-STYLE SIMULATION OF LIU & SPELKE (2017)
# Fully commented base-R implementation with built-in settling trace mode
#
# WHAT THIS SCRIPT DOES
# ---------------------
# This script implements a recurrent neural network model with:
#
#   - 1 Agent unit
#   - 1 Goal unit
#   - 25 spatial grid units arranged as a 5 x 5 grid
#
# Total units = 27
#
# The model is a single-layer recurrent associative system:
#   - no hidden units
#   - full recurrent connectivity
#   - no self-connections
#   - delta-rule learning
#
# On each movement step in a path, the script:
#   1. creates an external activation pattern
#   2. lets the network settle recurrently for several cycles
#   3. updates weights using the delta rule
#
# This version also includes a "settling trace mode", which allows you to:
#   - store the internal activation pattern after each recurrent cycle
#   - print the 5 x 5 grid of spatial activations cycle by cycle
#   - plot the settling sequence using only base R
#
# IMPORTANT GEOMETRY CONVENTION
# -----------------------------
# row 1 = bottom row
# col 1 = leftmost column
#
# So:
#   R1C1 = bottom-left cell
#   R1C5 = bottom-right cell
###############################################################################


###############################################################################
# SECTION 1 — GLOBAL MODEL PARAMETERS
###############################################################################
# These values determine the basic behavior of the model.
###############################################################################

GRID_ROWS = 5
GRID_COLS = 5

# Learning rate used in the delta-rule update.
ETA = 0.10

# Number of recurrent settling cycles after each movement step.
N_CYCLES = 4

# Initial random weight range.
WMIN = -0.2
WMAX =  0.2

# Number of habituation trials.
N_HABITUATION = 10

# Number of simulated participants / random restarts.
N_PARTICIPANTS = 20

# Random seed so results are reproducible.
set.seed(1)

###############################################################################
# SIGMOID FUNCTION (NEW)
###############################################################################
sigmoid = function(x) {
  1 / (1 + exp(-x))
}

###############################################################################
# SECTION 2 — UNIT NAMING
###############################################################################
# The network contains:
#   Agent
#   Goal
#   R1C1 ... R5C5
#
# These helper functions construct and manage those names.
###############################################################################

unit_name = function(r, c) {
  # Convert row/column coordinates into a grid-unit name.
  # Example: (3, 4) -> "R3C4"
  paste0("R", r, "C", c)
}

all_unit_names = function() {
  
  grid = character()
  
  # LOOP PURPOSE:
  # Iterate across every row of the 5 x 5 grid.
  for (r in 1:GRID_ROWS) {
    
    # LOOP PURPOSE:
    # Within each row, iterate across every column.
    for (c in 1:GRID_COLS) {
      
      # Add the current grid cell name to the growing list.
      grid = c(grid, unit_name(r, c))
    }
  }
  
  # Add Agent and Goal first, then all spatial cells.
  c("Agent", "Goal", grid)
}

UNITS = all_unit_names()
N_UNITS = length(UNITS)


###############################################################################
# SECTION 3 — GRID NEIGHBOR RELATIONS
###############################################################################
# For a given cell, the model treats the orthogonal neighbors
# (up, down, left, right) as nearby context.
#
# These neighbors receive weaker activation than the current location.
###############################################################################

orth_neighbors = function(r, c) {
  
  # Construct all four orthogonal candidate neighbors.
  candidates = rbind(
    c(r + 1, c),
    c(r - 1, c),
    c(r, c + 1),
    c(r, c - 1)
  )
  
  # Keep only candidates that lie within the 5 x 5 grid.
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
# The weight matrix W stores all recurrent connections.
#
# CONVENTION:
#   W[sender, receiver]
#
# So if unit j sends activation to unit i, the relevant weight is W[j, i].
#
# Then if 'sender' is a row vector of activations:
#   sender %*% W
# gives the incoming activation to all receiving units.
###############################################################################

init_weights = function() {
  
  W = matrix(
    runif(N_UNITS * N_UNITS, min = WMIN, max = WMAX),
    nrow = N_UNITS,
    ncol = N_UNITS,
    dimnames = list(UNITS, UNITS)
  )
  
  # Remove self-connections so units do not send activation to themselves.
  diag(W) = 0
  
  W
}


###############################################################################
# SECTION 5 — EXTERNAL PATTERN ENCODING
###############################################################################
# This function creates the external activation vector for ONE movement step.
#
# Rules:
#   - Agent = +1 on every movement step
#   - current location = +1
#   - orthogonal neighbors = +0.5
#   - obstacle cells, if they are among those neighbors, get -1 instead
#   - Goal = +1 only on the final step
###############################################################################

make_external_pattern = function(cell,
                                 obstacleCells = character(),
                                 isFinal = FALSE) {
  
  # Start with all external activations set to 0.
  ext = setNames(rep(0, N_UNITS), UNITS)
  
  # Agent unit is active whenever the agent is moving.
  ext["Agent"] = 1
  
  # Identify the current location.
  r = cell[1]
  c = cell[2]
  cur = unit_name(r, c)
  
  # Current location gets strong positive activation.
  ext[cur] = 1
  
  # Get nearby orthogonal neighbors.
  nbrs = orth_neighbors(r, c)
  
  if (nrow(nbrs) > 0) {
    
    # LOOP PURPOSE:
    # Visit each neighboring grid cell so we can assign it either:
    #   +0.5 if it is ordinary nearby context
    #   -1   if it is an obstacle cell
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
  
  # Goal becomes externally active only at the final step of the path.
  if (isFinal) {
    ext["Goal"] = 1
  }
  
  ext
}


###############################################################################
# SECTION 6 — RECURRENT SETTLING (FINAL STATE ONLY)
###############################################################################
# This function performs recurrent settling and returns only the final
# internal activation vector.
#
# On each recurrent cycle:
#   sender = ext + int
#   int    = sender %*% W
#
# Here:
#   ext = externally imposed activation for the current step
#   int = internally generated activation accumulated so far
###############################################################################

settle_internal = function(ext, W, n_cycles = N_CYCLES) {
  
  # Internal activation starts at 0 at the beginning of each movement step.
  int = setNames(rep(0, N_UNITS), UNITS)
  
  # LOOP PURPOSE:
  # Simulate recurrent settling over several discrete cycles.
  # Each cycle allows current activation to propagate through the weight matrix.
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
# After settling, the network compares:
#
#   ext  = desired activation pattern
#   int  = internally generated activation pattern
#
# The difference is the error term:
#   error = ext - int
#
# The sender activation used for learning is:
#   sender = ext + int
#
# Because W[sender, receiver], the outer-product update is:
#   W = W + ETA * outer(sender, error)
###############################################################################

delta_update = function(W, ext, int) {
  
  sender = ext + int
  error = ext - int
  
  dW = ETA * outer(sender, error)
  dimnames(dW) = dimnames(W)
  
  W_new = W + dW
  
  # Keep self-connections at zero.
  diag(W_new) = 0
  
  W_new
}


###############################################################################
# SECTION 8 — RUN A SINGLE MOVEMENT STEP
###############################################################################
# One movement step consists of:
#   1. creating the external activation pattern
#   2. allowing recurrent settling
#   3. updating weights using the delta rule
#
# This standard version returns:
#   updated W
#   ext
#   int
###############################################################################

run_step = function(W, cell, obstacleCells, isFinal) {
  
  ext = make_external_pattern(cell, obstacleCells, isFinal)
  int = settle_internal(ext, W)
  W = delta_update(W, ext, int)
  
  list(W = W, ext = ext, int = int)
}


###############################################################################
# SECTION 9 — TRAJECTORY DEFINITIONS
###############################################################################
# These functions define the movement paths used in the simulation.
#
# straight_path:
#   direct bottom-row route
#
# jumping_path:
#   path that goes up and over the obstacle
#
# The geometry is a paper-based reconstruction of the path structure.
###############################################################################

# low, efficient test path
lowEfficient_path = function() {
  list(
    c(1, 1),
    c(1, 2),
    c(2, 2),
    c(2, 3),
    c(2, 4),
    c(1, 4),
    c(1, 5)
  )
}

# high, inefficient test *and* habituation paths
habituation_highInefficient_path = function() {
  list(
    c(1, 1),
    c(1, 2),
    c(2, 2),
    c(3, 2),
    c(4, 2),
    c(5, 2),
    c(5, 3),
    c(5, 4),
    c(4, 4),
    c(3, 4),
    c(2, 4),
    c(1, 4),
    c(1, 5)
  )
}

# experimental condition habituation barrier height
habituation_exp_obstacle_cells = function() {
  c(unit_name(1, 3), unit_name(2, 3), unit_name(3, 3))
}

# experimental condition test barrier height
test_exp_obstacle_cells_present = function() {
  c(unit_name(1, 3))
}

# control condition -- no barrier (as per original Overwalle)
obstacle_cells_absent = function() {
  character()
}


###############################################################################
# SECTION 10 — RUN A WHOLE TRIAL
###############################################################################
# A trial is a complete trajectory, not just one step.
#
# This function loops through every step in a path and applies learning
# after each step.
###############################################################################

run_trial = function(W, path, obstacleCells) {
  
  # LOOP PURPOSE:
  # Walk through the path one step at a time. Each iteration corresponds to
  # one agent location in the trajectory and updates the network accordingly.
  for (k in seq_along(path)) {
    
    isFinal = (k == length(path))
    
    out = run_step(
      W = W,
      cell = path[[k]],
      obstacleCells = obstacleCells,
      isFinal = isFinal
    )
    
    W = out$W
  }
  
  W
}


###############################################################################
# SECTION 11 — PREDICTION / EXPECTATION PROBE
###############################################################################
# After training and test, the model's expectation is probed by turning on:
#   Agent = 1
#   Goal  = 0.4
#
# Then activation is allowed to settle recurrently.
#
# The score for a route is the mean activation of the route's critical cells.
###############################################################################

prediction_score = function(W, criticalCells) {
  
  ext = setNames(rep(0, N_UNITS), UNITS)
  ext["Agent"] = 1
  ext["Goal"] = 0.4
  
  int = settle_internal(ext, W)
  
  mean(int[criticalCells])
}


###############################################################################
# SECTION 12 — CRITICAL CELLS FOR STRAIGHT VS JUMP ROUTES
###############################################################################
# These are the cells used when computing how strongly the network expects
# the straight route vs. the jump route.
###############################################################################

# critical cells for the low, efficient event
jump_critical_cells_lowEfficient = function() {
  c(unit_name(2, 2), unit_name(2, 3), unit_name(2, 4))
}

# critical cells for the high, inefficient event
jump_critical_cells_highInefficient = function() {
  c(unit_name(5, 2), unit_name(5, 3), unit_name(5, 4))
}


###############################################################################
# SECTION 13 — RUN ONE EXPERIMENTAL CONDITION
###############################################################################
# Inputs:
#   habObstaclePresent = TRUE/FALSE
#   testType           = "straight" or "jump"
#
# Procedure:
#   1. initialize random weights
#   2. run 10 habituation trials on the jump path
#   3. run one test trial with obstacle removed
#   4. probe the expected route
###############################################################################

run_condition_exp = function(habObstaclePresent, testType) {
  
  W = init_weights()
  
  if (habObstaclePresent) {
    habObs = habituation_exp_obstacle_cells()
  } else {
    habObs = obstacle_cells_absent()
  }
  
  # LOOP PURPOSE:
  # Simulate repeated habituation exposures. Each iteration is one complete
  # habituation trial through the jump path.
  for (t in 1:N_HABITUATION) {
    W = run_trial(W, habituation_highInefficient_path(), habObs)
  }
  
  # In this simulation, the test occurs with a smaller obstacle
  testObs = test_exp_obstacle_cells_present()
  
  if (testType == "lowEfficient") {
    W = run_trial(W, lowEfficient_path(), testObs)
    score = prediction_score(W, jump_critical_cells_lowEfficient())
  } else {
    W = run_trial(W, habituation_highInefficient_path(), testObs)
    score = prediction_score(W, jump_critical_cells_highInefficient())
  }
  
  score
}


run_condition_cntrl = function(habObstaclePresent, testType) {
  
  W = init_weights()
  
  if (habObstaclePresent) {
    habObs = habituation_exp_obstacle_cells()
  } else {
    habObs = obstacle_cells_absent()
  }
  
  # LOOP PURPOSE:
  # Simulate repeated habituation exposures. Each iteration is one complete
  # habituation trial through the jump path.
  for (t in 1:N_HABITUATION) {
    W = run_trial(W, habituation_highInefficient_path(), habObs)
  }
  
  # In the control condition, the test occurs with obstacle removed.
  testObs = obstacle_cells_absent()
  
  if (testType == "lowEfficient") {
    W = run_trial(W, lowEfficient_path(), testObs)
    score = prediction_score(W, jump_critical_cells_lowEfficient())
  } else {
    W = run_trial(W, habituation_highInefficient_path(), testObs)
    score = prediction_score(W, jump_critical_cells_highInefficient())
  }
  
  score
}


###############################################################################
# SECTION 14 — RUN THE FULL SIMULATION ACROSS PARTICIPANTS
###############################################################################
# This reproduces the four condition structure across multiple random starts.
###############################################################################

simulate_all = function() {
  
  results = data.frame(
    participant = integer(),
    condition = character(),
    score = numeric(),
    stringsAsFactors = FALSE
  )
  
  # LOOP PURPOSE:
  # Simulate multiple independent participants. Each participant begins with a
  # fresh random weight matrix for each condition.
  for (p in 1:N_PARTICIPANTS) {
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "exp_low_efficient",
        score = run_condition_exp(TRUE, "lowEfficient"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "exp_high_inefficient",
        score = run_condition_exp(TRUE, "highInefficient"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "cntrl_low_efficient",
        score = run_condition_cntrl(FALSE, "lowEfficient"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "cntrl_high_inefficient",
        score = run_condition_cntrl(FALSE, "highInefficient"),
        stringsAsFactors = FALSE
      )
    )
  }
  
  results
}


###############################################################################
# SECTION 15 — SUMMARIZE RESULTS
###############################################################################
# Compute mean score for each condition.
###############################################################################

summarize_results = function(results) {
  aggregate(score ~ condition, data = results, FUN = mean)
}

# ---- Full simulation across all conditions and participants ----
results = simulate_all()
cat("Condition means:\n")
print(summarize_results(results))
# look at the dataframe
#fix(results)

# get current working directory
getwd()
# set working directory to move data below to the right folder
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/overWalleOriginal")
# save data to text file
write.table(results,
            file = "C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/overWalleOriginal/sim4a/overwalleOriginal_sim4a.txt",
            sep = " ",
            row.names = FALSE,
            col.names = FALSE,
            quote = FALSE
)
