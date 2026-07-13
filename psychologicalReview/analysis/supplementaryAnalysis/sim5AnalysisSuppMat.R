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


## SIMULATION 5A ##
# Set working directory to the parent folder containing:
# effective/
# ineffective/
# Set working directory to the parent folder containing:
# effective/
# ineffective/
setwd(
  "C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/data_supMat/ALIAS/sim5a"
)

# Matches integers and decimals such as:
# 225, 8, 0.01, 0.00875, 0.0003875, and .0003875
num_pattern = "[0-9]*\\.?[0-9]+"

# Filename examples:
#
# Study_sim5a_pEpochs_225_control_habEvent_sim5aCntrlHab_
# tEpochs_8_actionEpochs_8_lr_0.01_sLR_.0003875_sWD_0.0975
#
# Study_sim5a_pEpochs_225_hab_habEvent_sim5aExpHab_
# tEpochs_8_actionEpochs_8_lr_0.01_sLR_.0003875_sWD_0.0975
#
# Captured fields:
# 1. pEpochs
# 2. training condition: control or hab
# 3. habituation event: CntrlHab or ExpHab
# 4. tEpochs
# 5. actionEpochs
# 6. developmental learning rate
# 7. salient learning rate
# 8. salient weight decay
file_pattern = paste0(
  "^Study_sim5a_",
  "pEpochs_([0-9]+)_",
  "(control|hab)_",
  "habEvent_sim5a(CntrlHab|ExpHab)_",
  "tEpochs_([0-9]+)_",
  "actionEpochs_([0-9]+)_",
  "lr_(",  num_pattern, ")_",
  "sLR_(", num_pattern, ")_",
  "sWD_(", num_pattern, ")",
  "(?:\\.txt)?$"
)

# Find files recursively in both effective and ineffective folders
all_files = list.files(
  path = ".",
  recursive = TRUE,
  full.names = TRUE
)

# Keep only files whose base names match the sim5a pattern
files = all_files[
  grepl(
    pattern = file_pattern,
    x = basename(all_files),
    perl = TRUE
  )
]

# Validate the number of matched files
if (length(files) == 0) {
  stop("No files matched the expected sim5a filename pattern.")
}

if (length(files) != 30) {
  warning(
    paste0(
      "Expected 30 files based on the screenshots, but matched ",
      length(files),
      " files."
    )
  )
}

# Extract all filename parameters
extract_file_parameters = function(filename) {
  
  match_result = regexec(
    pattern = file_pattern,
    text = filename,
    perl = TRUE
  )
  
  extracted = regmatches(
    x = filename,
    m = match_result
  )[[1]]
  
  if (length(extracted) == 0) {
    stop(
      paste(
        "Could not extract parameters from:",
        filename
      )
    )
  }
  
  data.frame(
    pEpochs = as.numeric(extracted[2]),
    trainingCondition = extracted[3],
    habEvent = extracted[4],
    epochs = as.numeric(extracted[5]),
    actionEpochs = as.numeric(extracted[6]),
    developmentalLR = as.numeric(extracted[7]),
    salientLR = as.numeric(extracted[8]),
    salientWD = as.numeric(extracted[9]),
    stringsAsFactors = FALSE
  )
}

# Read and annotate each file
data_list = lapply(files, function(file_path) {
  
  filename = basename(file_path)
  
  df = read.table(
    file = file_path,
    header = FALSE,
    stringsAsFactors = FALSE,
    col.names = c(
      "response",
      "consistency",
      "value"
    )
  )
  
  # Each sim5a file should contain 80 observations
  if (nrow(df) != 80) {
    stop(
      paste0(
        filename,
        " contains ",
        nrow(df),
        " rows instead of 80."
      )
    )
  }
  
  parameters = extract_file_parameters(filename)
  
  # Determine whether the file came from the effective
  # or ineffective folder
  parent_folder = basename(dirname(file_path))
  
  if (!parent_folder %in% c("effective", "ineffective")) {
    stop(
      paste0(
        "Unexpected parent folder for ",
        filename,
        ": ",
        parent_folder
      )
    )
  }
  
  # Add folder and filename parameters to every row
  df$effectiveness = parent_folder
  df$trainingCondition = parameters$trainingCondition
  df$habEvent = parameters$habEvent
  df$pEpochs = parameters$pEpochs
  df$epochs = parameters$epochs
  df$actionEpochs = parameters$actionEpochs
  df$developmentalLR = parameters$developmentalLR
  df$salientLR = parameters$salientLR
  df$salientWD = parameters$salientWD
  df$sourceFile = filename
  df$sourcePath = file_path
  
  df
})

