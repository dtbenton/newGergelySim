###############################################################
###############################################################
##                                                           ##
## MAIN ANALYSES FOR THE SIMULATIONS OF SPELKE ET AL. (1995) ##
##                                                           ##
###############################################################
###############################################################

# SIMULATION 1 ANALYSIS #

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
####################################
## Gergely et al. (1995) Analyses ##
####################################
setwd("C:/Users/bentod2/Documents/projects/current/gergeley-liuSims/data/gergEtAl1995/exp1")

# experiment 1
experimental = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
control = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine dataframes into a single 'D' data frame
D = rbind(experimental, control)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:100, each = 2)

# create test event column
D$test_event = rep(c("Inefficient Action", "Efficient Action"), each = 1, times = 100)
D$test_event = as.factor(D$test_event)


D$condition = rep(c("Experimental Condition", "Control Condition"), each = 100)
D$condition = as.factor(D$condition)

# reorder levels of condition
D$condition <- factor(D$condition, levels = c("Experimental Condition", 
                                              "Control Condition"))


D$looking_time = D$V3


# remove columns and get the names of the resulting columns
D = D[,-c(1:3)]
names(D)

lme.fit = lme(looking_time~(test_event+condition)^2, 
              random=~1|ID, data = D)
anova.lme(lme.fit)


t.test(D$looking_time[D$condition=="Experimental Condition" & D$test_event=="Inefficient Action"],
       D$looking_time[D$condition=="Experimental Condition" & D$test_event=="Efficient Action"],
       paired = TRUE, alternative = "two.sided")


mean(D$looking_time[D$condition=="Experimental Condition" & D$test_event=="Inefficient Action"])
sd(D$looking_time[D$condition=="Experimental Condition" & D$test_event=="Inefficient Action"])

mean(D$looking_time[D$condition=="Experimental Condition" & D$test_event=="Efficient Action"])
sd(D$looking_time[D$condition=="Experimental Condition" & D$test_event=="Efficient Action"])


t.test(D$looking_time[D$condition=="Control Condition" & D$test_event=="Inefficient Action"],
       D$looking_time[D$condition=="Control Condition" & D$test_event=="Efficient Action"],
       paired = TRUE, alternative = "two.sided")


mean(D$looking_time[D$condition=="Control Condition" & D$test_event=="Inefficient Action"])
sd(D$looking_time[D$condition=="Control Condition" & D$test_event=="Inefficient Action"])

mean(D$looking_time[D$condition=="Control Condition" & D$test_event=="Efficient Action"])
sd(D$looking_time[D$condition=="Control Condition" & D$test_event=="Efficient Action"])
####################
## OMNIBUS FIGURE ##
####################
# figure
condition_barplot = ggplot(D, aes(test_event, looking_time, fill = test_event)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Error (Looking Time)") + # change the label of the y-axis
  facet_wrap(~condition, ncol=3, scales = "free") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        legend.text=element_text(size=14),
        legend.title = element_text(size=14),
        axis.title=element_text(size=14),
        strip.text = element_text(
          size = 14), 
        axis.title.x = element_blank()) +
  theme(legend.position="none")



#########################
## Liu & Spelke (2017) ##
#########################
setwd("C:/Users/bentod2/Documents/projects/current/gergeley-liuSims/data/liuSpelke2017")

# experiment 1
exp1 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp2 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp3 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)



# combine dataframes into a single 'D' data frame
D = rbind(exp1, exp2, exp3)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:150, each = 2)

# create test event column
D$test_event = rep(c("Low Efficient", "High Inefficient"), each = 1, times = 150)
D$test_event = as.factor(D$test_event)

D$experiment = rep(c("Experiment 1", "Experiment 2", "Experiment 3"), each = 100)
D$experiment = as.factor(D$experiment)


D$looking_time = D$V3


# remove columns and get the names of the resulting columns
D = D[,-c(1:3)]
names(D)

