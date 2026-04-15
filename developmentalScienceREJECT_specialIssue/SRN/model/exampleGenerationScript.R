###########################################
# Gergely, Nadasdy, Csibra, & Biro (1995) #
###########################################



# Model Stimuli:
# Objects - pretraining
# Objects - habituation/test

###################################
# GENERATE VECTORS FOR SIMULATION #
###################################
############
## OBJECT ##
############

objects_stim = diag(82)
objects_stim_full = as.data.frame(objects_stim)

names(objects_stim_full) = NULL
rownames(objects_stim_full) = NULL
row.names(objects_stim_full) = NULL

####################
## ANIMACY TYPE ##
####################

animacy = data.frame(x = c('0 1', '1 0'))
names(animacy) = NULL

# ANIMATE: 1 0
# INANIMATE: 0 1

########################
##  PRETRAIN EXAMPLES ##
########################

# straight path objects
objects_left__trajectoryList0_pretrain = objects_stim_full[1:10,]
objects_right__trajectoryList0_pretrain = objects_stim_full[11:20,]

names(objects_left__trajectoryList0_pretrain) = NULL
rownames(objects_left__trajectoryList0_pretrain) = NULL
row.names(objects_left__trajectoryList0_pretrain) = NULL

names(objects_right__trajectoryList0_pretrain) = NULL
rownames(objects_right__trajectoryList0_pretrain) = NULL
row.names(objects_right__trajectoryList0_pretrain) = NULL

# straight path animates
animates_left__trajectoryList0_pretrain = objects_stim_full[21:30,]
animates_right__trajectoryList0_pretrain = objects_stim_full[31:40,]

names(animates_left__trajectoryList0_pretrain) = NULL
rownames(animates_left__trajectoryList0_pretrain) = NULL
row.names(animates_left__trajectoryList0_pretrain) = NULL

names(animates_right__trajectoryList0_pretrain) = NULL
rownames(animates_right__trajectoryList0_pretrain) = NULL
row.names(animates_right__trajectoryList0_pretrain) = NULL

# curved path objects: 1
objects_left__trajectoryList1_pretrain = objects_stim_full[41:50,]
objects_right__trajectoryList1_pretrain = objects_stim_full[51:60,]

names(objects_left__trajectoryList1_pretrain) = NULL
rownames(objects_left__trajectoryList1_pretrain) = NULL
row.names(objects_left__trajectoryList1_pretrain) = NULL

names(objects_right__trajectoryList1_pretrain) = NULL
rownames(objects_right__trajectoryList1_pretrain) = NULL
row.names(objects_right__trajectoryList1_pretrain) = NULL

# curved path animates: 1
animates_left__trajectoryList1_pretrain = objects_stim_full[61:70,]
animates_right__trajectoryList1_pretrain = objects_stim_full[71:80,]

names(animates_left__trajectoryList1_pretrain) = NULL
rownames(animates_left__trajectoryList1_pretrain) = NULL
row.names(animates_left__trajectoryList1_pretrain) = NULL

names(animates_right__trajectoryList1_pretrain) = NULL
rownames(animates_right__trajectoryList1_pretrain) = NULL
row.names(animates_right__trajectoryList1_pretrain) = NULL





###################################
## HABITUATION AND TEST EXAMPLES ##
###################################

objects_left_hab_test = objects_stim_full[81,]
objects_right_hab_test = objects_stim_full[82,]

names(objects_left_hab_test) = NULL
rownames(objects_left_hab_test) = NULL
row.names(objects_left_hab_test) = NULL

names(objects_right_hab_test) = NULL
rownames(objects_right_hab_test) = NULL
row.names(objects_right_hab_test) = NULL


###############
##############
## BARRIERS ##
##############
##############

## HEIGHTS: ##
## 2 X 2 ((c(7,8),c(3,4)) -- PRETRAINING
## 4 X 2 (c(5,6,7,8),c(3,4)) -- GERGELY ET AL. (1995); LIU & SPELKE (2017) HABITUATION
## 5 x 2 (c(4,5,6,7,8),c(3,4)) -- LIU & SPELKE (2017) HABITUATION
## 6 X 2 (c(3,4,5,6,7,8),c(3,4)) -- LIU & SPELKE (2017) HABITUATION
## 1 x 2 ((c(8),c(3,4)) -- LIU & SPELKE (2017) TEST (trajectoryList1)

