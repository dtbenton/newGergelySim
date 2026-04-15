################
# Simulation 4 #
################

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

##################
## ANIMACY TYPE ##
##################

animacy = data.frame(x = c('0 1', '1 0'))
names(animacy) = NULL

# ANIMATE: 1 0
# INANIMATE: 0 1

###############
## CLEARANCE ##
###############
clearance = data.frame(x = c('1 0 0', '0 1 0', '0 0 1'))
names(clearance) = NULL

# NO CLEARANCE (FOR NO JUMP EVENTS): 1 0 0
# SMALL CLEARANCE: 0 1 0
# LARGE CLEARANCE: 0 0 1


##############
## LOCATION ##
##############
location = data.frame(x = c('0 1', '1 0'))
names(location) = NULL


# REAL WORLD: 0 1
# LAB: 1 0

######################
## STOPPING BY GOAL ##
######################

goal = data.frame(x = c('0', '1'))
names(goal) = NULL

# STOP BY GOAL: 1
# NOT STOP BY GOAL: 0 

########################
##  PRETRAIN EXAMPLES ##
########################

# straight path objects
objects_left_straight = objects_stim_full[1:10,]
objects_right_straight = objects_stim_full[11:20,]

names(objects_left_straight) = NULL
rownames(objects_left_straight) = NULL
row.names(objects_left_straight) = NULL

names(objects_right_straight) = NULL
rownames(objects_right_straight) = NULL
row.names(objects_right_straight) = NULL

# straight path animates
animate_left_straight = objects_stim_full[21:30,]
animate_right_straight = objects_stim_full[31:40,]

names(animate_left_straight) = NULL
rownames(animate_left_straight) = NULL
row.names(animate_left_straight) = NULL

names(animate_right_straight) = NULL
rownames(animate_right_straight) = NULL
row.names(animate_right_straight) = NULL

# curved path objects: 1
objects_left_curved = objects_stim_full[41:50,]
objects_right_curved = objects_stim_full[51:60,]

names(objects_left_curved) = NULL
rownames(objects_left_curved) = NULL
row.names(objects_left_curved) = NULL

names(objects_right_curved) = NULL
rownames(objects_right_curved) = NULL
row.names(objects_right_curved) = NULL

# curved path animates: 1
animates_left_curved = objects_stim_full[61:70,]
animates_right_curved = objects_stim_full[71:80,]

names(animates_left_curved) = NULL
rownames(animates_left_curved) = NULL
row.names(animates_left_curved) = NULL

names(animates_right_curved) = NULL
rownames(animates_right_curved) = NULL
row.names(animates_right_curved) = NULL





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


##############
##############
## BARRIERS ##
##############
##############

## HEIGHTS: ##
## 1 x 2  LIU & SPELKE (2017) TEST (trajectoryList1)
## 2 X 2 PRETRAINING
## 4 X 2 GERGELY ET AL. (1995); LIU & SPELKE (2017) HABITUATION
## 6 X 2 LIU & SPELKE (2017) HABITUATION

barrier = data.frame(x = c('1 0 0 0 0', 
                           '0 1 0 0 0',
                           '0 0 1 0 0',
                           '0 0 0 1 0',
                           '0 0 0 0 1'))
names(barrier) = NULL

# NO BARRIER: 1 0 0 0 0
# 1x2: 0 1 0 0 0 0
# 2x2: 0 0 1 0 0 0
# 4x2: 0 0 0 1 0 0
# 5x2: 0 0 0 0 1 0
# 6x2: 0 0 0 0 0 1


barrier_position = data.frame(x = c('1 0 0','0 1 0', 
                                    '0 0 1'))
names(barrier_position) = NULL

# no barrier: 1 0 0
# barrier middle: 0 1 0
# barrier right: 0 0 1

##################
##################
## TRAJECTORIES ##
##################
##################

trajectory = data.frame(x = c('1 0', 
                              '0 1'))
names(trajectory) = NULL

