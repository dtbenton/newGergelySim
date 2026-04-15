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

###########################
### Unequal probability ###
###########################

###################
### CONSTRAINTS ###
##################
# remove scientific notation
options(scipen=9999)

# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/FFNN/equalLinearCurvedRatio/data/sim4a")

# load the data
constraint = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(constraint)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 10)

# create trial type column
D$trialType = rep(c("Incongruent", "Congruent"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Congruent", 
                                "Incongruent"))

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
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 24)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20)) +
  labs(x = "Inferring Constraints Scenario")


#############
### GOALS ###
#############
# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/FFNN/equalLinearCurvedRatio/data/sim4b")

# load the data
goal = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(goal)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 10)

# create trial type column
D$trialType = rep(c("No-Obstacle", "Obstacle"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Obstacle", 
                                "No-Obstacle"))

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
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 10)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20)) +
  labs(x = "Inferring Goals Scenario")


#########################
### Equal probability ###
#########################

###################
### CONSTRAINTS ###
###################
# remove scientific notation
options(scipen=9999)

# set working directory
# setwd("C:/Users/detbe/Documents/projects/NEWgergliuSims/FFNN/unequalLinearCurvedRatio/data/sim4")
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/FFNN/equalLinearCurvedRatio/data/sim4a")

# load the data
constraint.500.4 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(constraint.500.4)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 10)

# create trial type column
D$trialType = rep(c("Incongruent", "Congruent"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Congruent", 
                                "Incongruent"))

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
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 24)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20)) +
  labs(x = "Inferring Constraints Scenario")


#############
### GOALS ###
#############
# set working directory
# setwd("C:/Users/detbe/Documents/projects/NEWgergliuSims/FFNN/unequalLinearCurvedRatio/data/sim4")
setwd("C:/Users/Deon T. Benton/Documents/projects/NEWgergliuSims/FFNN/unequalLinearCurvedRatio/data/sim4b")
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/FFNN/unequalLinearCurvedRatio/data/sim4b")

# load the data
goal.500.4 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(goal.500.4)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 10)

# create trial type column
D$trialType = rep(c("No-Obstacle", "Obstacle"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Obstacle", 
                                "No-Obstacle"))

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
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 15)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20)) +
  labs(x = "Inferring Goals Scenario")



#########################
### Equal probability ###
#########################