# no barrier (for test events in gerg)
noBarrier = matrix(0, nrow = 8, ncol = 8)
noBarrier = as.data.frame(noBarrier)
names(noBarrier) = NULL
rownames(noBarrier) = NULL
row.names(noBarrier) = NULL
colnames(noBarrier) = NULL

# 2 x 2 
ptrainGrid.1 = matrix(0, nrow = 8, ncol = 8)
ptrainGrid.1[c(7,8), c(3,4)] = 1
ptrainGrid.1 = as.data.frame(ptrainGrid.1)
names(ptrainGrid.1) = NULL
rownames(ptrainGrid.1) = NULL
row.names(ptrainGrid.1) = NULL
colnames(ptrainGrid.1) = NULL

ptrainGrid.2 = matrix(0, nrow = 8, ncol = 8)
ptrainGrid.2[c(7,8), c(7,8)] = 1
ptrainGrid.2 = as.data.frame(ptrainGrid.2)
names(ptrainGrid.2) = NULL
rownames(ptrainGrid.2) = NULL
row.names(ptrainGrid.2) = NULL
colnames(ptrainGrid.2) = NULL

# 4 x 2
fourTwoGrid.1 = matrix(0, nrow = 8, ncol = 8)
fourTwoGrid.1[c(5,6,7,8), c(3,4)] = 1
fourTwoGrid.1 = as.data.frame(fourTwoGrid.1)
names(fourTwoGrid.1) = NULL
rownames(fourTwoGrid.1) = NULL
row.names(fourTwoGrid.1) = NULL
colnames(fourTwoGrid.1) = NULL

fourTwoGrid.2 = matrix(0, nrow = 8, ncol = 8)
fourTwoGrid.2[c(5,6,7,8), c(7,8)] = 1
fourTwoGrid.2 = as.data.frame(fourTwoGrid.2)
names(fourTwoGrid.2) = NULL
rownames(fourTwoGrid.2) = NULL
row.names(fourTwoGrid.2) = NULL
colnames(fourTwoGrid.2) = NULL

# 5 x 2
fiveTwoGrid.1 = matrix(0, nrow = 8, ncol = 8)
fiveTwoGrid.1[c(4,5,6,7,8), c(3,4)] = 1
fiveTwoGrid.1 = as.data.frame(fiveTwoGrid.1)
names(fiveTwoGrid.1) = NULL
rownames(fiveTwoGrid.1) = NULL
row.names(fiveTwoGrid.1) = NULL
colnames(fiveTwoGrid.1) = NULL

fiveTwoGrid.2 = matrix(0, nrow = 8, ncol = 8)
fiveTwoGrid.2[c(4,5,6,7,8), c(7,8)] = 1
fiveTwoGrid.2 = as.data.frame(fiveTwoGrid.2)
names(fiveTwoGrid.2) = NULL
rownames(fiveTwoGrid.2) = NULL
row.names(fiveTwoGrid.2) = NULL
colnames(fiveTwoGrid.2) = NULL

# 6 x 2
sixTwoGrid.1 = matrix(0, nrow = 8, ncol = 8)
sixTwoGrid.1[c(3, 4,5,6,7,8), c(3,4)] = 1
sixTwoGrid.1 = as.data.frame(sixTwoGrid.1)
names(sixTwoGrid.1) = NULL
rownames(sixTwoGrid.1) = NULL
row.names(sixTwoGrid.1) = NULL
colnames(sixTwoGrid.1) = NULL

sixTwoGrid.2 = matrix(0, nrow = 8, ncol = 8)
sixTwoGrid.2[c(3, 4,5,6,7,8), c(7,8)] = 1
sixTwoGrid.2 = as.data.frame(sixTwoGrid.2)
names(sixTwoGrid.2) = NULL
rownames(sixTwoGrid.2) = NULL
row.names(sixTwoGrid.2) = NULL
colnames(sixTwoGrid.2) = NULL


# 1 x 2
oneTwoGrid.1 = matrix(0, nrow = 8, ncol = 8)
oneTwoGrid.1[c(8), c(3,4)] = 1
oneTwoGrid.1 = as.data.frame(oneTwoGrid.1)
names(oneTwoGrid.1) = NULL
rownames(oneTwoGrid.1) = NULL
row.names(oneTwoGrid.1) = NULL
colnames(oneTwoGrid.1) = NULL

