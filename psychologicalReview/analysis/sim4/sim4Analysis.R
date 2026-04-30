##################################
##################################
##                              ##
## SIMULATION 4 ANALYSIS: ALIAS ##
##                              ##
##################################
##################################

# SIMULATION 4 ANALYSIS #
# based on Liu and Spelke (2017)

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


# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim4a")
exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# corresponds to Exp. 2 (with peripheral short barrier during habituation and test)
cntrl.8.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.9.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.10.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.11.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.12.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# corresponds to Exp. 3 (with peripheral short barrier during habituation, not test)
cntrl.8.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.9.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.10.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.11.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.12.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(exp.8, exp.9, exp.10, exp.11, exp.12,
          cntrl.8.periph.both, cntrl.9.periph.both, cntrl.10.periph.both, cntrl.11.periph.both, cntrl.12.periph.both,
          cntrl.8.periph.hab, cntrl.9.periph.hab, cntrl.10.periph.hab, cntrl.11.periph.hab, cntrl.12.periph.hab)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:300, each = 2)

# create condition column
D$condition = rep(c("Experimental condition", "Control condition"), 
                  times = c(200,400))
D$condition = as.factor(D$condition)

# Liu experiment conditions
D$exp = rep(c("Exp. 1", 
              "Exp. 2",
              "Exp. 3"), each = 200)

D$exp = as.factor(D$exp)

# create trial type column
D$trialType = rep(c("High", "Low"), each = 1, times = 300)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40, times = 3)
D$epochs = as.factor(D$epochs)


# put factors in the order you want
# doing it here to prevent things from going awry
D$epochs = factor(D$epochs, levels = c("8 Epochs", "9 Epochs", 
                                       "10 Epochs", "11 Epochs", "12 Epochs"))

D$condition = factor(D$condition, 
                     levels = c("Experimental condition", "Control condition"))

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,-c(1:3)]

# reorder columns
names(D)
dim(D)

D = D[,c(1,5,2,3,4,6)]
names(D)
####################
## OMNIBUS FIGURE ##
####################
# figure
p = ggplot(D, aes(exp, lookingTime, fill=trialType)) + # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  facet_wrap(~epochs, ncol=3) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 140)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size = 12),
        legend.title = element_text(size = 12),
        axis.title=element_text(size = 12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank())

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig14a_04282026_ALIAS_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)



p = ggplot(D, aes(exp, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 140)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size = 12),
        legend.title = element_text(size = 12),
        axis.title=element_text(size = 12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank())


setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig14b_04282026_ALIAS_main.png", 
       plot = p, 
       width = 6.5, height = 5.2, dpi = 300)




##################################
##################################
##                              ##
## SIMULATION 4 ANALYSIS: OM10  ##
##                              ##
##################################
##################################

# SIMULATION 4 ANALYSIS #
# based on Liu and Spelke (2017)


# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleOriginal/sim4a")
data = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine dataframes into a single 'D' data frame
D = rbind(data)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:40, each = 2)

# create condition column
D$condition = rep(c("Experimental condition", "Control condition"), 
                  each = 2, times = 20)
D$condition = as.factor(D$condition)


# Liu experiment conditions
D$exp = rep(c("Exp. 1", 
              "Exps. 2,3"), each = 2, times = 20)

D$exp = as.factor(D$exp)

# create trial type column
D$trialType = rep(c("Low", "High"), each = 1, times = 40)
D$trialType = as.factor(D$trialType)


D$trialType = factor(D$trialType, 
                     levels = c("High", "Low"))

# create a 'looking time' column
D$lookingTime = 1-D$V3

# remove columns
D = D[,-c(1:3)]

# reorder columns
names(D)
dim(D)

D = D[,c(1,3,4,5)]
names(D)
####################
## OMNIBUS FIGURE ##
####################
# figure
p = ggplot(D, aes(exp, lookingTime, fill=trialType)) + # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, .9)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size = 20),
        legend.title = element_text(size = 20),
        axis.title=element_text(size = 20),
        strip.text = element_text(
          size = 20), 
        axis.title.x = element_blank())

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig15_04302026_OM10_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)




####################################
####################################
##                                ##
## SIMULATION 4 ANALYSIS: OM10-2  ##
##                                ##
####################################
####################################

# SIMULATION 4 ANALYSIS #
# based on Liu and Spelke (2017)


# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/OverwalleModified/sim4a")
data = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# combine dataframes into a single 'D' data frame
D = rbind(data)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:20, each = 6)

