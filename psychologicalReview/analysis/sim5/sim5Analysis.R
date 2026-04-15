###########################
###########################
##                       ##
## SIMULATION 4 ANALYSIS ##
##                       ##
###########################
###########################


# SIMULATION 4 ANALYSIS #


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
library(openxlsx)
library(Hmisc)

# CONSTRAINTS #

# set working directory to sim5a
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim5a")

# get all txt files from both folders
files = list.files(
  path = ".",
  pattern = "\\.txt$",
  recursive = TRUE,
  full.names = TRUE
)

# sanity check
stopifnot(length(files) > 0)

# read + parse
data_list = lapply(files, function(f) {
  
  # read file
  df = read.table(f, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("response", "trial_type", "value")
  
  fname = basename(f)
  
  # ---- extract variables from filename ----
  
  # condition (control vs exp)
  df$condition = ifelse(grepl("_control_", fname), "control",
                         ifelse(grepl("ExpHab", fname), "exp", NA))
  
  # pEpochs
  df$pEpochs = as.numeric(sub(".*pEpochs_([0-9]+)_.*", "\\1", fname))
  
  # tEpochs
  df$tEpochs = as.numeric(sub(".*_tEpochs_([0-9]+)_.*", "\\1", fname))
  
  # actionEpochs
  df$actionEpochs = as.numeric(sub(".*_actionEpochs_([0-9]+)\\.txt$", "\\1", fname))
  
  # effective vs ineffective (from folder)
  df$effectiveness = basename(dirname(f))
  
  # keep provenance
  df$source_file   = fname
  df$source_path   = f
  
  df
})

# combine
D = do.call(rbind, data_list)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:300, each = 2)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 300)
D$trialType = as.factor(D$trialType)

# condition
D$condition = rep(c("Control", "Experimental"), 
                  times = c(200,400))

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# effectiveness
D$effectiveness = rep(c("Effective", "Ineffective"), 
                      times = c(400,200))

D$effectiveness = factor(D$effectiveness, 
                     levels = c("Effective", "Ineffective"))

# epochs
D$epochs = rep(c("2 Epochs", "4 Epochs", "6 Epochs", "8 Epochs", "10 Epochs", "12 Epochs"), 
               each = 200)
D$epochs = as.factor(D$epochs)

D$epochs = factor(D$epochs, levels = c("2 Epochs", "4 Epochs", 
                                       "6 Epochs", "8 Epochs", "10 Epochs", "12 Epochs"))

# create a 'looking time' column
D$lookingTime = D$value

# remove columns
D = D[,-c(1:3)]

# main analysis 
lme.fit = lme(lookingTime~trialType, 
              random=~1|ID, data = D)
anova.lme(lme.fit)

# follow up tests 
# experimental condition
expTest = t.test(D$lookingTime[D$trialType=="Incongruent"],
                 D$lookingTime[D$trialType=="Congruent"],
                 paired = TRUE)
expTest
expInefficientMean = mean(D$lookingTime[D$trialType=="Incongruent"])
expInefficientSD = sd(D$lookingTime[D$trialType=="Incongruent"])
expInefficientMean
expInefficientSD

expEfficientMean = mean(D$lookingTime[D$trialType=="Congruent"])
expEfficientSD = sd(D$lookingTime[D$trialType=="Congruent"])
expEfficientMean
expEfficientSD


# figure
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  facet_wrap(~effectiveness, ncol=3) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 500)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 22),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size=22),
        legend.title = element_text(size=22),
        axis.title=element_text(size=22),
        strip.text = element_text(
          size = 22), 
        axis.title.x = element_blank()) +
  theme(plot.caption = element_text(hjust = 0.5, vjust = 0.5, size = 12))


###################
### CONSTRAINTS ###
###################
# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/cognition/data/sim4b")
setwd("C:/Users/Deon T. Benton/Documents/projects/NEWgergliuSims/cognition/data/sim4b")
exp.2 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.4 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.6 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(exp.2, exp.4, exp.6, exp.8, exp.10, exp.12)

# get dimensionality of D
dim(D)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:120, each = 10)

# create trial type column
D$trialType = rep(c("No-Obstacle", "Obstacle"), each = 1, times = 600)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Obstacle", 
                                "No-Obstacle"))

# epochs
D$epochs = rep(c("2 Epochs", "4 Epochs", "6 Epochs", "8 Epochs", "10 Epochs",
                 "12 Epochs"), 
               each = 200)
D$epochs = as.factor(D$epochs)

D$epochs = factor(D$epochs, levels = c("2 Epochs", "4 Epochs", 
                                       "6 Epochs", "8 Epochs", "10 Epochs",
                                       "12 Epochs"))

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,-c(1:3)]

# main analysis 
lme.fit = lme(lookingTime~trialType, 
              random=~1|ID, data = D)
anova.lme(lme.fit)

# follow up tests 
# experimental condition
expTest = t.test(D$lookingTime[D$trialType=="No-Obstacle"],
                 D$lookingTime[D$trialType=="Obstacle"],
                 paired = TRUE)
expTest
expInefficientMean = mean(D$lookingTime[D$trialType=="No-Obstacle"])
expInefficientSD = sd(D$lookingTime[D$trialType=="No-Obstacle"])
expInefficientMean
expInefficientSD

expEfficientMean = mean(D$lookingTime[D$trialType=="Obstacle"])
expEfficientSD = sd(D$lookingTime[D$trialType=="Obstacle"])
expEfficientMean
expEfficientSD


# figure
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  facet_wrap(~epochs, ncol=3) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 200)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10), 
        legend.text=element_text(size=10),
        legend.title = element_text(size=10),
        axis.title=element_text(size=10),
        strip.text = element_text(
          size = 10), 
        axis.title.x = element_blank()) +
  labs(caption = "Inferring Constraints Scenario") +
  theme(plot.caption = element_text(hjust = 0.5, vjust = 0.5, size = 12))