# straight: 1 0
# curved: 0 1


############
############
## MOTION ##
############
############

# STRAIGHT PATH
motionPath = list()

timeStep1 = matrix(0, nrow = 1, ncol = 6)
timeStep1[1, 1] = 1
motionPath[[1]] = timeStep1
motionPath[[1]] = as.data.frame(motionPath[[1]])
names(motionPath[[1]]) = NULL
rownames(motionPath[[1]]) = NULL
row.names(motionPath[[1]]) = NULL
colnames(motionPath[[1]]) = NULL


timeStep2 = matrix(0, nrow = 1, ncol = 6)
timeStep2[1, 2] = 1
motionPath[[2]] = timeStep2
motionPath[[2]] = as.data.frame(motionPath[[2]])
names(motionPath[[2]]) = NULL
rownames(motionPath[[2]]) = NULL
row.names(motionPath[[2]]) = NULL
colnames(motionPath[[2]]) = NULL

timeStep3 = matrix(0, nrow = 1, ncol = 6)
timeStep3[1, 3] = 1
motionPath[[3]] = timeStep3
motionPath[[3]] = as.data.frame(motionPath[[3]])
names(motionPath[[3]]) = NULL
rownames(motionPath[[3]]) = NULL
row.names(motionPath[[3]]) = NULL
colnames(motionPath[[3]]) = NULL

timeStep4 = matrix(0, nrow = 1, ncol = 6)
timeStep4[1, 4] = 1
motionPath[[4]] = timeStep4
motionPath[[4]] = as.data.frame(motionPath[[4]])
names(motionPath[[4]]) = NULL
rownames(motionPath[[4]]) = NULL
row.names(motionPath[[4]]) = NULL
colnames(motionPath[[4]]) = NULL

timeStep5 = matrix(0, nrow = 1, ncol = 6)
timeStep5[1, 5] = 1
motionPath[[5]] = timeStep5
motionPath[[5]] = as.data.frame(motionPath[[5]])
names(motionPath[[5]]) = NULL
rownames(motionPath[[5]]) = NULL
row.names(motionPath[[5]]) = NULL
colnames(motionPath[[5]]) = NULL

timeStep6 = matrix(0, nrow = 1, ncol = 6)
timeStep6[1, 6] = 1
motionPath[[6]] = timeStep6
motionPath[[6]] = as.data.frame(motionPath[[6]])
names(motionPath[[6]]) = NULL
rownames(motionPath[[6]]) = NULL
row.names(motionPath[[6]]) = NULL
colnames(motionPath[[6]]) = NULL


#################
################# 
## JUMP HEIGHT ##
#################
#################

## HEIGHTS: ##
## NO JUMP
## 1 x 2  LIU & SPELKE (2017) TEST (trajectoryList1)
## 2 X 2 PRETRAINING
## 4 X 2 GERGELY ET AL. (1995); LIU & SPELKE (2017) HABITUATION
## 5 x 2 LIU & SPELKE (2017) HABITUATION
## 6 X 2 LIU & SPELKE (2017) HABITUATION

jump_height = data.frame(x = c('1 0 0 0 0', 
                               '0 1 0 0 0',
                               '0 0 1 0 0',
                               '0 0 0 1 0',
                               '0 0 0 0 1'))
names(jump_height) = NULL

# NO JUMP:   1 0 0 0 0
# ONE JUMP:  0 1 0 0 0
# TWO JUMP:  0 0 1 0 0
# FOUR JUMP: 0 0 0 1 0
# SIX JUMP:  0 0 0 0 1

#################
## PRETRAINING ##
#################
# setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/FFNN/model/simulation1")
# setwd("C:/Users/detbe/Documents/projects/NEWgergliuSims/FFNN/equalLinearCurvedRatio/model/simulation1")
# setwd("C:/Users/Deon T. Benton/Documents/projects/NEWgergliuSims/cognition/equalLinearCurvedRatioSRN/model/simulation3")
# setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/cognition/equalLinearCurvedRatioSRN/model/simulation3")
setwd("C:/Users/bentod2/Documents/projects/current/NEWgergliuSims/cognition/equalLinearCurvedRatioSRN/model/simulation3")

