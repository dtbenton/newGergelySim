###################################################
# Script for generating idealized, synthetic data #
###################################################

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

set.seed(123)

N = 20

D = expand.grid(
  id = 1:N,
  condition = c("Constrained Action", "Unconstrained Action"),
  trialType = c("Efficient", "Inefficient")
)

D$lookingTime = NA

# Constrained Action condition
D$lookingTime[D$condition == "Constrained Action" &
                D$trialType == "Efficient"] =
  rnorm(N, 8, 1.5)

D$lookingTime[D$condition == "Constrained Action" &
                D$trialType == "Inefficient"] =
  rnorm(N, 12, 1.5)

# Unconstrained Action condition
D$lookingTime[D$condition == "Unconstrained Action" &
                D$trialType == "Efficient"] =
  rnorm(N, 9, 1.5)

D$lookingTime[D$condition == "Unconstrained Action" &
                D$trialType == "Inefficient"] =
  rnorm(N, 9, 1.5)


####################
## OMNIBUS FIGURE ##
####################

D.effective.exp = subset(D, ! effectiveness %in% c("Ineffective"))
D.effective.exp = subset(D.effective.exp, ! condition %in% c("Control"))

# figure
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  ylab("Looking Time") +
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~condition, scales = "free_y") +
  coord_cartesian(ylim=c(0, 13)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill = "Test Trial") +
  theme(
    axis.text.x = element_text(size = 30),
    axis.text.y = element_text(size = 30),
    legend.text = element_text(size = 30),
    legend.title = element_text(size = 30),
    axis.title = element_text(size = 30),
    strip.text = element_text(size = 30),
    axis.title.x = element_blank()
  ) + 
  theme(legend.position = "none")



setwd("C:/Users/detbe/Documents/projects/newGergelySim/psychologicalReview/figures")
ggsave(
  "idealizedDataTargetFinding1.png",
  plot = condition_barplot,
  width = 20,
  height = 10,
  dpi = 300
)
