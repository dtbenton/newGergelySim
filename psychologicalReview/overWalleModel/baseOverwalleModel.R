###############################################################################
# VAN OVERWALLE-STYLE SIMULATION OF THE GERGELY ET AL. (1995) OBSTACLE PARADIGM
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
# SECTION 6 — CONVERT ACTIVATION VECTOR TO 5 x 5 GRID
###############################################################################
# This helper lets you inspect the spatial units in grid form.
#
# It ignores Agent and Goal and returns only the 25 spatial locations
# arranged as a 5 x 5 matrix.
###############################################################################

grid_from_activation = function(vec) {
  
  mat = matrix(0, nrow = GRID_ROWS, ncol = GRID_COLS)
  
  # LOOP PURPOSE:
  # Fill each cell of the 5 x 5 matrix with the activation value of the
  # corresponding named grid unit (e.g., R3C2).
  for (r in 1:GRID_ROWS) {
    
    # LOOP PURPOSE:
    # Step across columns within the current row and place the unit's
    # activation into the matrix.
    for (c in 1:GRID_COLS) {
      
      mat[r, c] = vec[unit_name(r, c)]
    }
  }
  
  mat
}


###############################################################################
# SECTION 7 — PRINT A SPATIAL GRID NICELY
###############################################################################
# This is useful when you want to inspect settling cycle by cycle
# in the console.
###############################################################################

print_grid = function(mat, digits = 3) {
  
  # Reverse the row order for printing so the top printed row corresponds
  # to the top of the spatial field, even though row 1 is defined as bottom.
  print(round(mat[GRID_ROWS:1, , drop = FALSE], digits))
}


###############################################################################
# SECTION 8 — PLOT A SPATIAL GRID USING ONLY BASE R
###############################################################################
# This helper makes it possible to visually watch activation spread.
###############################################################################

plot_grid = function(mat, main = "") {
  
  # Reverse row order for plotting so the visual display matches ordinary
  # top-to-bottom spatial intuition.
  display_mat = mat[GRID_ROWS:1, , drop = FALSE]
  
  image(
    x = 1:ncol(display_mat),
    y = 1:nrow(display_mat),
    z = t(display_mat),
    main = main,
    xlab = "Column",
    ylab = "Row"
  )
}


###############################################################################
# SECTION 9 — RECURRENT SETTLING (FINAL STATE ONLY)
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
    
    int = as.vector(sender %*% W)
    names(int) = UNITS
  }
  
  int
}


###############################################################################
# SECTION 10 — RECURRENT SETTLING WITH FULL TRACE HISTORY
###############################################################################
# This is the trace-mode version of settling.
#
# Instead of returning only the final internal state, it stores the full
# activation history after each recurrent cycle.
#
# This lets you literally watch the network settle.
###############################################################################

settle_internal_trace = function(ext, W, n_cycles = N_CYCLES) {
  
  # Internal state begins at zero.
  int = setNames(rep(0, N_UNITS), UNITS)
  
  # This list will store the internal state after each recurrent cycle.
  history = vector("list", n_cycles)
  
  # LOOP PURPOSE:
  # Run the recurrent settling process cycle by cycle and save the internal
  # activation pattern after each cycle so it can later be inspected or plotted.
  for (cycle in 1:n_cycles) {
    
    sender = ext + int
    
    int = as.vector(sender %*% W)
    names(int) = UNITS
    
    # Save a copy of the internal state after this cycle.
    history[[cycle]] = int
  }
  
  history
}


###############################################################################
# SECTION 11 — DELTA RULE LEARNING
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
# SECTION 12 — RUN A SINGLE MOVEMENT STEP
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
# SECTION 13 — RUN A SINGLE MOVEMENT STEP WITH TRACE MODE
###############################################################################
# This is the trace-mode version of run_step.
#
# It behaves like run_step, but it also saves:
#   - the cycle-by-cycle internal activation history
#   - the 5 x 5 spatial activation grids for each cycle
#
# Useful when you want to watch the network settle on a particular step.
###############################################################################