n = nrow(objects_left_straight)
n1 = nrow(objects_left_curved)
l = 1
l1 = 1
l2 = 1
l3 = 1
l4 = 1
l5 = 1

sink('pretrain.ex')

# objects straight
for(i in 1:n){
  
  cat(paste("name: objectStraightTrajectory", l, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  cat(paste("proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(objects_left_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(objects_right_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_IN)", sep="\t"))
    print(trajectory[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(barrier[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_IN)", sep="\t"))
    print(barrier_position[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_IN)", sep="\t"))
    print(jump_height[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_IN)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_IN)", sep="\t"))
    print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(objects_left_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Person 2
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(objects_right_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_OUT)", sep="\t"))
    print(trajectory[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(barrier[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_OUT)", sep="\t"))
    print(barrier_position[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_OUT)", sep="\t"))
    print(jump_height[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_OUT)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_OUT)", sep="\t"))
    print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l = l+1
}


# objects straight
for(i in 1:n){
  
  cat(paste("name: animateStraightTrajectory", l1, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  cat(paste("proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(animate_left_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(animate_right_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_IN)", sep="\t"))
    print(trajectory[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(barrier[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_IN)", sep="\t"))
    print(barrier_position[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_IN)", sep="\t"))
    print(jump_height[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_IN)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_IN)", sep="\t"))
    print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(animate_left_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Person 2
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(animate_right_straight[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_OUT)", sep="\t"))
    print(trajectory[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(barrier[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_OUT)", sep="\t"))
    print(barrier_position[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_OUT)", sep="\t"))
    print(jump_height[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_OUT)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_OUT)", sep="\t"))
    print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}




# objects curved
for(i in 1:n){
  
  cat(paste("name: objectCurvedTrajectory", l2, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  cat(paste("proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(objects_left_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(objects_right_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_IN)", sep="\t"))
    print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_IN)", sep="\t"))
    print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_IN)", sep="\t"))
    print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_IN)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_IN)", sep="\t"))
    print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(objects_left_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Person 2
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(objects_right_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
    print(animacy[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_OUT)", sep="\t"))
    print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_OUT)", sep="\t"))
    print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_OUT)", sep="\t"))
    print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_OUT)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_OUT)", sep="\t"))
    print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}




# animate curved
for(i in 1:n){
  
  cat(paste("name: animateCurvedTrajectory", l3, "\n", sep=""))
  cat(paste("5", "\n", sep="\t"))
  cat(paste("proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }", "\n", sep="\t"))
  for(k in 1:5){
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(animates_left_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Feature B
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(animates_right_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_IN)", sep="\t"))
    print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_IN)", sep="\t"))
    print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_IN)", sep="\t"))
    print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_IN)", sep="\t"))
    print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_IN)", sep="\t"))
    print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_IN)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_IN)", sep="\t"))
    print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # Feature A
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(animates_left_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Feature B
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(animates_right_curved[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Animate status
    cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
    print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_OUT)", sep="\t"))
    print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Motion 
    cat(paste("(Motion_Type_OUT)", sep="\t"))
    print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # Grid 
    cat(paste("(Grid_OUT)", sep="\t"))
    print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # barrier position
    cat(paste("(Grid_Position_OUT)", sep="\t"))
    print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # jump height
    cat(paste("(Jump_Height_OUT)", sep="\t"))
    print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # goal
    cat(paste("(Goal_OUT)", sep="\t"))
    print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # clearance
    cat(paste("(Clearance_OUT)", sep="\t"))
    print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  }
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l3 = l3+1
  
}
sink()


##########################
## HABITUATION AND TEST ##
##########################
sink('sim4Hab.ex')
cat(paste("name: habituation", "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
cat(paste("proc: {
           setLinkValues learningRate 0.475 -type jumpSalience
          setLinkValues weightDecay 0 -type jumpSalience
          setLinkValues learningRate 0.475 -type barrierSalience
          setLinkValues weightDecay 0 -type barrierSalience
          }", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_IN)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(barrier[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_IN)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_IN)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_IN)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_IN)", sep="\t"))
  print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_OUT)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(barrier[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_OUT)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_OUT)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_OUT)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_OUT)", sep="\t"))
  print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
}
cat(paste(";", sep="\t"))
cat("\n")
sink()



sink('sim4Test.ex')
cat(paste("name: inconsistent", "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_IN)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_IN)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_IN)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_IN)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_IN)", sep="\t"))
  print(clearance[3,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_OUT)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_OUT)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_OUT)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_OUT)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # clearance
  cat(paste("(Clearance_OUT)", sep="\t"))
  print(clearance[3,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
}

cat(paste(";", sep="\t"))
cat("\n")



cat(paste("name: consistent", "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_IN)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_IN)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_IN)", sep="\t"))
  print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_IN)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_IN)", sep="\t"))
  print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_OUT)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_OUT)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_OUT)", sep="\t"))
  print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_OUT)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # clearance
  cat(paste("(Clearance_OUT)", sep="\t"))
  print(clearance[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
}

cat(paste(";", sep="\t"))
cat("\n")
sink()





sink('sim4CntrlHab.ex')
cat(paste("name: habituation", "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
cat(paste("proc: {
           setLinkValues learningRate 0.475 -type jumpSalience
          setLinkValues weightDecay 0 -type jumpSalience
          setLinkValues learningRate 0.0001 -type barrierSalience
          setLinkValues weightDecay 0.01 -type barrierSalience
          }", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_IN)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(barrier[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_IN)", sep="\t"))
  print(barrier_position[3,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_IN)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_IN)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_IN)", sep="\t"))
  print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_OUT)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(barrier[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_OUT)", sep="\t"))
  print(barrier_position[3,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_OUT)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_OUT)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # clearance
  cat(paste("(Clearance_OUT)", sep="\t"))
  print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
}
cat(paste(";", sep="\t"))
cat("\n")

sink()



sink('sim4CntrlTest.ex')
cat(paste("name: inconsistent", "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_IN)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_IN)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_IN)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_IN)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_IN)", sep="\t"))
  print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_OUT)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_OUT)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_OUT)", sep="\t"))
  print(jump_height[5,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_OUT)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_OUT)", sep="\t"))
  print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
}

cat(paste(";", sep="\t"))
cat("\n")



cat(paste("name: consistent", "\n", sep=""))
cat(paste("5", "\n", sep="\t"))
for(k in 1:5){
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_IN)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_IN)", sep="\t"))
  print(motionPath[[k]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_IN)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_IN)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_IN)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_IN)", sep="\t"))
  print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_IN)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_IN)", sep="\t"))
  print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # Feature A
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(objects_left_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Left_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Feature B
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(objects_right_hab_test[1,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Animate status
  cat(paste("(Object_Right_Animate_Status_OUT)", sep="\t"))
  print(animacy[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_OUT)", sep="\t"))
  print(motionPath[[k+1]], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Motion 
  cat(paste("(Motion_Type_OUT)", sep="\t"))
  print(trajectory[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # Grid 
  cat(paste("(Grid_OUT)", sep="\t"))
  print(barrier[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # barrier position
  cat(paste("(Grid_Position_OUT)", sep="\t"))
  print(barrier_position[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # jump height
  cat(paste("(Jump_Height_OUT)", sep="\t"))
  print(jump_height[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # goal
  cat(paste("(Goal_OUT)", sep="\t"))
  print(goal[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # clearance
  cat(paste("(Clearance_OUT)", sep="\t"))
  print(clearance[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
}
cat(paste(";", sep="\t"))
cat("\n")

sink()