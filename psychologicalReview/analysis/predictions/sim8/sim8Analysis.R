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



# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/prediction/sim8")

# load data
D.exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


D.cntrl.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.cntrl.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.cntrl.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.cntrl.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.cntrl.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes
D = rbind(D.exp.8, D.exp.9, D.exp.10, D.exp.11, D.exp.12,
          D.cntrl.8, D.cntrl.9, D.cntrl.10, D.cntrl.11, D.cntrl.12)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:200, each = 2)

# create condition column
D$condition = rep(c("Experimental", "Control"), 
                  each = 200)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 200)
D$trialType = as.factor(D$trialType)

# create epoch column
D$epochs = rep(c("8" = "8 Epochs", "9"="9 Epochs", "10"="10 Epochs",
                 "11"="11 Epochs", "12"="12 Epochs"), each = 40, times = 2)
D$epochs = as.factor(D$epochs)


# refactor levels
D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,-c(1:3)]


####################
## OMNIBUS FIGURE ##
####################
# figure
D.exp = subset(D, ! condition %in% c("Control"))
D.cntrl = subset(D, ! condition %in% c("Experimental"))

# experimental data
p = ggplot(D.exp, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 205)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18), 
        legend.text=element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title=element_text(size = 18),
        strip.text = element_text(
          size = 18), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) +
  theme(legend.position = "none")

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig23a_05112026_ALIAS_exp_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)



# control data
p = ggplot(D.cntrl, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 60)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18), 
        legend.text=element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title=element_text(size = 18),
        strip.text = element_text(
          size = 18), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3)) 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig23b_05112026_ALIAS_cntrl_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)