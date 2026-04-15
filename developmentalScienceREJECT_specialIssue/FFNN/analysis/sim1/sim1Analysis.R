###########################
###########################
##                       ##
## SIMULATION 1 ANALYSIS ##
##                       ##
###########################
###########################


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



# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/FFNN/equalLinearCurvedRatio/data/sim1")
exp.animate.sim1 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.animate.sim1 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine dataframes into a single 'D' data frame
D = rbind(exp.animate.sim1, cntrl.animate.sim1)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:40, each = 10)

# create condition column
D$condition = rep(c("Experimental condition", "Control condition"), 
                  each = 200)

D$condition = factor(D$condition, 
                     levels = c("Experimental condition", "Control condition"))

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 200)
D$trialType = as.factor(D$trialType)

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,-c(1:3)]

# main analysis 
lme.fit = lme(lookingTime~(condition+trialType)^2, 
              random=~1|ID, data = D)
anova.lme(lme.fit)

## follow up tests ##

## animacy x trial type interaction


## condition x trial type interaction
# experimental condition
expTest = t.test(D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Inefficient"],
                 D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Efficient"],
                 paired = TRUE)
expTest
expInefficientMean = mean(D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Inefficient"])
expInefficientSD = sd(D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Inefficient"])
expInefficientMean
expInefficientSD

expEfficientMean = mean(D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Efficient"])
expEfficientSD = sd(D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Efficient"])
expEfficientMean
expEfficientSD

# control condition
controlTest = t.test(D$lookingTime[D$condition=="Control condition" & D$trialType=="Inefficient"],
                     D$lookingTime[D$condition=="Control condition" & D$trialType=="Efficient"],
                     paired = TRUE)
controlTest
controlInefficientMean = mean(D$lookingTime[D$condition=="Control condition" & D$trialType=="Inefficient"])
controlInefficientSD = sd(D$lookingTime[D$condition=="Control condition" & D$trialType=="Inefficient"])
controlInefficientMean
controlInefficientSD

controlEfficientMean = mean(D$lookingTime[D$condition=="Control condition" & D$trialType=="Efficient"])
controlEfficientSD = sd(D$lookingTime[D$condition=="Control condition" & D$trialType=="Efficient"])
controlEfficientMean
controlEfficientSD

# difference analysis
difExp = D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Inefficient"]-
  D$lookingTime[D$condition=="Experimental condition" & D$trialType=="Efficient"]

difCntrl = D$lookingTime[D$condition=="Control condition" & D$trialType=="Inefficient"]-
  D$lookingTime[D$condition=="Control condition" & D$trialType=="Efficient"]

t.test(difExp, difCntrl, 
       paired = FALSE, 
       alternative = "two.sided")

mean(difExp)
sd(difExp)

mean(difCntrl)
sd(difCntrl)

# figure
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 15)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size=12),
        legend.title = element_text(size=12),
        axis.title=element_text(size=12))