# quantiative analysis
lme.fit = lme(looking_time~(test_event+experiment)^2, 
              random=~1|ID, data = D)
anova.lme(lme.fit)

# Experiment 1
t.test(D$looking_time[D$experiment=="Experiment 1" & D$test_event=="High Inefficient"],
       D$looking_time[D$experiment=="Experiment 1" & D$test_event=="Low Efficient"],
       paired = TRUE, alternative = "two.sided")

mean(D$looking_time[D$experiment=="Experiment 1" & D$test_event=="High Inefficient"])
sd(D$looking_time[D$experiment=="Experiment 1" & D$test_event=="High Inefficient"])

mean(D$looking_time[D$experiment=="Experiment 1" & D$test_event=="Low Efficient"])
sd(D$looking_time[D$experiment=="Experiment 1" & D$test_event=="Low Efficient"])

# Experiment 2
t.test(D$looking_time[D$experiment=="Experiment 2" & D$test_event=="High Inefficient"],
       D$looking_time[D$experiment=="Experiment 2" & D$test_event=="Low Efficient"],
       paired = TRUE, alternative = "two.sided")

mean(D$looking_time[D$experiment=="Experiment 2" & D$test_event=="High Inefficient"])
sd(D$looking_time[D$experiment=="Experiment 2" & D$test_event=="High Inefficient"])

mean(D$looking_time[D$experiment=="Experiment 2" & D$test_event=="Low Efficient"])
sd(D$looking_time[D$experiment=="Experiment 2" & D$test_event=="Low Efficient"])

# Experiment 3
t.test(D$looking_time[D$experiment=="Experiment 3" & D$test_event=="High Inefficient"],
       D$looking_time[D$experiment=="Experiment 3" & D$test_event=="Low Efficient"],
       paired = TRUE, alternative = "two.sided")

mean(D$looking_time[D$experiment=="Experiment 3" & D$test_event=="High Inefficient"])
sd(D$looking_time[D$experiment=="Experiment 3" & D$test_event=="High Inefficient"])

mean(D$looking_time[D$experiment=="Experiment 3" & D$test_event=="Low Efficient"])
sd(D$looking_time[D$experiment=="Experiment 3" & D$test_event=="Low Efficient"])

####################
## OMNIBUS FIGURE ##
####################
# figure
condition_barplot = ggplot(D, aes(test_event, looking_time, fill = test_event)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Error (Looking Time)") + # change the label of the y-axis
  facet_wrap(~experiment, ncol=3, scales = "free") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        legend.text=element_text(size=14),
        legend.title = element_text(size=14),
        axis.title=element_text(size=14),
        strip.text = element_text(
          size = 14), 
        axis.title.x = element_blank()) +
  theme(legend.position="none")




#######################
## Liu et al. (2019) ##
#######################
setwd("C:/Users/bentod2/Documents/projects/current/gergeley-liuSims/data/liuEtAl2019")

# experiment 1
causal = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
noncausal = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
control = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)



# combine dataframes into a single 'D' data frame
D = rbind(causal, noncausal, control)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:90, each = 2)

# create test event column
D$test_event = rep(c("Inefficient", "Efficient"), each = 1, times = 90)
D$test_event = as.factor(D$test_event)

D$condition = rep(c("Causal Condition", "Noncausal Condition", "Control Condition"), each = 60)
D$condition = as.factor(D$condition)


D$looking_time = D$V3


# remove columns and get the names of the resulting columns
D = D[,-c(1:3)]
names(D)



####################
## OMNIBUS FIGURE ##
####################
# figure
condition_barplot = ggplot(D, aes(test_event, looking_time, fill = test_event)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Error (Looking Time)") + # change the label of the y-axis
  facet_wrap(~condition, ncol=3, scales = "free") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        legend.text=element_text(size=14),
        legend.title = element_text(size=14),
        axis.title=element_text(size=14),
        strip.text = element_text(
          size = 14), 
        axis.title.x = element_blank()) +
  theme(legend.position="none")

