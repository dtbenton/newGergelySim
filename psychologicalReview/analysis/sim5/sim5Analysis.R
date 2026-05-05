####################################
####################################
##                                ##
## SIMULATION 5 ANALYSIS: ALIAS   ##
##                                ##
####################################
####################################



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

###########################################
# SIMULATION 5 ANALYSIS                   #
# Effective and Ineffective conditions    #
###########################################

# set working directory to sim5a
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim5a")

# get all txt files from both folders
files = list.files(
  path = ".",
  pattern = "\\.txt$",
  recursive = TRUE,
  full.names = TRUE
)

# sanity check
stopifnot(length(files) > 0)

# read + parse
data_list = lapply(files, function(f) {
  
  # read file
  df = read.table(f, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("response", "trial_type", "value")
  
  fname = basename(f)
  
  # ---- extract variables from filename ----
  
  # condition (control vs exp)
  df$condition = ifelse(grepl("_control_", fname), "control",
                         ifelse(grepl("ExpHab", fname), "exp", NA))
  
  # pEpochs
  df$pEpochs = as.numeric(sub(".*pEpochs_([0-9]+)_.*", "\\1", fname))
  
  # tEpochs
  df$tEpochs = as.numeric(sub(".*_tEpochs_([0-9]+)_.*", "\\1", fname))
  
  # actionEpochs
  df$actionEpochs = as.numeric(sub(".*_actionEpochs_([0-9]+)\\.txt$", "\\1", fname))
  
  # effective vs ineffective (from folder)
  df$effectiveness = basename(dirname(f))
  
  # keep provenance
  df$source_file   = fname
  df$source_path   = f
  
  df
})

# combine
D = do.call(rbind, data_list)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:300, each = 2)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 300)
D$trialType = as.factor(D$trialType)

# condition
D$condition = rep(c("Control", "Experimental"), 
                  times = c(200,400))

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# effectiveness
D$effectiveness = rep(c("Effective", "Ineffective"), 
                      times = c(400,200))

D$effectiveness = factor(D$effectiveness, 
                         levels = c("Effective", "Ineffective"))

# epochs
D$epochs = D$tEpochs
D$epochs = as.factor(D$epochs)

D$epochs = revalue(x = D$epochs, 
                           c("8" = "8 Epochs", "9"="9 Epochs", "10"="10 Epochs",
                             "11"="11 Epochs", "12"="12 Epochs"))

# create a 'looking time' column
D$lookingTime = D$value


# remove columns
D = D[,c("ID", "effectiveness", "condition", "epochs", 
         "trialType", "lookingTime")]


# figure

# by habituation epochs
D.effective.exp = subset(D, ! effectiveness %in% c("Ineffective"))
D.effective.exp = subset(D.effective.exp, ! condition %in% c("Control"))

condition_barplot = ggplot(D.effective.exp, aes(condition, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~epochs, ncol=3) +
  coord_cartesian(ylim=c(0, 200)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig18a_05042026_ALIAS_exp_byHab.png", 
       plot = condition_barplot, 
       width = 8.5, height = 5.2, dpi = 300)

# overall
condition_barplot = ggplot(D.effective.exp, aes(condition, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 200)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        legend.position = "none") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig18b_05042026_ALIAS_exp_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)

# by habituation epoch
D.ineffective.exp = subset(D, ! effectiveness %in% c("Effective"))

condition_barplot = ggplot(D.ineffective.exp, aes(condition, lookingTime, fill=trialType)) + # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  facet_wrap(~epochs, ncol=3) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 350)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig18c_05042026_ALIAS_exp_byHab.png", 
       plot = condition_barplot, 
       width = 8.5, height = 5.2, dpi = 300)


# overall
condition_barplot = ggplot(D.ineffective.exp, aes(condition, lookingTime, fill=trialType)) + # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 350)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        legend.position = "none") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig18d_05042026_ALIAS_exp_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)




###########################################
# SIMULATION 5 ANALYSIS                   #
# No training condition                   #
###########################################

# set working directory to sim5a
#setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim5a")
setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/data/ALIAS/sim5f")

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

# combine data
D = rbind(D.exp.8, D.exp.9, D.exp.10, D.exp.11, D.exp.12,
          D.cntrl.8, D.cntrl.9, D.cntrl.10, D.cntrl.11, D.cntrl.12)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:200, each = 2)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 200)
