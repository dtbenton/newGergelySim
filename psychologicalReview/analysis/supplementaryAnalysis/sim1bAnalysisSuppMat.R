###################################
###################################
##                               ##
## SIMULATION 1a ANALYSIS: ALIAS ##
##                               ##
###################################
###################################


# load libraries 
library(lme4)
library(nlme)
library(boot)
library(car) 
library(reshape2)
library(ggplot2)
library(ez)
library(plyr)
library(ggsignif)
library(lsr)
library(sjmisc)
library(sjstats)
library(BayesFactor)
library(foreign)
library(dplyr)
library(lattice)
library(Hmisc)



# Set working directory
setwd(
  "C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data_supMat/ALIAS/sim1b"
)

# Number pattern that accepts values such as:
# 900, 0.0975, .0003875, etc.
num_pattern = "[0-9]*\\.?[0-9]+"

# Match the new filename structure
file_pattern = paste0(
  "^pEpochs_[0-9]+_",
  "tEpochs_[0-9]+_",
  "condition_pretrain[0-9]+_",
  "testEvent_[^_]+_",
  "habEvent_[^_]+_",
  "lr_", num_pattern, "_",
  "sLR_", num_pattern, "_",
  "sWD_", num_pattern,
  "(\\.txt)?$"
)

# Search all pretraining folders
files = list.files(
  path = ".",
  recursive = TRUE,
  full.names = TRUE
)

# Retain only simulation output files
files = files[
  !grepl("\\.Rhistory$|\\.gitkeep$", files) &
    grepl(file_pattern, basename(files))
]

stopifnot(length(files) > 0)

# Helper function for extracting numeric filename parameters
extract_parameter = function(filename, prefix) {
  
  value = sub(
    paste0("^.*_", prefix, "_(", num_pattern, ").*$"),
    "\\1",
    filename
  )
  
  as.numeric(value)
}

# Read and annotate each file
data_list = lapply(files, function(f) {
  
  fname = basename(f)
  folder = basename(dirname(f))
  
  df = read.table(
    f,
    header = FALSE,
    stringsAsFactors = FALSE,
    col.names = c(
      "response",
      "trial_type",
      "value"
    )
  )
  
  # Pretraining condition, e.g., pretrain1000
  df$pretrain = as.numeric(
    sub(
      "^.*_condition_pretrain([0-9]+)_.*$",
      "\\1",
      fname
    )
  )
  
  # Pretraining epochs
  df$pEpochs = as.numeric(
    sub(
      "^pEpochs_([0-9]+)_.*$",
      "\\1",
      fname
    )
  )
  
  # Habituation/training epochs
  df$tEpochs = as.numeric(
    sub(
      "^.*_tEpochs_([0-9]+)_condition_.*$",
      "\\1",
      fname
    )
  )
  
  # Test-event name
  df$testEvent = sub(
    "^.*_testEvent_([^_]+)_habEvent_.*$",
    "\\1",
    fname
  )
  
  # Habituation-event name
  df$habEvent = sub(
    "^.*_habEvent_([^_]+)_lr_.*$",
    "\\1",
    fname
  )
  
  # Training condition
  df$condition = ifelse(
    grepl("_habEvent_[^_]*CntrlHab_", fname),
    "control",
    ifelse(
      grepl("_habEvent_[^_]*ExpHab_", fname),
      "exp",
      NA
    )
  )
  
  # Learning parameters
  df$lr = extract_parameter(
    fname,
    "lr"
  )
  
  df$sLR = extract_parameter(
    fname,
    "sLR"
  )
  
  df$sWD = extract_parameter(
    fname,
    "sWD"
  )
  
  # Source information
  df$source_file = fname
  df$source_folder = folder
  df$source_path = f
  
  df
})

# Combine all files
D = do.call(
  rbind,
  data_list
)

# Reset row names
rownames(D) = NULL



# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:2400, each = 2)

# create condition column
D$condition = rep(c("Control", "Experimental"), 
                  each = 80, times = 30)

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 2400)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = D$tEpochs
D$epochs = as.factor(D$epochs)
levels(D$epochs)

# parameter set
D$parameterSet = rep(c("Dev. LR = 0.0975; Salient LR = 0.0003875; Salient WD = 0.0975",
                       "Dev. LR = 0.09875; Salient LR = 0.0004; Salient WD = 0.09875"), each = 40, times = 60)
D$parameterSet = as.factor(D$parameterSet)

# developmental learning rate
D$developmentalLR = D$lr
D$developmentalLR = as.factor(D$developmentalLR)
levels(D$developmentalLR)

# salient learning rate
D$salientLR = D$sLR
D$salientLR = as.factor(D$salientLR)
levels(D$salientLR)

# salient weight decay
D$salientWD = D$sWD
D$salientWD = as.factor(D$salientWD)
levels(D$salientWD)

# create a 'looking time' column
D$lookingTime = D$value

