##################################
##################################
##                              ##
## SIMULATION 3 ANALYSIS: ALIAS ##
##                              ##
##################################
##################################


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
library(Hmisc)

# CONSTRAINTS #

# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim3a")
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


# figure
# robustness check figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 145)) +
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
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 15, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Goals condition") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig10a_04302026_ALIAS_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)


# overall figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 140)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20),
        strip.text = element_text(
          size = 20), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 20, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Goals condition")

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig11_04302026_goals_overall_ALIAS_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)


###################
### CONSTRAINTS ###
###################
# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim3d")
exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(exp.8, exp.9, exp.10, exp.11, exp.12)

# get dimensionality of D
dim(D)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:100, each = 2)

# create trial type column
D$trialType = rep(c("No-Obstacle", "Obstacle"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Obstacle", 
                                "No-Obstacle"))

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

# figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 75)) +
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
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 15, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Constraints condition") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig10b_04302026_ALIAS_main_constraints.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)


# overall figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 75)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20),
        strip.text = element_text(
          size = 20), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 20, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Constraints condition")

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig11_04302026_constraints_overall_ALIAS_main_constraints.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)


###################################
###################################
##                               ##
## SIMULATION 3a ANALYSIS: OM10  ##
##                               ##
###################################
###################################

###########################
## Inferring Constraints ##
###########################

# set wd 
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleOriginal/sim3a")

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
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 1.2)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size=12),
        legend.title = element_text(size=12),
        axis.title=element_text(size=12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 18, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Constraints condition") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig12_04302026_OM10_overall_constraints_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)



###########################
#     Inferring Goals     #
###########################


# set wd 
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleOriginal/sim3d")

# load data
D = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 2)


# create trial type column
D$trialType = rep(c("Congruent", "Incongruent"), each = 1, times = 20)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Congruent", "Incongruent"))



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
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 0.95)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size=12),
        legend.title = element_text(size=12),
        axis.title=element_text(size=12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 18, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Goals condition") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig12_04212026_OM10_goals_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)



#####################################
#####################################
##                                 ##
## SIMULATION 3a ANALYSIS: OM10-2  ##
##                                 ##
#####################################
#####################################

###########################
## Inferring Constraints ##
###########################

# set wd 
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleModified/sim3a")

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
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 1.5)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size=12),
        legend.title = element_text(size=12),
        axis.title=element_text(size=12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 18, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Constraints condition") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig12_04222026_OM10-2_overall_constraints_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)



###########################
#     Inferring Goals     #
###########################


# set wd 
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleModified/sim3d")

# load data
D = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 2)


# create trial type column
D$trialType = rep(c("Congruent", "Incongruent"), each = 1, times = 20)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Congruent", "Incongruent"))



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
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 0.95)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size=12),
        legend.title = element_text(size=12),
        axis.title=element_text(size=12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 18, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Goals condition") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig12_04222026_OM10-2_goals_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)


####################################
####################################
##                                ##
## SIMULATION 3 ANALYSIS: ALIAS-2 ##
##                                ##
####################################
####################################



# CONSTRAINTS #

# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIASnoSalience/sim3c")
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


# overall figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 140)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20),
        strip.text = element_text(
          size = 20), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 20, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Goals condition")

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig13a_04222026_ALIAS-2__goals_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)


###################
### CONSTRAINTS ###
###################
# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIASnoSalience/sim3f")
exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(exp.8, exp.9, exp.10, exp.11, exp.12)

# get dimensionality of D
dim(D)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:100, each = 2)

# create trial type column
D$trialType = rep(c("No-Obstacle", "Obstacle"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Obstacle", 
                                "No-Obstacle"))

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

# overall figure
p = ggplot(D, aes(trialType, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 75)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size=20),
        legend.title = element_text(size=20),
        axis.title=element_text(size=20),
        strip.text = element_text(
          size = 20), 
        axis.title.x = element_blank(),
        plot.margin = margin(3, 3, 3, 3),
        plot.caption = element_text(size = 20, hjust = 0.5)) +
  theme(legend.position = "none") +
  labs(caption = "Inferring Constraints condition")

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig13a_04302026_ALIAS-2__constraints_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)
