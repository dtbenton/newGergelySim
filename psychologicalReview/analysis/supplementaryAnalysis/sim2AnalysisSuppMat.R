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
  "C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/data_supMat/ALIAS/sim2a"
)

# Number pattern that accepts values such as:
# 900, 0.0975, .0003875, etc.
num_pattern = "[0-9]*\\.?[0-9]+"

# Match the new filenames.
# The optional final portion allows files either with or without a .txt extension.
file_pattern = paste0(
  "^Study_sim2a_",
  "pEpochs_[0-9]+_",
  "(control|hab)_",
  "tEpochs_[0-9]+_",
  "lr_",  num_pattern, "_",
  "sLR_", num_pattern, "_",
  "sWD_", num_pattern,
  "(\\.txt)?$"
)

files = list.files(
  path = ".",
  pattern = file_pattern,
  full.names = TRUE
)

stopifnot(length(files) > 0)

# Helper function for extracting one filename parameter
extract_parameter = function(filename, prefix, numeric = TRUE) {
  value = sub(
    paste0("^.*_", prefix, "_(", num_pattern, ").*$"),
    "\\1",
    filename
  )
  
  if (numeric) {
    value = as.numeric(value)
  }
  
  value
}

# Read and annotate each file
data_list = lapply(files, function(file_path) {
  
  filename = basename(file_path)
  
  df = read.table(
    file_path,
    header = FALSE,
    stringsAsFactors = FALSE,
    col.names = c("response", "consistency", "value")
  )
  
  # Information extracted from the filename
  df$pEpochs = extract_parameter(filename, "pEpochs")
  
  df$training_condition = sub(
    "^Study_sim2a_pEpochs_[0-9]+_(control|hab)_.*$",
    "\\1",
    filename
  )
  
  df$tEpochs = extract_parameter(filename, "tEpochs")
  df$lr      = extract_parameter(filename, "lr")
  df$sLR     = extract_parameter(filename, "sLR")
  df$sWD     = extract_parameter(filename, "sWD")
  
  df$source_file = filename
  
  df
})

# Combine all files into one large dataframe
D = do.call(rbind, data_list)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:400, each = 2)

# create condition column
D$condition = rep(c("Control", "Experimental"), 
                  each = 400)

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 400)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = D$tEpochs
D$epochs = as.factor(D$epochs)
levels(D$epochs)

# parameter set
D$parameterSet = rep(c("Dev. LR = 0.08625; Salient LR = 0.0004; Salient WD = 0.09875",
                       "Dev. LR = 0.0875; Salient LR = 0.0003875; Salient WD = 0.0975"), 
                     each = 40, times = 10)
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

# remove columns
D = D[,c(11:19)]

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
  coord_cartesian(ylim=c(0, 205)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  ggtitle("Simulation 2 Robustness Check Across Parameter Configurations and Habituation Lengths") +
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
ggsave("suppMatFigs3_devLR_epochs.png", 
       plot = p, 
       width = 28, height = 18, dpi = 300)




