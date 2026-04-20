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

# set working directory
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/ALIAS/sim3a")
exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine dataframes into a single 'D' data frame
D = rbind(exp.8, exp.9, exp.10, exp.11, exp.12)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:100, each = 2)

# create trial type column
D$trialType = rep(c("Incongruent", "Congruent"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Congruent", 
                                "Incongruent"))

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40)
D$epochs = as.factor(D$epochs)

D$epochs = factor(D$epochs, levels = c("8 Epochs", "9 Epochs", 
                                       "10 Epochs", "11 Epochs", "12 Epochs"))

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
# robustness check figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 205)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  facet_wrap(~epochs) +
  theme(axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15), 
        legend.text=element_text(size=15),
        legend.title = element_text(size=15),
        axis.title=element_text(size=15),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "bottom")

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig10_04202026_ALIAS_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)


# overall figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 140)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15), 
        legend.text=element_text(size=15),
        legend.title = element_text(size=15),
        axis.title=element_text(size=15),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "none")

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig11_04202026_ALIAS_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)


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



###################################
###################################
##                               ##
## SIMULATION 3a ANALYSIS: OM10  ##
##                               ##
###################################
###################################

# set wd 
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/OverwalleOriginal/sim3a")

# load data
D = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 2)


# create trial type column
D$trialType = rep(c("Obstacle", "No-Obstacle"), each = 1, times = 20)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Obstacle", "No-Obstacle"))



# create a 'looking time' column
D$lookingTime = 1-D$V3

# remove columns
D = D[,c(4:6)]

# confirm that it is a dataframe
is.data.frame(D)

####################
## OMNIBUS FIGURE ##
####################
# main paper figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Unit Activation") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 1.2)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15), 
        legend.text=element_text(size=15),
        legend.title = element_text(size=15),
        axis.title=element_text(size=15),
        strip.text = element_text(
          size = 15), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "none")

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig12_04202026_OM10_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)