oneTwoGrid.2 = matrix(0, nrow = 8, ncol = 8)
oneTwoGrid.2[c(8), c(7,8)] = 1
oneTwoGrid.2 = as.data.frame(oneTwoGrid.2)
names(oneTwoGrid.2) = NULL
rownames(oneTwoGrid.2) = NULL
row.names(oneTwoGrid.2) = NULL
colnames(oneTwoGrid.2) = NULL



##############################
##############################
## STRAIGHT PATH TRAJECTORY ##
##############################
##############################
straightPath = list()

timeStep1 = matrix(0, nrow = 8, ncol = 8)
timeStep1[8, 1] = 1
straightPath[[1]] = timeStep1
straightPath[[1]] = as.data.frame(straightPath[[1]])
names(straightPath[[1]]) = NULL
rownames(straightPath[[1]]) = NULL
row.names(straightPath[[1]]) = NULL
colnames(straightPath[[1]]) = NULL


timeStep2 = matrix(0, nrow = 8, ncol = 8)
timeStep2[8, 2] = 1
straightPath[[2]] = timeStep2
straightPath[[2]] = as.data.frame(straightPath[[2]])
names(straightPath[[2]]) = NULL
rownames(straightPath[[2]]) = NULL
row.names(straightPath[[2]]) = NULL
colnames(straightPath[[2]]) = NULL

timeStep3 = matrix(0, nrow = 8, ncol = 8)
timeStep3[8, 3] = 1
straightPath[[3]] = timeStep3
straightPath[[3]] = as.data.frame(straightPath[[3]])
names(straightPath[[3]]) = NULL
rownames(straightPath[[3]]) = NULL
row.names(straightPath[[3]]) = NULL
colnames(straightPath[[3]]) = NULL

timeStep4 = matrix(0, nrow = 8, ncol = 8)
timeStep4[8, 4] = 1
straightPath[[4]] = timeStep4
straightPath[[4]] = as.data.frame(straightPath[[4]])
names(straightPath[[4]]) = NULL
rownames(straightPath[[4]]) = NULL
row.names(straightPath[[4]]) = NULL
colnames(straightPath[[4]]) = NULL

timeStep5 = matrix(0, nrow = 8, ncol = 8)
timeStep5[8, 5] = 1
straightPath[[5]] = timeStep5
straightPath[[5]] = as.data.frame(straightPath[[5]])
names(straightPath[[5]]) = NULL
rownames(straightPath[[5]]) = NULL
row.names(straightPath[[5]]) = NULL
colnames(straightPath[[5]]) = NULL

timeStep6 = matrix(0, nrow = 8, ncol = 8)
timeStep6[8, 6] = 1
straightPath[[6]] = timeStep6
straightPath[[6]] = as.data.frame(straightPath[[6]])
names(straightPath[[6]]) = NULL
rownames(straightPath[[6]]) = NULL
row.names(straightPath[[6]]) = NULL
colnames(straightPath[[6]]) = NULL


straightPath.1 = list()

timeStep1 = matrix(0, nrow = 8, ncol = 8)
timeStep1[7, 1] = 1
straightPath.1[[1]] = timeStep1
straightPath.1[[1]] = as.data.frame(straightPath.1[[1]])
names(straightPath.1[[1]]) = NULL
rownames(straightPath.1[[1]]) = NULL
row.names(straightPath.1[[1]]) = NULL
colnames(straightPath.1[[1]]) = NULL


timeStep2 = matrix(0, nrow = 8, ncol = 8)
timeStep2[7, 2] = 1
straightPath.1[[2]] = timeStep2
straightPath.1[[2]] = as.data.frame(straightPath.1[[2]])
names(straightPath.1[[2]]) = NULL
rownames(straightPath.1[[2]]) = NULL
row.names(straightPath.1[[2]]) = NULL
colnames(straightPath.1[[2]]) = NULL

timeStep3 = matrix(0, nrow = 8, ncol = 8)
timeStep3[7, 3] = 1
straightPath.1[[3]] = timeStep3
straightPath.1[[3]] = as.data.frame(straightPath.1[[3]])
names(straightPath.1[[3]]) = NULL
rownames(straightPath.1[[3]]) = NULL
row.names(straightPath.1[[3]]) = NULL
colnames(straightPath.1[[3]]) = NULL