run_step_trace = function(W, cell, obstacleCells, isFinal) {
  
  ext = make_external_pattern(cell, obstacleCells, isFinal)
  
  # Get full recurrent history rather than only the final state.
  history = settle_internal_trace(ext, W)
  
  # Final internal state is the last cycle in the history.
  int = history[[length(history)]]
  
  # Update weights using the final settled internal state.
  W = delta_update(W, ext, int)
  
  # Convert each internal activation vector into a 5 x 5 grid for convenience.
  grid_history = vector("list", length(history))
  
  # LOOP PURPOSE:
  # Turn each stored recurrent-cycle activation vector into a spatial 5 x 5
  # matrix so the settling process can be printed or plotted more easily.
  for (i in 1:length(history)) {
    grid_history[[i]] = grid_from_activation(history[[i]])
  }
  
  list(
    W = W,
    ext = ext,
    int = int,
    history = history,
    grid_history = grid_history
  )
}


###############################################################################
# SECTION 14 — TRAJECTORY DEFINITIONS
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

obstacle_cells_present = function() {
  c(unit_name(1, 3))
}

obstacle_cells_absent = function() {
  character()
}


###############################################################################
# SECTION 15 — RUN A WHOLE TRIAL
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
# SECTION 16 — RUN A WHOLE TRIAL WITH TRACE MODE
###############################################################################
# This version lets you trace the settling dynamics for every step in the path.
#
# It returns:
#   - the updated weights
#   - a list of detailed per-step trace records
#
# Each step record includes:
#   ext
#   int
#   cycle-by-cycle activation history
#   cycle-by-cycle spatial grids
###############################################################################

run_trial_trace = function(W, path, obstacleCells) {
  
  step_records = vector("list", length(path))
  
  # LOOP PURPOSE:
  # Iterate through every step in the path and store a full trace record
  # for that step, including recurrent settling history.
  for (k in seq_along(path)) {
    
    isFinal = (k == length(path))
    
    out = run_step_trace(
      W = W,
      cell = path[[k]],
      obstacleCells = obstacleCells,
      isFinal = isFinal
    )
    
    W = out$W
    
    step_records[[k]] = list(
      step_number = k,
      cell = path[[k]],
      isFinal = isFinal,
      ext = out$ext,
      int = out$int,
      history = out$history,
      grid_history = out$grid_history
    )
  }
  
  list(
    W = W,
    step_records = step_records
  )
}


###############################################################################
# SECTION 17 — PREDICTION / EXPECTATION PROBE
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
# SECTION 18 — PREDICTION PROBE WITH TRACE MODE
###############################################################################
# This version stores the full cycle-by-cycle settling history for the
# expectation probe.
###############################################################################

prediction_score_trace = function(W, criticalCells) {
  
  ext = setNames(rep(0, N_UNITS), UNITS)
  ext["Agent"] = 1
  ext["Goal"] = 0.4
  
  history = settle_internal_trace(ext, W)
  int = history[[length(history)]]
  
  grid_history = vector("list", length(history))
  
  # LOOP PURPOSE:
  # Convert each cycle's internal activation vector into a 5 x 5 spatial
  # matrix for easy visualization of the expectation dynamics.
  for (i in 1:length(history)) {
    grid_history[[i]] = grid_from_activation(history[[i]])
  }
  
  list(
    score = mean(int[criticalCells]),
    ext = ext,
    int = int,
    history = history,
    grid_history = grid_history
  )
}


###############################################################################
# SECTION 19 — CRITICAL CELLS FOR STRAIGHT VS JUMP ROUTES
###############################################################################
# These are the cells used when computing how strongly the network expects
# the straight route vs. the jump route.
###############################################################################

straight_critical_cells = function() {
  c(unit_name(1, 2), unit_name(1, 3), unit_name(1, 4))
}

jump_critical_cells = function() {
  c(unit_name(3, 2), unit_name(3, 3), unit_name(3, 4))
}


###############################################################################
# SECTION 20 — RUN ONE EXPERIMENTAL CONDITION
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