# Combine all files into one large dataframe
D = do.call(
  rbind,
  data_list
)

# Reset row names
rownames(D) = NULL

# Optional combined condition identifier
D$simulationCondition = paste(
  D$effectiveness,
  D$trainingCondition,
  D$habEvent,
  sep = "-"
)

# Arrange columns
D = D[
  c(
    "response",
    "consistency",
    "value",
    "effectiveness",
    "trainingCondition",
    "habEvent",
    "simulationCondition",
    "pEpochs",
    "epochs",
    "actionEpochs",
    "developmentalLR",
    "salientLR",
    "salientWD",
    "sourceFile",
    "sourcePath"
  )
]

# -----------------------------
# Validation checks
# -----------------------------

length(files)  # expected: 30
nrow(D)        # expected: 2400

# Number of rows from each folder
table(D$effectiveness)

# Expected from the screenshots:
# effective   = 1600 rows: 20 files × 80
# ineffective =  800 rows: 10 files × 80

# Training condition, habituation event, and effectiveness
table(
  D$effectiveness,
  D$trainingCondition,
  D$habEvent
)

# Confirm that every imported file supplied exactly 80 rows
file_row_counts = table(D$sourcePath)

file_row_counts

stopifnot(
  length(files) == 30,
  nrow(D) == 2400,
  all(file_row_counts == 80)
)

# add effectiveness column
D$effectiveness = rep(c("Effective", "Ineffective"), times = c(1600,800))

# create two separate dataframes to add a parameterSet column
D$simulationCondition = as.factor(D$simulationCondition)

D.effective = subset(D, ! simulationCondition %in% c("ineffective-hab-ExpHab"))
D.effective$parameterSet = rep(c("Dev. LR = 0.00875; Salient LR = 0.0004; Salient WD = 0.09875",
                                 "Dev. LR = 0.01; Salient LR = 0.0003875; Salient WD = 0.0975"),
                               each = 80, times = 10)

D.ineffective = subset(D, ! simulationCondition %in% c("effective-control-CntrlHab",
                                                       "effective-hab-ExpHab"))
D.ineffective$parameterSet = rep(c("Dev. LR = 0.00875; Salient LR = 0.0004; Salient WD = 0.09875",
                       "Dev. LR = 0.01; Salient LR = 0.0003875; Salient WD = 0.0975"),
                     each = 80, times = 5)

# combine dataframes
D = rbind(D.effective, D.ineffective)
dim(D)

# create an ID column
D$ID = rep(1:1200, each = 2)

# create condition column
D$condition = rep(c("Control", "Experimental"), 
                  times = c(800,1600))

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 1200)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = as.factor(D$epochs)
levels(D$epochs)


# developmental learning rate
D$developmentalLR = as.factor(D$developmentalLR)
levels(D$developmentalLR)

# salient learning rate
D$salientLR = as.factor(D$salientLR)
levels(D$salientLR)

# salient weight decay
D$salientWD = as.factor(D$salientWD)
levels(D$salientWD)

# create a 'looking time' column
D$lookingTime = D$value

# remove columns
D = D[,c(17,9,4,16,18,19,20)]

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

D.experimental.effective = subset(D, ! condition %in% c("Control"))
D.experimental.effective = subset(D.experimental.effective,
                                  ! effectiveness %in% c("Ineffective"))

D.control.effective = subset(D, ! condition %in% c("Experimental"))
D.control.effective = subset(D.control.effective , 
                             ! effectiveness %in% c("Ineffective"))


D.experimental.ineffective = subset(D, ! condition %in% c("Control"))
D.experimental.ineffective = subset(D.experimental.ineffective, 
                                    ! effectiveness %in% c("Effective"))