timeStep4 = matrix(0, nrow = 8, ncol = 8)
timeStep4[7, 4] = 1
straightPath.1[[4]] = timeStep4
straightPath.1[[4]] = as.data.frame(straightPath.1[[4]])
names(straightPath.1[[4]]) = NULL
rownames(straightPath.1[[4]]) = NULL
row.names(straightPath.1[[4]]) = NULL
colnames(straightPath.1[[4]]) = NULL

timeStep5 = matrix(0, nrow = 8, ncol = 8)
timeStep5[7, 5] = 1
straightPath.1[[5]] = timeStep5
straightPath.1[[5]] = as.data.frame(straightPath.1[[5]])
names(straightPath.1[[5]]) = NULL
rownames(straightPath.1[[5]]) = NULL
row.names(straightPath.1[[5]]) = NULL
colnames(straightPath.1[[5]]) = NULL

timeStep6 = matrix(0, nrow = 8, ncol = 8)
timeStep6[7, 6] = 1
straightPath.1[[6]] = timeStep6
straightPath.1[[6]] = as.data.frame(straightPath.1[[6]])
names(straightPath.1[[6]]) = NULL
rownames(straightPath.1[[6]]) = NULL
row.names(straightPath.1[[6]]) = NULL
colnames(straightPath.1[[6]]) = NULL
##################################################
##################################################
## EXPERIMENTAL/PRETRAINING CURVED TRAJECTORIES ##
##################################################
##################################################

# curved trajectory #
# curved trajectories (from shortest to biggest): 
# trajectoryList1 ((c(8),c(3,4)) -- LIU & SPELKE (2017) TEST (trajectoryList1)
# trajectoryList2 (c(7,8),c(3,4))  -- use for pretraining for all studies
# trajectoryList3 (c(5,6,7,8),c(3,4)) -- use for habituation for gergely et al. (1995) and shari & spelke (2017)
# trajectoryList4 (c(4,5,6,7,8),c(3,4)) -- use for habituation for shari & spelke (2017)
# trajectoryList5 (c(3,4,5,6,7,8),c(3,4)) -- use for habituation for shari & spelke (2017)


# corresponds to the 1 x 2 grid used in Liu Spelke test
trajectoryList1 = list()

timeStep1 = matrix(0, nrow = 8, ncol = 8)
timeStep1[8, 1] = 1
trajectoryList1[[1]] = timeStep1
trajectoryList1[[1]] = as.data.frame(trajectoryList1[[1]])
names(trajectoryList1[[1]]) = NULL
rownames(trajectoryList1[[1]]) = NULL
row.names(trajectoryList1[[1]]) = NULL
colnames(trajectoryList1[[1]]) = NULL


timeStep2 = matrix(0, nrow = 8, ncol = 8)
timeStep2[7, 2] = 1
trajectoryList1[[2]] = timeStep2
trajectoryList1[[2]] = as.data.frame(trajectoryList1[[2]])
names(trajectoryList1[[2]]) = NULL
rownames(trajectoryList1[[2]]) = NULL
row.names(trajectoryList1[[2]]) = NULL
colnames(trajectoryList1[[2]]) = NULL

timeStep3 = matrix(0, nrow = 8, ncol = 8)
timeStep3[7, 3] = 1
trajectoryList1[[3]] = timeStep3
trajectoryList1[[3]] = as.data.frame(trajectoryList1[[3]])
names(trajectoryList1[[3]]) = NULL
rownames(trajectoryList1[[3]]) = NULL
row.names(trajectoryList1[[3]]) = NULL
colnames(trajectoryList1[[3]]) = NULL

timeStep4 = matrix(0, nrow = 8, ncol = 8)
timeStep4[7, 4] = 1
trajectoryList1[[4]] = timeStep4
trajectoryList1[[4]] = as.data.frame(trajectoryList1[[4]])
names(trajectoryList1[[4]]) = NULL
rownames(trajectoryList1[[4]]) = NULL
row.names(trajectoryList1[[4]]) = NULL
colnames(trajectoryList1[[4]]) = NULL

