###########################
###########################
##                       ##
## SIMULATION 3 ANALYSIS ##
##                       ##
###########################
###########################

# SIMULATION 3 ANALYSIS #

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


# remove scientific notation
options(scipen=9999)

# set working directory
#setwd("C:/Users/detbe/Documents/projects/NEWgergliuSims/FFNN/unequalLinearCurvedRatio/data/sim3")
# setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/FFNN/unequalLinearCurvedRatio/data/sim3")
setwd("C:/Users/Deon T. Benton/Documents/projects/NEWgergliuSims/FFNN/equalLinearCurvedRatio/data/sim3")
# load the data
exp = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(exp)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 10)


# create trial type column
D$trialType = rep(c("High Jump", "Low Jump"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Low Jump", 
                                "High Jump"))

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
expTest = t.test(D$lookingTime[D$trialType=="High Jump"],
                 D$lookingTime[D$trialType=="Low Jump"],
                 paired = TRUE)
expTest
expInefficientMean = mean(D$lookingTime[D$trialType=="High Jump"])
expInefficientSD = sd(D$lookingTime[D$trialType=="High Jump"])
expInefficientMean
expInefficientSD

expEfficientMean = mean(D$lookingTime[D$trialType=="Low Jump"])
expEfficientSD = sd(D$lookingTime[D$trialType=="Low Jump"])
expEfficientMean
expEfficientSD


# figure
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 25)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size=12),
        legend.title = element_text(size=12),
        axis.title=element_text(size=12))