p.exp.effective = ggplot(D.experimental.effective, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 200)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  ggtitle("Simulation 5 Robustness Check Across Parameter Configurations and Habituation Lengths") +
  facet_wrap(parameterSet~epochs) +
  theme(axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25), 
        legend.text=element_text(size=25),
        legend.title = element_text(size=25),
        axis.title=element_text(size=25),
        plot.title = element_text(
          size = 30,
          face = "bold",
          hjust = 0.5  
        ),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "bottom")

setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("suppMatFigs6_exp_effective.png", 
       plot = p.exp.effective, 
       width = 28, height = 18, dpi = 300)


p.cntrl.effective = ggplot(D.control.effective, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 500)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  ggtitle("Simulation 5 Robustness Check Across Parameter Configurations and Habituation Lengths") +
  facet_wrap(parameterSet~epochs) +
  theme(axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25), 
        legend.text=element_text(size=25),
        legend.title = element_text(size=25),
        axis.title=element_text(size=25),
        plot.title = element_text(
          size = 30,
          face = "bold",
          hjust = 0.5  
        ),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "bottom")

setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("suppMatFigs6_cntrl_effective.png", 
       plot = p.cntrl.effective, 
       width = 28, height = 18, dpi = 300)



p.exp.ineffective = ggplot(D.experimental.ineffective, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 475)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  ggtitle("Simulation 5 Robustness Check Across Parameter Configurations and Habituation Lengths") +
  facet_wrap(parameterSet~epochs) +
  theme(axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25), 
        legend.text=element_text(size=25),
        legend.title = element_text(size=25),
        axis.title=element_text(size=25),
        plot.title = element_text(
          size = 30,
          face = "bold",
          hjust = 0.5  
        ),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "bottom")

setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("suppMatFigs6_exp_ineffective.png", 
       plot = p.exp.ineffective, 
       width = 28, height = 18, dpi = 300)



## SIMULATION 5F ##
# Set working directory
setwd(
  "C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/data_supMat/ALIAS/sim5f"
)

# Matches integers and decimals such as:
# 225, 8, 0.01, 0.00875, 0.0003875, and .0003875
num_pattern = "[0-9]*\\.?[0-9]+"

# Filename examples:
#
# Study_sim5f_pEpochs_225_control_habEvent_sim5fCntrlHab_
# tEpochs_8_lr_0.01_sLR_.0003875_sWD_0.0975
#
# Study_sim5f_pEpochs_225_hab_habEvent_sim5fExpHab_
# tEpochs_8_lr_0.01_sLR_.0003875_sWD_0.0975
#
# Captured fields:
# 1. pEpochs
# 2. training condition: control or hab
# 3. habituation event: CntrlHab or ExpHab
# 4. tEpochs
# 5. developmental learning rate
# 6. salient learning rate
# 7. salient weight decay
file_pattern = paste0(
  "^Study_sim5f_",
  "pEpochs_([0-9]+)_",
  "(control|hab)_",
  "habEvent_sim5f(CntrlHab|ExpHab)_",
  "tEpochs_([0-9]+)_",
  "lr_(",  num_pattern, ")_",
  "sLR_(", num_pattern, ")_",
  "sWD_(", num_pattern, ")",
  "(?:\\.txt)?$"
)

# Find matching files in the current folder only
files = list.files(
  path = ".",
  full.names = TRUE
)

files = files[
  grepl(
    pattern = file_pattern,
    x = basename(files),
    perl = TRUE
  )
]

# Check that files were found
if (length(files) == 0) {
  stop("No files matched the expected sim5f filename pattern.")
}

# The screenshot shows 20 files
if (length(files) != 20) {
  warning(
    paste0(
      "Expected 20 files, but matched ",
      length(files),
      " files."
    )
  )
}

# Extract all parameters from one filename
extract_file_parameters = function(filename) {
  
  match_result = regexec(
    pattern = file_pattern,
    text = filename,
    perl = TRUE
  )
  
  extracted = regmatches(
    x = filename,
    m = match_result
  )[[1]]
  
  if (length(extracted) == 0) {
    stop(
      paste(
        "Could not extract parameters from:",
        filename
      )
    )
  }
  
  data.frame(
    pEpochs = as.numeric(extracted[2]),
    trainingCondition = extracted[3],
    habEvent = extracted[4],
    epochs = as.numeric(extracted[5]),
    developmentalLR = as.numeric(extracted[6]),
    salientLR = as.numeric(extracted[7]),
    salientWD = as.numeric(extracted[8]),
    stringsAsFactors = FALSE
  )
}

