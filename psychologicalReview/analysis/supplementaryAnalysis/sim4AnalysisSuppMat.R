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

# remove scientific notation
options(scipen=999)

# Set working directory
setwd(
  "C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/data_supMat/ALIAS/sim4a"
)

# Matches integers and decimals such as:
# 450, 8, 0.0875, 0.0003875, and .0003875
num_pattern = "[0-9]*\\.?[0-9]+"

# Matches both filename prefixes:
#
# Study__Condition_sim4a...
# Study_sim4a_Condition_sim4a...
#
# Note:
# Some files have two underscores after "Study":
# Study__Condition_sim4a...
file_pattern = paste0(
  "^Study_(?:_|sim4a_)",
  "Condition_sim4a(CntrlHab|Hab)_",
  "pEpochs_([0-9]+)_",
  "tEpochs_([0-9]+)_",
  "testEvent_sim4a(CntrlTest|Test)_",
  "lr_(",  num_pattern, ")_",
  "sLR_(", num_pattern, ")_",
  "sWD_(", num_pattern, ")",
  "(?:\\.txt)?$"
)

# Find all matching files
files = list.files(
  path = ".",
  pattern = file_pattern,
  full.names = TRUE
)

# Check that all 30 expected files were found
if (length(files) != 30) {
  stop(
    paste0(
      "Expected 30 files, but matched ",
      length(files),
      ". Run the unmatched-files check at the bottom of the script."
    )
  )
}

# Extract all parameters from a filename
extract_file_parameters = function(filename) {
  
  match_result = regexec(
    pattern = file_pattern,
    text = filename,
    perl = TRUE
  )
  
  extracted = regmatches(
    filename,
    match_result
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
    trainingCondition = extracted[2],
    pEpochs = as.numeric(extracted[3]),
    epochs = as.numeric(extracted[4]),
    testEvent = extracted[5],
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
  
  # Each file should contain 40 rows
  if (nrow(df) != 40) {
    stop(
      paste0(
        filename,
        " contains ",
        nrow(df),
        " rows instead of 40."
      )
    )
  }
  
  parameters = extract_file_parameters(filename)
  
  # Add filename parameters to every row from the file
  df$trainingCondition = parameters$trainingCondition
  df$testEvent = parameters$testEvent
  df$pEpochs = parameters$pEpochs
  df$epochs = parameters$epochs
  df$developmentalLR = parameters$developmentalLR
  df$salientLR = parameters$salientLR
  df$salientWD = parameters$salientWD
  df$sourceFile = filename
  
  df
})

# Combine all 30 files into one dataframe
D = do.call(
  rbind,
  data_list
)

# Reset row names
rownames(D) = NULL

# Add a combined condition column
D$trainingTestCondition = paste(
  D$trainingCondition,
  D$testEvent,
  sep = "-"
)

# Arrange columns
D = D[
  c(
    "response",
    "consistency",
    "value",
    "trainingCondition",
    "testEvent",
    "trainingTestCondition",
    "pEpochs",
    "epochs",
    "developmentalLR",
    "salientLR",
    "salientWD",
    "sourceFile"
  )
]




# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:600, each = 2)

# create condition column
D$condition = D$trainingTestCondition

D$condition = as.factor(D$condition)
D$condition = revalue(D$condition, c("CntrlHab-CntrlTest" = "Exp. 2", 
                             "CntrlHab-Test" = "Exp. 3",
                             "Hab-Test" = "Exp. 1"))

# create trial type column
D$trialType = rep(c("High", "Low"), each = 1, times = 600)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = as.factor(D$epochs)
levels(D$epochs)

# parameter set
D$parameterSet = rep(c("Dev. LR = 0.08625; Salient LR = 0.0004; Salient WD = 0.09875",
                       "Dev. LR = 0.0875; Salient LR = 0.0003875; Salient WD = 0.0975"), 
                     each = 40, times = 15)
D$parameterSet = as.factor(D$parameterSet)

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
D = D[,c(13,8,14,15:16,17)]

# reorder levels of condition
D$condition = factor(
  D$condition,
  levels = c(
    "Exp. 1",
    "Exp. 2",
    "Exp. 3")
)

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

p = ggplot(D, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 150)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  ggtitle("Simulation 4 Robustness Check Across Parameter Configurations and Habituation Lengths") +
  facet_wrap(parameterSet~epochs) +
  theme(axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25), 
        legend.text=element_text(size=25),
        legend.title = element_text(size=30),
        axis.title=element_text(size=25),
        plot.title = element_text(
          size = 25,
          face = "bold",
          hjust = 0.5  
        ),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "bottom")

setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("suppMatFigs5.png", 
       plot = p, 
       width = 28, height = 18, dpi = 300)