run_condition = function(habObstaclePresent, testType) {
  
  W = init_weights()
  
  if (habObstaclePresent) {
    habObs = obstacle_cells_present()
  } else {
    habObs = obstacle_cells_absent()
  }
  
  # LOOP PURPOSE:
  # Simulate repeated habituation exposures. Each iteration is one complete
  # habituation trial through the jump path.
  for (t in 1:N_HABITUATION) {
    W = run_trial(W, jumping_path(), habObs)
  }
  
  # In this simulation, the test occurs with obstacle removed.
  testObs = obstacle_cells_absent()
  
  if (testType == "straight") {
    W = run_trial(W, straight_path(), testObs)
    score = prediction_score(W, straight_critical_cells())
  } else {
    W = run_trial(W, jumping_path(), testObs)
    score = prediction_score(W, jump_critical_cells())
  }
  
  score
}


###############################################################################
# SECTION 21 — RUN ONE EXPERIMENTAL CONDITION WITH TRACE MODE
###############################################################################
# This version returns not only the final score, but also detailed trace
# information from the test trial and the final expectation probe.
#
# This is the version to use if you want to watch the network settle.
###############################################################################

run_condition_trace = function(habObstaclePresent, testType) {
  
  W = init_weights()
  
  if (habObstaclePresent) {
    habObs = obstacle_cells_present()
  } else {
    habObs = obstacle_cells_absent()
  }
  
  # LOOP PURPOSE:
  # Repeated habituation trials with learning. These are not individually traced
  # here, because the main interest is usually the traced behavior at test.
  for (t in 1:N_HABITUATION) {
    W = run_trial(W, jumping_path(), habObs)
  }
  
  testObs = obstacle_cells_absent()
  
  if (testType == "straight") {
    test_out = run_trial_trace(W, straight_path(), testObs)
    W = test_out$W
    probe_out = prediction_score_trace(W, straight_critical_cells())
  } else {
    test_out = run_trial_trace(W, jumping_path(), testObs)
    W = test_out$W
    probe_out = prediction_score_trace(W, jump_critical_cells())
  }
  
  list(
    W = W,
    test_trace = test_out,
    probe_trace = probe_out,
    score = probe_out$score
  )
}


###############################################################################
# SECTION 22 — RUN THE FULL SIMULATION ACROSS PARTICIPANTS
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
        condition = "obstacle_straight",
        score = run_condition(TRUE, "straight"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "obstacle_jump",
        score = run_condition(TRUE, "jump"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "noObstacle_straight",
        score = run_condition(FALSE, "straight"),
        stringsAsFactors = FALSE
      )
    )
    
    results = rbind(
      results,
      data.frame(
        participant = p,
        condition = "noObstacle_jump",
        score = run_condition(FALSE, "jump"),
        stringsAsFactors = FALSE
      )
    )
  }
  
  results
}


###############################################################################
# SECTION 23 — SUMMARIZE RESULTS
###############################################################################
# Compute mean score for each condition.
###############################################################################

summarize_results = function(results) {
  aggregate(score ~ condition, data = results, FUN = mean)
}


###############################################################################
# SECTION 24 — PRINT THE SETTLING TRACE FOR A GIVEN STEP
###############################################################################
# This helper prints the spatial grid after each recurrent cycle for one step.
###############################################################################

print_step_trace = function(step_record, digits = 3) {
  
  cat("\n============================================================\n")
  cat("STEP", step_record$step_number, "\n")
  cat("Cell:", paste(step_record$cell, collapse = ","), "\n")
  cat("Final step:", step_record$isFinal, "\n")
  cat("============================================================\n")
  
  # LOOP PURPOSE:
  # Print the 5 x 5 spatial activation matrix after each recurrent cycle
  # for the selected step.
  for (cycle in 1:length(step_record$grid_history)) {
    cat("\nCycle", cycle, "\n")
    print_grid(step_record$grid_history[[cycle]], digits = digits)
  }
}