# Read and annotate each file
data_list = lapply(files, function(file_path) {
  
  filename = basename(file_path)
  
  df = read.table(
    file = file_path,
    header = FALSE,
    stringsAsFactors = FALSE,
    col.names = c(
      "response",
      "consistency",
      "value"
    )
  )
  
  parameters = extract_file_parameters(filename)
  
  # Add filename parameters to every row
  df$trainingCondition = parameters$trainingCondition
  df$habEvent = parameters$habEvent
  df$pEpochs = parameters$pEpochs
  df$epochs = parameters$epochs
  df$developmentalLR = parameters$developmentalLR
  df$salientLR = parameters$salientLR
  df$salientWD = parameters$salientWD
  df$sourceFile = filename
  
  df
})

# Combine all files into one dataframe
D.2 = do.call(
  rbind,
  data_list
)

# Reset row names
rownames(D.2) = NULL

# Optional combined condition label
D.2$simulationCondition = paste(
  D.2$trainingCondition,
  D.2$habEvent,
  sep = "-"
)

# Arrange columns
D.2 = D.2[
  c(
    "response",
    "consistency",
    "value",
    "trainingCondition",
    "habEvent",
    "simulationCondition",
    "pEpochs",
    "epochs",
    "developmentalLR",
    "salientLR",
    "salientWD",
    "sourceFile"
  )
]



# Reset row names
rownames(D.2) = NULL



# create an ID column
D.2$ID = rep(1:400, each = 2)

# create condition column
D.2$condition = rep(c("Control", "Experimental"), 
                    each = 400)

D.2$condition = factor(D.2$condition, 
                       levels = c("Experimental", "Control"))

# create trial type column
D.2$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 400)
D.2$trialType = as.factor(D.2$trialType)

# parameter set
D.2$parameterSet = rep(c("Dev. LR = 0.00875; Salient LR = 0.0004; Salient WD = 0.09875",
                       "Dev. LR = 0.01; Salient LR = 0.0003875; Salient WD = 0.0975"), 
                     each = 40, times = 10)
D.2$parameterSet = as.factor(D.2$parameterSet)

# epochs
D.2$epochs = as.factor(D.2$epochs)
levels(D.2$epochs)


# developmental learning rate
D.2$developmentalLR = as.factor(D.2$developmentalLR)
levels(D.2$developmentalLR)

# salient learning rate
D.2$salientLR = as.factor(D.2$salientLR)
levels(D.2$salientLR)

# salient weight decay
D.2$salientWD = as.factor(D.2$salientWD)
levels(D.2$salientWD)

# create a 'looking time' column
D.2$lookingTime = D.2$value

# remove columns
D.2 = D.2[,c(13,14,16,8,15,17)]


###################
## OMNIBUS FIGURE ##
####################
D.2.experimental = subset(D.2, ! condition %in% c("Control"))
D.2.control = subset(D.2, ! condition %in% c("Experimental"))

p.d.2.exp = ggplot(D.2.experimental, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 500)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  ggtitle("Simulation 5 Robustness Check Across Parameter Configurations and Habituation Lengths") +
  facet_wrap(parameterSet~epochs) +
  theme(axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25), 
        legend.text=element_text(size=25),
        legend.title = element_text(size=25),
        axis.title=element_text(size=25),
        plot.title = element_text(
          size = 30,
          face = "bold",
          hjust = 0.5  
        ),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "bottom")

setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("suppMatFigs7_exp.png", 
       plot = p.d.2.exp, 
       width = 28, height = 18, dpi = 300)


p.d.2.cntrl = ggplot(D.2.control, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 500)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  ggtitle("Simulation 5 Robustness Check Across Parameter Configurations and Habituation Lengths") +
  facet_wrap(parameterSet~epochs) +
  theme(axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25), 
        legend.text=element_text(size=25),
        legend.title = element_text(size=25),
        axis.title=element_text(size=25),
        plot.title = element_text(
          size = 30,
          face = "bold",
          hjust = 0.5  
        ),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "bottom")

setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("suppMatFigs7_cntrl.png", 
       plot = p.d.2.cntrl, 
       width = 28, height = 18, dpi = 300)
