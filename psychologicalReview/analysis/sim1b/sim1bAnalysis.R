############################
############################
##                        ##
## SIMULATION 1b ANALYSIS ##
##                        ##
############################
############################


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



setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/psychologicalReview/data/ALIAS/sim1b")

files = list.files(recursive = TRUE, full.names = TRUE)
files = files[
  !grepl("\\.Rhistory$|\\.gitkeep$", files) &
    grepl("^pEpochs_[0-9]+_tEpochs_[0-9]+_condition_pretrain[0-9]+_testEvent_.*_habEvent_.*", basename(files))
]

stopifnot(length(files) > 0)

data_list = lapply(files, function(f) {
  df = read.table(f, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("response", "trial_type", "value")
  
  fname = basename(f)
  
  df$pretrain = as.numeric(sub("^pretrain([0-9]+)$", "\\1", basename(dirname(f))))
  df$pEpochs  = as.numeric(sub("^pEpochs_([0-9]+)_.*$", "\\1", fname))
  df$tEpochs  = as.numeric(sub("^.*_tEpochs_([0-9]+)_condition_.*$", "\\1", fname))
  df$condition = ifelse(grepl("CntrlHab(\\.txt)?$", fname), "control",
                        ifelse(grepl("ExpHab(\\.txt)?$", fname), "exp", NA))
  
  df$source_file   = fname
  df$source_folder = basename(dirname(f))
  df$source_path   = f
  
  df
})

D = do.call(rbind, data_list)

# create an ID column
D$ID = rep(1:1200, each = 2)

# condition
D$condition = rep(c("Control", "Experimental"), each = 120, times = 10)
D$condition = as.factor(D$condition)

# trial type
D$trialType = rep(c("Inefficient", "Efficient"), each = 1, times = 1200)

# looking time 
D$lookingTime = D$value

# ratio
D$ratio = as.factor(D$pretrain)
D$ratio = revalue(D$ratio, c("1000" = "100% constrained vs. 0% unconstrained", 
                             "5050" = "50% constrained vs. 50% unconstrained",
                             "6040" = "60% constrained vs. 40% unconstrained",
                             "7030" = "70% constrained vs. 30% unconstrained",
                             "8020" = "80% constrained vs. 20% unconstrained",
                             "9010" = "90% constrained vs. 10% unconstrained"))

D$ratio = factor(D$ratio, levels = c("100% constrained vs. 0% unconstrained",
                                     "90% constrained vs. 10% unconstrained",
                                     "80% constrained vs. 20% unconstrained",
                                     "70% constrained vs. 30% unconstrained",
                                     "60% constrained vs. 40% unconstrained",
                                     "50% constrained vs. 50% unconstrained"))

# order dataframe by ratio
D = D[order(D$ratio),]

# epochs
D$epochs = as.factor(D$tEpochs)
D$epochs = revalue(D$epochs, c("8" = "8 epochs", 
                             "9" = "9 epochs",
                             "10" = "10 epochs",
                             "11" = "11 epochs",
                             "12" = "12 epochs"))

D$epochs = factor(D$epochs, levels = c("8 epochs",
                                     "9 epochs",
                                     "10 epochs",
                                     "11 epochs"))


# remove columns
D = D[,c("ID","ratio","condition","trialType","epochs", "lookingTime")]

# confirm that it is a dataframe
is.data.frame(D)

####################
## OMNIBUS FIGURE ##
####################

# figure
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Network error") + # change the label of the y-axis
  facet_wrap(~ratio, ncol=3) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0, 200)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(axis.text.x = element_text(size = 25, angle = 20, hjust = 1),
        axis.text.y = element_text(size = 25), 
        legend.text=element_text(size=25),
        legend.title = element_text(size=25),
        axis.title=element_text(size=25),
        strip.text = element_text(
          size = 25), 
        axis.title.x = element_blank())