# ratio
D$ratio = as.factor(D$pretrain)
D$ratio = revalue(D$ratio, c("1000" = "100% constrained vs. 0% unconstrained", 
                             "5050" = "50% constrained vs. 50% unconstrained",
                             "6040" = "60% constrained vs. 40% unconstrained",
                             "7030" = "70% constrained vs. 30% unconstrained",
                             "8020" = "80% constrained vs. 20% unconstrained",
                             "9010" = "90% constrained vs. 10% unconstrained"))

D$ratio = factor(D$ratio, levels = c("100% constrained vs. 0% unconstrained",
                                     "90% constrained vs. 10% unconstrained",
                                     "80% constrained vs. 20% unconstrained",
                                     "70% constrained vs. 30% unconstrained",
                                     "60% constrained vs. 40% unconstrained",
                                     "50% constrained vs. 50% unconstrained"))

D$ratio = factor(
  D$ratio,
  levels = c(
    "100% constrained vs. 0% unconstrained",
    "90% constrained vs. 10% unconstrained",
    "80% constrained vs. 20% unconstrained",
    "70% constrained vs. 30% unconstrained",
    "60% constrained vs. 40% unconstrained",
    "50% constrained vs. 50% unconstrained"
  )
)

# remove columns
D = D[,c(16,9,17:22,24,23)]

# confirm that it is a dataframe
is.data.frame(D)

# column names
# [1] "ID"          "condition"   "epochs"      "trialType"   "lookingTime"

####################
## OMNIBUS FIGURE ##
####################
###################
## OMNIBUS FIGURE ##
####################
# create two datafarmes based on parameter set
D.0975.0003875.0975 = subset(D, ! parameterSet %in% c("Dev. LR = 0.09875; Salient LR = 0.0004; Salient WD = 0.09875"))
D.09875.0004.09875 = subset(D, ! parameterSet %in% c("Dev. LR = 0.0975; Salient LR = 0.0003875; Salient WD = 0.0975"))


p = ggplot(
  D.0975.0003875.0975,
  aes(x = condition, y = lookingTime, fill = trialType)
) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = position_dodge(width = 0.9)
  ) +
  stat_summary(
    fun.data = mean_cl_boot,
    geom = "errorbar",
    position = position_dodge(width = 0.9),
    width = 0.2
  ) +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0.02))
  ) +
  coord_cartesian(ylim = c(0, 205)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(
    x = "Condition",
    y = "Network Error",
    fill = "Test Trial",
    title = paste0(
      "Simulation 1b Robustness Check Across Parameter Configurations ",
      "and Habituation Lengths\n",
      "Dev. LR = 0.0975; Salient LR = 0.0003875; Salient WD = 0.0975"
    )
  ) +
  facet_wrap(
    ~ epochs + ratio,
    ncol = 4
  ) +
  theme_bw(base_size = 16) +
  theme(
    plot.title = element_text(size = 30, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 25),
    axis.title.x = element_blank(),
    axis.text = element_text(size = 25),
    legend.position = "bottom",
    legend.text=element_text(size=25),
    legend.title = element_text(size=25),
    strip.text = element_text(size = 13, face = "bold",
                              margin = margin(3, 3, 3, 3)),
    panel.spacing = unit(0.7, "lines")
  )

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave(
  "suppMatFigs2_1b_0975_0003875_0975.png",
  plot = p,
  width = 20,
  height = 18,
  units = "in",
  dpi = 300
)



p.2 = ggplot(
  D.09875.0004.09875,
  aes(x = condition, y = lookingTime, fill = trialType)
) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = position_dodge(width = 0.9)
  ) +
  stat_summary(
    fun.data = mean_cl_boot,
    geom = "errorbar",
    position = position_dodge(width = 0.9),
    width = 0.2
  ) +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0.02))
  ) +
  coord_cartesian(ylim = c(0, 205)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(
    x = "Condition",
    y = "Network Error",
    fill = "Test Trial",
    title = paste0(
      "Simulation 1b Robustness Check Across Parameter Configurations ",
      "and Habituation Lengths\n",
      "Dev. LR = 0.09875; Salient LR = 0.0004; Salient WD = 0.09875"
    )
  ) +
  facet_wrap(
    ~ epochs + ratio,
    ncol = 4
  ) +
  theme_bw(base_size = 16) +
  theme(
    plot.title = element_text(size = 30, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 25),
    axis.text = element_text(size = 25),
    axis.title.x = element_blank(),
    legend.position = "bottom",
    legend.text=element_text(size=25),
    legend.title = element_text(size=25),
    strip.text = element_text(size = 13, face = "bold",
                              margin = margin(3, 3, 3, 3)),
    panel.spacing = unit(0.7, "lines")
  )

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave(
  "suppMatFigs2_1b_09875_0004_09875.png",
  plot = p.2,
  width = 20,
  height = 18,
  units = "in",
  dpi = 300
)