# create condition column
cond = rep(c("Experimental condition", "Control condition"), 
                  times = c(2,4))
D$condition = rep(cond, times = 20)


D$condition = as.factor(D$condition)


# Liu experiment conditions
D$exp = rep(c("Exp. 1", 
              "Exp. 2",
              "Exp. 3"), each = 2, times = 20)

D$exp = as.factor(D$exp)

# create trial type column
D$trialType = rep(c("Low", "High"), each = 1, times = 60)
D$trialType = as.factor(D$trialType)


D$trialType = factor(D$trialType, 
                     levels = c("High", "Low"))

# create a 'looking time' column
D$lookingTime = 1-D$V3

# remove columns
D = D[,-c(1:3)]

# reorder columns
names(D)
dim(D)

D = D[,c(1,3,4,5)]
names(D)

####################
## OMNIBUS FIGURE ##
####################
# figure
p = ggplot(D, aes(exp, lookingTime, fill=trialType)) + # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Activation of Critical Units") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, .9)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        legend.text=element_text(size = 20),
        legend.title = element_text(size = 20),
        axis.title=element_text(size = 20),
        strip.text = element_text(
          size = 20), 
        axis.title.x = element_blank())

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig15_04302026_OM10-2_main.png", 
       plot = p, 
       width =8.5, height = 5.2, dpi = 300)




####################################
####################################
##                                ##
## SIMULATION 4 ANALYSIS: ALIAS-2 ##
##                                ##
####################################
####################################



# set working directory
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIASnoSalience/sim4c")
exp.8 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.9 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.10 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.11 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
exp.12 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# corresponds to Exp. 2 (with peripheral short barrier during habituation and test)
cntrl.8.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.9.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.10.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.11.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.12.periph.both = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)


# corresponds to Exp. 3 (with peripheral short barrier during habituation, not test)
cntrl.8.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.9.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.10.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.11.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cntrl.12.periph.hab = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)

# combine dataframes into a single 'D' data frame
D = rbind(exp.8, exp.9, exp.10, exp.11, exp.12,
          cntrl.8.periph.both, cntrl.9.periph.both, cntrl.10.periph.both, cntrl.11.periph.both, cntrl.12.periph.both,
          cntrl.8.periph.hab, cntrl.9.periph.hab, cntrl.10.periph.hab, cntrl.11.periph.hab, cntrl.12.periph.hab)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:300, each = 2)

# create condition column
D$condition = rep(c("Experimental condition", "Control condition"), 
                  times = c(200,400))
D$condition = as.factor(D$condition)

# Liu experiment conditions
D$exp = rep(c("Exp. 1", 
              "Exp. 2",
              "Exp. 3"), each = 200)

D$exp = as.factor(D$exp)

# create trial type column
D$trialType = rep(c("High", "Low"), each = 1, times = 300)
D$trialType = as.factor(D$trialType)

# epochs
D$epochs = rep(c("8 Epochs", "9 Epochs", "10 Epochs", "11 Epochs", "12 Epochs"), 
               each = 40, times = 3)
D$epochs = as.factor(D$epochs)


# put factors in the order you want
# doing it here to prevent things from going awry
D$epochs = factor(D$epochs, levels = c("8 Epochs", "9 Epochs", 
                                       "10 Epochs", "11 Epochs", "12 Epochs"))

D$condition = factor(D$condition, 
                     levels = c("Experimental condition", "Control condition"))

# create a 'looking time' column
D$lookingTime = D$V3

# remove columns
D = D[,-c(1:3)]

# reorder columns
names(D)
dim(D)

D = D[,c(1,5,2,3,4,6)]
names(D)
####################
## OMNIBUS FIGURE ##
####################
# figure
p = ggplot(D, aes(exp, lookingTime, fill=trialType)) + # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  facet_wrap(~epochs, ncol=3) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 140)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size = 12),
        legend.title = element_text(size = 12),
        axis.title=element_text(size = 12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank())

setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig17a_04302026_ALIAS-_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)



p = ggplot(D, aes(exp, lookingTime, fill=trialType)) +# create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
  stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network Error") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 145)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12), 
        legend.text=element_text(size = 12),
        legend.title = element_text(size = 12),
        axis.title=element_text(size = 12),
        strip.text = element_text(
          size = 12), 
        axis.title.x = element_blank())


setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/figures")
ggsave("fig17b_04302026_ALIAS-2_main.png", 
       plot = p, 
       width = 8.5, height = 5.2, dpi = 300)