timeStep5 = matrix(0, nrow = 8, ncol = 8)
timeStep5[8, 5] = 1
trajectoryList1[[5]] = timeStep5
trajectoryList1[[5]] = as.data.frame(trajectoryList1[[5]])
names(trajectoryList1[[5]]) = NULL
rownames(trajectoryList1[[5]]) = NULL
row.names(trajectoryList1[[5]]) = NULL
colnames(trajectoryList1[[5]]) = NULL

timeStep6 = matrix(0, nrow = 8, ncol = 8)
timeStep6[8, 6] = 1
trajectoryList1[[6]] = timeStep6
trajectoryList1[[6]] = as.data.frame(trajectoryList1[[6]])
names(trajectoryList1[[6]]) = NULL
rownames(trajectoryList1[[6]]) = NULL
row.names(trajectoryList1[[6]]) = NULL
colnames(trajectoryList1[[6]]) = NULL


# corresponds to 2 x 2 grid (pretraining)
trajectoryList2 = list()

timeStep1 = matrix(0, nrow = 8, ncol = 8)
timeStep1[8, 1] = 1
trajectoryList2[[1]] = timeStep1
trajectoryList2[[1]] = as.data.frame(trajectoryList2[[1]])
names(trajectoryList2[[1]]) = NULL
rownames(trajectoryList2[[1]]) = NULL
row.names(trajectoryList2[[1]]) = NULL
colnames(trajectoryList2[[1]]) = NULL


timeStep2 = matrix(0, nrow = 8, ncol = 8)
timeStep2[6, 2] = 1
trajectoryList2[[2]] = timeStep2
trajectoryList2[[2]] = as.data.frame(trajectoryList2[[2]])
names(trajectoryList2[[2]]) = NULL
rownames(trajectoryList2[[2]]) = NULL
row.names(trajectoryList2[[2]]) = NULL
colnames(trajectoryList2[[2]]) = NULL

timeStep3 = matrix(0, nrow = 8, ncol = 8)
timeStep3[6, 3] = 1
trajectoryList2[[3]] = timeStep3
trajectoryList2[[3]] = as.data.frame(trajectoryList2[[3]])
names(trajectoryList2[[3]]) = NULL
rownames(trajectoryList2[[3]]) = NULL
row.names(trajectoryList2[[3]]) = NULL
colnames(trajectoryList2[[3]]) = NULL

timeStep4 = matrix(0, nrow = 8, ncol = 8)
timeStep4[6, 4] = 1
trajectoryList2[[4]] = timeStep4
trajectoryList2[[4]] = as.data.frame(trajectoryList2[[4]])
names(trajectoryList2[[4]]) = NULL
rownames(trajectoryList2[[4]]) = NULL
row.names(trajectoryList2[[4]]) = NULL
colnames(trajectoryList2[[4]]) = NULL

timeStep5 = matrix(0, nrow = 8, ncol = 8)
timeStep5[8, 5] = 1
trajectoryList2[[5]] = timeStep5
trajectoryList2[[5]] = as.data.frame(trajectoryList2[[5]])
names(trajectoryList2[[5]]) = NULL
rownames(trajectoryList2[[5]]) = NULL
row.names(trajectoryList2[[5]]) = NULL
colnames(trajectoryList2[[5]]) = NULL

timeStep6 = matrix(0, nrow = 8, ncol = 8)
timeStep6[8, 6] = 1
trajectoryList2[[6]] = timeStep6
trajectoryList2[[6]] = as.data.frame(trajectoryList2[[6]])
names(trajectoryList2[[6]]) = NULL
rownames(trajectoryList2[[6]]) = NULL
row.names(trajectoryList2[[6]]) = NULL
colnames(trajectoryList2[[6]]) = NULL


# corresponds to 4 x 2 (gerg and liu sims)
trajectoryList3 = list()

timeStep1 = matrix(0, nrow = 8, ncol = 8)
timeStep1[8, 1] = 1
trajectoryList3[[1]] = timeStep1
trajectoryList3[[1]] = as.data.frame(trajectoryList3[[1]])
names(trajectoryList3[[1]]) = NULL
rownames(trajectoryList3[[1]]) = NULL
row.names(trajectoryList3[[1]]) = NULL
colnames(trajectoryList3[[1]]) = NULL