D$trialType = as.factor(D$trialType)

# condition
D$condition = rep(c("Experiment", "Control"), 
                  times = 200)

D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40, times = 2)
D$epochs = as.factor(D$epochs)

# create a 'looking time' column
D$lookingTime = D$V3


# remove columns
D = D[,-c(1:3)]


# figure

# by habituation epochs
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~epochs, ncol=3) +
  coord_cartesian(ylim=c(0, 400)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig19a_05042026_ALIAS_exp_byHab.png", 
       plot = condition_barplot, 
       width = 8.5, height = 5.2, dpi = 300)

# overall
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 390)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        legend.position = "none") 

setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave("fig19b_05042026_ALIAS_exp_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)



###########################################
# SIMULATION 5 ANALYSIS                   #
# Ineffective Action condition            #
###########################################

# set working directory to sim5a
#setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim5a")
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim5a/ineffective")

# load data
D.exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine data
D = rbind(D.exp.8, D.exp.9, D.exp.10, D.exp.11, D.exp.12)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:100, each = 2)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40, times = 1)
D$epochs = as.factor(D$epochs)

# create a 'looking time' column
D$lookingTime = D$V3


# remove columns
D = D[,-c(1:3)]


# figure
# overall
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 350)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig20_05052026_ALIAS_exp_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)


####################################
####################################
##                                ##
## SIMULATION 5 ANALYSIS: ALIAS-2 ##
##                                ##
####################################
####################################

################################
## EFFECTIVE ACTION CONDITION ##
################################
# set working directory to sim5a
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIASnoSalience/sim5c")

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

# combine data
D = rbind(D.exp.8, D.exp.9, D.exp.10, D.exp.11, D.exp.12,
          D.cntrl.8, D.cntrl.9, D.cntrl.10, D.cntrl.11, D.cntrl.12)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:200, each = 2)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 200)
D$trialType = as.factor(D$trialType)

# condition
D$condition = rep(c("Experimental", "Control"), 
                  each = 200)
D$condition = as.factor(D$condition)

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40, times = 2)
D$epochs = as.factor(D$epochs)

# create a 'looking time' column
D$lookingTime = D$V3


# reorder factors
D$condition = factor(D$condition, 
                     levels = c("Experimental", "Control"))
# remove columns
D = D[,-c(1:3)]


# figure

# overall
D.exp = subset(D, ! condition %in% c("Control"))
condition_barplot = ggplot(D.exp, aes(trialType, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 210)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        legend.position = "none") 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig21a_05052026_ALIAS-2_exp_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)



# overall
D.cntrl = subset(D, ! condition %in% c("Experimental"))
condition_barplot = ggplot(D.cntrl, aes(trialType, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 380)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig21b_05052026_ALIAS-2_cntrl_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)


##################################
## INEFFECTIVE ACTION CONDITION ##
##################################
# set working directory to sim5a
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIASnoSalience/sim5c")

# load data
D.exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine data
D = rbind(D.exp.8, D.exp.9, D.exp.10, D.exp.11, D.exp.12)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:100, each = 2)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40, times = 1)
D$epochs = as.factor(D$epochs)

# create a 'looking time' column
D$lookingTime = D$V3


# remove columns
D = D[,-c(1:3)]


# figure
# overall
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 350)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig21C_05052026_ALIAS-2_ineff_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)



###########################
## NO TRAINING CONDITION ##
###########################
# set working directory to sim5a
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIASnoSalience/sim5g")

# load data
D.exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
D.exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine data
D = rbind(D.exp.8, D.exp.9, D.exp.10, D.exp.11, D.exp.12)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:100, each = 2)

# create trial type column
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 100)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40, times = 1)
D$epochs = as.factor(D$epochs)

# create a 'looking time' column
D$lookingTime = D$V3


# remove columns
D = D[,-c(1:3)]


# figure
# overall
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 380)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.y = element_text(size = 18), 
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        axis.title = element_text(size = 18),
        strip.text = element_text(size = 18), 
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig21d_05052026_ALIAS-2_noTrain_overall.png", 
       plot = condition_barplot, 
       width = 6.5, height = 5.2, dpi = 300)