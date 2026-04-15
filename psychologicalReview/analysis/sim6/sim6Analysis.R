###########################
###########################
##                       ##
## SIMULATION 6 ANALYSIS ##
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

######################
## INEFFECTIVE DATA ##
######################

# set working directory
#setwd("C:/Users/Deon T. Benton/Documents/projects/NEWgergliuSims/developmentalPsychology/data/sim6/ineffective")
setwd("C:/Users/Deon T. Benton/Documents/projects/NEWgergliuSims/JEPG/data/sim5a/ineffective")

oneHundred.exp.12.i = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)



# combine dataframes into a single 'D' data frame
D.1 = rbind(oneHundred.exp.12.i)


# get dimensionality of D
dim(D.1)

# create an ID column
D.1$ID = rep(1:20, each = 20)


# create trial type column
D.1$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 200)
D.1$trialType = as.factor(D.1$trialType)


# create condition column
D.1$condition = rep(c("Experimental"), each = 400)
D.1$condition = as.factor(D.1$condition) 

# create a 'looking time' column
D.1$lookingTime = D.1$V3

D.1 = D.1[,c(4:7)]
D.1 = as.data.frame(D.1)
####################
## EFFECTIVE DATA ##
####################

setwd("C:/Users/Deon T. Benton/Documents/projects/NEWgergliuSims/JEPG/data/sim5a/effective")

oneHundred.exp.12.e = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

oneHundred.cntrl.12.e = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine dataframes into a single 'D' data frame
D.2 = rbind(oneHundred.exp.12.e, oneHundred.cntrl.12.e)


# get dimensionality of D
dim(D.2)

# create an ID column
D.2$ID = rep(1:40, each = 20)


# create trial type column
D.2$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 400)
D.2$trialType = as.factor(D.2$trialType)



# create condition column
D.2$condition = rep(c("Experimental", "Control"), each = 400)
D.2$condition = as.factor(D.2$condition)


# create a 'looking time' column
D.2$lookingTime = D.2$V3

D.2 = D.2[,c(4:7)]
D.2 = as.data.frame(D.2)

#########################
## COMBINE DATA FRAMES ##
#########################

D = rbind(D.1, D.2)

D$experiment = rep(c("Ineffective condition","Effective condition"),
                   times = c(400,800))
D$experiment = as.factor(D$experiment)

####################
## OMNIBUS FIGURE ##
####################

# Ineffective data figure
# figure
condition_barplot = ggplot(D.2, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  facet_wrap(~experiment, ncol=3) +
  scale_y_continuous(oneHundredand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 300)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  facet_wrap(~habEpoch)
theme(axis.text.x = element_text(size = 10),
      axis.text.y = element_text(size = 10), 
      legend.text=element_text(size=10),
      legend.title = element_text(size=10),
      axis.title=element_text(size=10),
      strip.text = element_text(
        size = 10), 
      axis.title.x = element_blank())





# Effective data figure
# figure
condition_barplot = ggplot(D.2, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Looking Time") + # change the label of the y-axis
  facet_wrap(~epochNum, ncol=3) +
  scale_y_continuous(oneHundredand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 300)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  facet_wrap(~habEpoch)
theme(axis.text.x = element_text(size = 10),
      axis.text.y = element_text(size = 10), 
      legend.text=element_text(size=10),
      legend.title = element_text(size=10),
      axis.title=element_text(size=10),
      strip.text = element_text(
        size = 10), 
      axis.title.x = element_blank())

names(D)
