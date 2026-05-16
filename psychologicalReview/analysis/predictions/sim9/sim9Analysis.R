###################################
###################################
##                               ##
## SIMULATION 9 ANALYSIS: ALIAS  ##
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

#######################################
## INEFFICIENT TEST EVENTS CONDITION ##
#######################################

# set working directory
#setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/prediction/sim9")
setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/data/ALIAS/prediction/sim9/inefficientTests")

# load data
D = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 2)


# create trial type column
D$trialType = rep(c("High, inefficient", "Inefficient"), each = 1, times = 20)
D$trialType = as.factor(D$trialType)

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,-c(1:3)]


####################
## OMNIBUS FIGURE ##
####################
# figure


# experimental data
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 160)) +
  scale_fill_manual(values = c("black", "azure3")) +
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18), 
        legend.text=element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title=element_text(size = 18),
        strip.text = element_text(
          size = 18), 
        axis.title.x = element_text(
          size = 18,
          margin = margin(t = 15)
        ),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "none") +
  theme(axis.title.x = element_blank())

setwd("C:/Users/Deon T. Benton/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig24a_05122026_ALIAS_inefficient_cond_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)



#####################################
## EFFICIENT TEST EVENTS CONDITION ##
#####################################

# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/prediction/sim9")

# load data
D = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 2)


# create trial type column
D$trialType = rep(c("Efficient", "Low, efficient"), each = 1, times = 20)
D$trialType = as.factor(D$trialType)

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,-c(1:3)]


####################
## OMNIBUS FIGURE ##
####################
# figure


# experimental data
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 52)) +
  scale_fill_manual(values = c("black", "azure3")) +
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18), 
        legend.text=element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title=element_text(size = 18),
        strip.text = element_text(
          size = 18), 
        axis.title.x = element_text(
          size = 18,
          margin = margin(t = 15)
        ),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "none") +
  labs(x = "Efficient Test Events condition")

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig24b_05122026_ALIAS_efficient_cond_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)