timeStep2 = matrix(0, nrow = 8, ncol = 8)
timeStep2[4, 2] = 1
trajectoryList3[[2]] = timeStep2
trajectoryList3[[2]] = as.data.frame(trajectoryList3[[2]])
names(trajectoryList3[[2]]) = NULL
rownames(trajectoryList3[[2]]) = NULL
row.names(trajectoryList3[[2]]) = NULL
colnames(trajectoryList3[[2]]) = NULL

timeStep3 = matrix(0, nrow = 8, ncol = 8)
timeStep3[4, 3] = 1
trajectoryList3[[3]] = timeStep3
trajectoryList3[[3]] = as.data.frame(trajectoryList3[[3]])
names(trajectoryList3[[3]]) = NULL
rownames(trajectoryList3[[3]]) = NULL
row.names(trajectoryList3[[3]]) = NULL
colnames(trajectoryList3[[3]]) = NULL

timeStep4 = matrix(0, nrow = 8, ncol = 8)
timeStep4[4, 4] = 1
trajectoryList3[[4]] = timeStep4
trajectoryList3[[4]] = as.data.frame(trajectoryList3[[4]])
names(trajectoryList3[[4]]) = NULL
rownames(trajectoryList3[[4]]) = NULL
row.names(trajectoryList3[[4]]) = NULL
colnames(trajectoryList3[[4]]) = NULL

timeStep5 = matrix(0, nrow = 8, ncol = 8)
timeStep5[8, 5] = 1
trajectoryList3[[5]] = timeStep5
trajectoryList3[[5]] = as.data.frame(trajectoryList3[[5]])
names(trajectoryList3[[5]]) = NULL
rownames(trajectoryList3[[5]]) = NULL
row.names(trajectoryList3[[5]]) = NULL
colnames(trajectoryList3[[5]]) = NULL

timeStep6 = matrix(0, nrow = 8, ncol = 8)
timeStep6[8, 6] = 1
trajectoryList3[[6]] = timeStep6
trajectoryList3[[6]] = as.data.frame(trajectoryList3[[6]])
names(trajectoryList3[[6]]) = NULL
rownames(trajectoryList3[[6]]) = NULL
row.names(trajectoryList3[[6]]) = NULL
colnames(trajectoryList3[[6]]) = NULL


# corresponds to 5 x 2 grid (liu spelke 2017)
trajectoryList4 = list()

timeStep1 = matrix(0, nrow = 8, ncol = 8)
timeStep1[8, 1] = 1
trajectoryList4[[1]] = timeStep1
trajectoryList4[[1]] = as.data.frame(trajectoryList4[[1]])
names(trajectoryList4[[1]]) = NULL
rownames(trajectoryList4[[1]]) = NULL
row.names(trajectoryList4[[1]]) = NULL
colnames(trajectoryList4[[1]]) = NULL


timeStep2 = matrix(0, nrow = 8, ncol = 8)
timeStep2[3, 2] = 1
trajectoryList4[[2]] = timeStep2
trajectoryList4[[2]] = as.data.frame(trajectoryList4[[2]])
names(trajectoryList4[[2]]) = NULL
rownames(trajectoryList4[[2]]) = NULL
row.names(trajectoryList4[[2]]) = NULL
colnames(trajectoryList4[[2]]) = NULL

timeStep3 = matrix(0, nrow = 8, ncol = 8)
timeStep3[3, 3] = 1
trajectoryList4[[3]] = timeStep3
trajectoryList4[[3]] = as.data.frame(trajectoryList4[[3]])
names(trajectoryList4[[3]]) = NULL
rownames(trajectoryList4[[3]]) = NULL
row.names(trajectoryList4[[3]]) = NULL
colnames(trajectoryList4[[3]]) = NULL

timeStep4 = matrix(0, nrow = 8, ncol = 8)
timeStep4[3, 4] = 1
trajectoryList4[[4]] = timeStep4
trajectoryList4[[4]] = as.data.frame(trajectoryList4[[4]])
names(trajectoryList4[[4]]) = NULL
rownames(trajectoryList4[[4]]) = NULL
row.names(trajectoryList4[[4]]) = NULL
colnames(trajectoryList4[[4]]) = NULL

timeStep5 = matrix(0, nrow = 8, ncol = 8)
timeStep5[8, 5] = 1
trajectoryList4[[5]] = timeStep5
trajectoryList4[[5]] = as.data.frame(trajectoryList4[[5]])
names(trajectoryList4[[5]]) = NULL
rownames(trajectoryList4[[5]]) = NULL
row.names(trajectoryList4[[5]]) = NULL
colnames(trajectoryList4[[5]]) = NULL