###############################################################################
# SECTION 25 — PLOT THE SETTLING TRACE FOR A GIVEN STEP
###############################################################################
# This helper displays the recurrent cycles one by one using base R plots.
###############################################################################

plot_step_trace = function(step_record, pause = 0.8) {
  
  # LOOP PURPOSE:
  # Plot each recurrent cycle in sequence, allowing you to visually watch
  # activation evolve over time.
  for (cycle in 1:length(step_record$grid_history)) {
    plot_grid(
      step_record$grid_history[[cycle]],
      main = paste(
        "Step", step_record$step_number,
        "- Cycle", cycle,
        "- Cell", paste(step_record$cell, collapse = ",")
      )
    )
    Sys.sleep(pause)
  }
}


###############################################################################
# SECTION 26 — PRINT THE PREDICTION PROBE TRACE
###############################################################################
# This helper prints the cycle-by-cycle settling of the final expectation probe.
###############################################################################

print_probe_trace = function(probe_trace, digits = 3) {
  
  cat("\n============================================================\n")
  cat("PREDICTION PROBE TRACE\n")
  cat("Score:", round(probe_trace$score, digits), "\n")
  cat("============================================================\n")
  
  # LOOP PURPOSE:
  # Print the 5 x 5 activation pattern after each recurrent cycle of the final
  # expectation probe.
  for (cycle in 1:length(probe_trace$grid_history)) {
    cat("\nProbe Cycle", cycle, "\n")
    print_grid(probe_trace$grid_history[[cycle]], digits = digits)
  }
}


###############################################################################
# SECTION 27 — PLOT THE PREDICTION PROBE TRACE
###############################################################################
# This helper animates the final expectation probe cycle by cycle.
###############################################################################

plot_probe_trace = function(probe_trace, pause = 0.8) {
  
  # LOOP PURPOSE:
  # Plot each recurrent cycle from the expectation probe in order so you can
  # visually inspect which route gains activation.
  for (cycle in 1:length(probe_trace$grid_history)) {
    plot_grid(
      probe_trace$grid_history[[cycle]],
      main = paste("Prediction Probe - Cycle", cycle)
    )
    Sys.sleep(pause)
  }
}


###############################################################################
# SECTION 28 — EXAMPLE USAGE
###############################################################################
# The examples below show how to:
#   1. run the full simulation
#   2. run a traceable single condition
#   3. print or plot settling for a specific step
#   4. print or plot the final expectation probe
###############################################################################

# ---- Full simulation across all conditions and participants ----
results = simulate_all()
cat("Condition means:\n")
print(summarize_results(results))

# ---- Single traced condition example ----
# This runs one network through:
#   obstacle habituation -> straight test
# and stores detailed test/probe settling traces.
trace_example = run_condition_trace(
  habObstaclePresent = TRUE,
  testType = "straight"
)

cat("\nSingle traced condition score:\n")
print(trace_example$score)

# ---- Print the settling dynamics for the FIRST step of the test trial ----
print_step_trace(trace_example$test_trace$step_records[[1]])

# ---- Print the settling dynamics for the FINAL expectation probe ----
print_probe_trace(trace_example$probe_trace)

# ---- To animate the first test step, uncomment this ----
plot_step_trace(trace_example$test_trace$step_records[[1]], pause = 1.0)

# ---- To animate the final prediction probe, uncomment this ----
plot_probe_trace(trace_example$probe_trace, pause = 1.0)

# ---- To see what the activation grid looks like a various points in the motion trajectory ----
# Initialize weights
W = init_weights()

# Run ONE traced habituation trial (with obstacle present)
hab_trace = run_trial_trace(
  W = W,
  path = jumping_path(),
  obstacleCells = obstacle_cells_present()
)

# See what the external grid looks like at the beginning of a curved
# motion + barrier event at step 1
print_grid(grid_from_activation(hab_trace$step_records[[1]]$ext))

# See what the external grid looks like at when the agent is next to the barrier in the curved
# motion + barrier event at step 1
print_grid(grid_from_activation(hab_trace$step_records[[2]]$ext))
