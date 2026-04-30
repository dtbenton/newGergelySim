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
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/ALIAS/sim1a")

files = list.files(
  pattern = "^Study_sim1a_.*_(control|hab)_tEpochs_[0-9]+(\\.[A-Za-z0-9]+)?$"
)

stopifnot(length(files) > 0)  # will error loudly if nothing matched

data_list = lapply(files, function(f) {
  df = read.table(f, header = FALSE, stringsAsFactors = FALSE)
  
  df$condition = sub("^.*_(control|hab)_tEpochs_.*$", "\\1", f)
  df$tEpochs   = as.numeric(sub("^.*_tEpochs_([0-9]+).*$", "\\1", f))
  df$source_file = f
  
  df
})

D = do.call(rbind, data_list)


# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:200, each = 2)

# create condition column
D$condition = rep(c("Control", "Experimental"), 
                  each = 200)

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 200)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = D$tEpochs
D$epochs = as.factor(D$epochs)
levels(D$epochs)

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,c(7,4,9,8,10)]

# confirm that it is a dataframe
is.data.frame(D)

# column names
# [1] "ID"          "condition"   "epochs"      "trialType"   "lookingTime"

####################
## OMNIBUS FIGURE ##
####################
# robustness check figure
p = ggplot(D, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
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
ggsave("fig3a_04292026_ALIAS_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)



# combined results figure
p = ggplot(D, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 205)) +
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
  theme(legend.position = "bottom")

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig3b_04292026_ALIAS_main.png", 
       plot = p, 
       width = 6.5, height = 4, dpi = 300)



###################################
###################################
##                               ##
## SIMULATION 1a ANALYSIS: OM10  ##
##                               ##
###################################
###################################

# set wd 
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/OverwalleOriginal/sim1a")

# load data
D = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 4)

# create condition column
D$condition = rep(c("Experimental", "Control"), 
                  each = 2, times = 20)

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create trial type column
D$trialType = rep(c("Efficient", "Inefficient"), each = 1, times = 40)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Efficient", "Inefficient"))



# create a 'looking time' column
D$lookingTime = 1-D$V3

# remove columns
D = D[,c(4:7)]

# confirm that it is a dataframe
is.data.frame(D)

####################
## OMNIBUS FIGURE ##
####################
# main paper figure
p = ggplot(D, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 0.9)) +
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
  theme(legend.position = "bottom")

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig4_04292026_overwalle_sim1a.png", 
       plot = p, 
       width = 6.5, height = 4, dpi = 300)



###################################
#####################################
##                                 ##
## SIMULATION 1a ANALYSIS: OM10-2  ##
##                                 ##
#####################################
#####################################

# set wd 
#setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleOriginal/sim1a")
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/OverwalleModified/sim1a")

# load data
D = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 4)

# create condition column
D$condition = rep(c("Experimental", "Control"), 
                  each = 2, times = 20)

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create trial type column
D$trialType = rep(c("Efficient", "Inefficient"), each = 1, times = 40)
D$trialType = as.factor(D$trialType)

D$trialType = factor(D$trialType, 
                     levels = c("Efficient", "Inefficient"))



# create a 'looking time' column
D$lookingTime = 1-D$V3

# remove columns
D = D[,c(4:7)]

# confirm that it is a dataframe
is.data.frame(D)

####################
## OMNIBUS FIGURE ##
####################
# main paper figure
p = ggplot(D, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 0.9)) +
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
  theme(legend.position = "bottom")

#setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig3_04292026_modifiedOverwalle_sim1a.png", 
       plot = p, 
       width = 6.5, height = 4, dpi = 300)


###############################################
###############################################
##                                           ##
## SIMULATION 1a ANALYSIS: ALIAS no salience ##
##                                           ##
###############################################
###############################################


# set working directory
#setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIASnoSalience/sim1c")

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/ALIASnoSalience/sim1c")
files = list.files(
  pattern = "^Study_sim1c_.*_(control|hab)_tEpochs_[0-9]+(\\.[A-Za-z0-9]+)?$"
)

stopifnot(length(files) > 0)  # will error loudly if nothing matched

data_list = lapply(files, function(f) {
  df = read.table(f, header = FALSE, stringsAsFactors = FALSE)
  
  df$condition = sub("^.*_(control|hab)_tEpochs_.*$", "\\1", f)
  df$tEpochs   = as.numeric(sub("^.*_tEpochs_([0-9]+).*$", "\\1", f))
  df$source_file = f
  
  df
})

D = do.call(rbind, data_list)


# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:200, each = 2)

# create condition column
D$condition = rep(c("Control", "Experimental"), 
                  each = 200)

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 200)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = D$tEpochs
D$epochs = as.factor(D$epochs)
D$epochs = revalue(x = as.factor(D$epochs), 
                   c("8" = "8 epochs", "9"="9 epochs",
                     "10" = "10 epochs", "11"="11 epochs",
                     "12" = "12 epochs"))

D$epochs = factor(D$epochs, levels = c("8 epochs", "9 epochs", 
                                       "10 epochs", "11 epochs", "12 epochs"))

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,c(7,4,8:10)]

# confirm that it is a dataframe
is.data.frame(D)

####################
## OMNIBUS FIGURE ##
####################
p = ggplot(D, aes(condition, lookingTime, fill=trialType)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = expansion(mult = c(0, 0.02))) +
  coord_cartesian(ylim=c(0, 205)) +
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
  theme(legend.position = "bottom")

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig3a_04292026_ALIAS-2_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)