timeStep6 = matrix(0, nrow = 8, ncol = 8)
timeStep6[8, 6] = 1
trajectoryList4[[6]] = timeStep6
trajectoryList4[[6]] = as.data.frame(trajectoryList4[[6]])
names(trajectoryList4[[6]]) = NULL
rownames(trajectoryList4[[6]]) = NULL
row.names(trajectoryList4[[6]]) = NULL
colnames(trajectoryList4[[6]]) = NULL



# corresponds to 6 x 2 grid (liu spelke 2017)
trajectoryList5 = list()

timeStep1 = matrix(0, nrow = 8, ncol = 8)
timeStep1[8, 1] = 1
trajectoryList5[[1]] = timeStep1
trajectoryList5[[1]] = as.data.frame(trajectoryList5[[1]])
names(trajectoryList5[[1]]) = NULL
rownames(trajectoryList5[[1]]) = NULL
row.names(trajectoryList5[[1]]) = NULL
colnames(trajectoryList5[[1]]) = NULL


timeStep2 = matrix(0, nrow = 8, ncol = 8)
timeStep2[2, 2] = 1
trajectoryList5[[2]] = timeStep2
trajectoryList5[[2]] = as.data.frame(trajectoryList5[[2]])
names(trajectoryList5[[2]]) = NULL
rownames(trajectoryList5[[2]]) = NULL
row.names(trajectoryList5[[2]]) = NULL
colnames(trajectoryList5[[2]]) = NULL

timeStep3 = matrix(0, nrow = 8, ncol = 8)
timeStep3[2, 3] = 1
trajectoryList5[[3]] = timeStep3
trajectoryList5[[3]] = as.data.frame(trajectoryList5[[3]])
names(trajectoryList5[[3]]) = NULL
rownames(trajectoryList5[[3]]) = NULL
row.names(trajectoryList5[[3]]) = NULL
colnames(trajectoryList5[[3]]) = NULL

timeStep4 = matrix(0, nrow = 8, ncol = 8)
timeStep4[2, 4] = 1
trajectoryList5[[4]] = timeStep4
trajectoryList5[[4]] = as.data.frame(trajectoryList5[[4]])
names(trajectoryList5[[4]]) = NULL
rownames(trajectoryList5[[4]]) = NULL
row.names(trajectoryList5[[4]]) = NULL
colnames(trajectoryList5[[4]]) = NULL

timeStep5 = matrix(0, nrow = 8, ncol = 8)
timeStep5[8, 5] = 1
trajectoryList5[[5]] = timeStep5
trajectoryList5[[5]] = as.data.frame(trajectoryList5[[5]])
names(trajectoryList5[[5]]) = NULL
rownames(trajectoryList5[[5]]) = NULL
row.names(trajectoryList5[[5]]) = NULL
colnames(trajectoryList5[[5]]) = NULL

timeStep6 = matrix(0, nrow = 8, ncol = 8)
timeStep6[8, 6] = 1
trajectoryList5[[6]] = timeStep6
trajectoryList5[[6]] = as.data.frame(trajectoryList5[[6]])
names(trajectoryList5[[6]]) = NULL
rownames(trajectoryList5[[6]]) = NULL
row.names(trajectoryList5[[6]]) = NULL
colnames(trajectoryList5[[6]]) = NULL





#################
## PRETRAINING ##
#################

## set the working directory for the global pretraining file
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/model")
#setwd("C:/Users/detbe/Documents/projects/NEWgergliuSims/model")

n = nrow(objects_left__trajectoryList0_pretrain)
n1 = nrow(objects_left__trajectoryList1_pretrain)
l = 1
l1 = 1
l2 = 1
l3 = 1
l4 = 1
l5 = 1

sink('pretrain.ex')

# straight trajectory: objects
for(i in 1:n){
  cat(paste("name: ObjectStraightTrajectory", l, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  cat(paste("freq: 1", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(objects_left__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(objects_right__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(straightPath.1[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(objects_left__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Person 2
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(objects_right__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Causality
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(straightPath.1[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l = l+1
}

# straight trajectory: animates
for(i in 1:n){
  cat(paste("name: animateStraightTrajectory", l1, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  cat(paste("freq: 1", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(animates_left__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    

    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(animates_right__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    

    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(straightPath.1[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(animates_left__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Person 2
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(animates_right__trajectoryList0_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Causality
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(straightPath.1[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}


# curved trajectory 1: objects
for(i in 1:n1){
  cat(paste("name: objectCurvedTrajectory1_", l2, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(objects_left__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    
    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(objects_right__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(trajectoryList2[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(ptrainGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(objects_left__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Person 2
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(objects_right__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Causality
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(trajectoryList2[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(ptrainGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# curved trajectory 1: animates
for(i in 1:n1){
  cat(paste("name: animateCurvedTrajectory3_", l4, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(animates_left__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(animates_right__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(trajectoryList2[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(ptrainGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(animates_left__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Person 2
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(animates_right__trajectoryList1_pretrain[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    # Causality
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(trajectoryList2[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(ptrainGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
    
    
    
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l4 = l4+1
}

sink()





###########################
## GERGELY ET AL. (1995) ##
###########################

## set the working directory for the Gergeley et al. (1995) study
#setwd("C:/Users/detbe/Documents/projects/NEWgergliuSims/model")
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/model")

l6 = 1
l7 = 1
l8 = 1

sink('gergEtAl95Hab.ex')
cat(paste("name: habituation", l6, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList3[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(fourTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList3[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(fourTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l6 = l6+1

sink()



sink('gergEtAl95Test.ex')

# inconsistent event
cat(paste("name: inconsistent", l7, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList3[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList3[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l7 = l7+1




# consistent event
cat(paste("name: consistent", l8, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(straightPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(straightPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(noBarrier, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l8 = l8+1

sink()

l9 = 1
l10 = 1
sink('gergEtAl95CntrlHab.ex')

cat(paste("name: habituation", l9, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
cat(paste("proc: {setLinkValues learningRate 0.001 -type occluderSalience 
  setLinkValues weightDecay 0.01 -type occluderSalience}", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList3[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(fourTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList3[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(fourTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l9 = l9+1

sink()


#########################
## LIU & SPELKE (2017) ##
#########################

################
################
# EXPERIMENT 1 #
################
################

## set the working directory for the Liu & Spelke (2017) study
#setwd("C:/Users/detbe/Documents/projects/NEWgergliuSims/model")
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/model")

l10 = 1
l11 = 1
l12 = 1

sink('liuSpelke17Hab_exp1.ex')
cat(paste("name: largeJump", l12, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # short jump
  
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList5[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(sixTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList5[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(sixTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l12 = l12+1

sink()


l13 = 1
l14 = 1

sink('liuSpelke17Test_exp1.ex')

# inconsistent event
cat(paste("name: lowInefficient", l13, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList1[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList1[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l13 = l13+1




# consistent event
cat(paste("name: highInefficient", l14, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList5[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList5[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l14 = l14+1

sink()



##################
## EXPERIMENT 2 ##
##################

l15 = 1
l16 = 1
l17 = 1
sink('liuSpelke17Hab_exp2.ex')
cat(paste("name: largeJump", l17, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # short jump
  
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList5[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(sixTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList5[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(sixTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l17 = l17+1

sink()


l18 = 1
l19 = 1


sink('liuSpelke17Test_exp2.ex')

# inconsistent event
cat(paste("name: lowInefficient", l18, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList1[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(oneTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList1[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(oneTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l18 = l18+1




# consistent event
cat(paste("name: highInefficient", l19, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList5[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(oneTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList5[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(oneTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l19 = l19+1

sink()




##################
## EXPERIMENT 3 ##
##################

l20 = 1
l21 = 1
l22 = 1

sink('liuSpelke17Hab_exp3.ex')
cat(paste("name: largeJump", l22, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # short jump
  
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList5[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(sixTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList5[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(sixTwoGrid.2, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l22 = l22+1

sink()



l23 = 1
l24 = 1

sink('liuSpelke17Test_exp3.ex')

# inconsistent event
cat(paste("name: lowInefficient", l23, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList1[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList1[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l23 = l23+1




# consistent event
cat(paste("name: highInefficient", l24, "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(trajectoryList5[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Person 2
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)

  
  # Causality
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(trajectoryList5[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(oneTwoGrid.1, sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  
}
cat(paste(";", sep="\t"))
cat("\n")

l24 = l24+1

sink()