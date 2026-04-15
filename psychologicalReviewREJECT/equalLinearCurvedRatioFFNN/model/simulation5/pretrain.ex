name: objectStraightTrajectory1
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory2
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory3
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory4
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory5
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory6
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory7
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory8
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory9
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectStraightTrajectory10
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory1
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory2
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory3
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory4
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory5
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory6
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory7
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory8
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory9
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: animateStraightTrajectory10
proc: {
            setLinkValues learningRate 0.1 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.1 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 1 0
(Grid_IN)          
 1 0 0 0 0
(Grid_Position_IN)      
 1 0 0
(Jump_Height_IN)          
 1 0 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 1 0
(Grid_OUT)          
 1 0 0 0 0
(Grid_Position_OUT)      
 1 0 0
(Jump_Height_OUT)          
 1 0 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory1
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory2
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory3
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory4
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory5
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory6
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory7
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory8
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory9
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: objectCurvedTrajectory10
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 0 1
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 0 1
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 0 1
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 0 1
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory1
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory2
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory3
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory4
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory5
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory6
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory7
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory8
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory9
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
name: animateCurvedTrajectory10
proc: {
            setLinkValues learningRate 0.375 -type jumpSalience
            setLinkValues weightDecay 0 -type jumpSalience
            setLinkValues learningRate 0.375 -type barrierSalience
            setLinkValues weightDecay 0 -type barrierSalience
            }	
I:	
(Object_Left_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_IN)    
 1 0
(Object_Right_IN)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
(Object_Right_Animate_Status_IN)    
 1 0
(Motion_IN)    
 0 1
(Grid_IN)          
 0 1 0 0 0
(Grid_Position_IN)      
 0 1 0
(Jump_Height_IN)          
 0 1 0 0 0
(Goal_IN)  
 1
T:	
(Object_Left_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
(Object_Left_Animate_Status_OUT)    
 1 0
(Object_Right_OUT)                                                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                                                  
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
(Object_Right_Animate_Status_OUT)    
 1 0
(Motion_OUT)    
 0 1
(Grid_OUT)          
 0 1 0 0 0
(Grid_Position_OUT)      
 0 1 0
(Jump_Height_OUT)          
 0 1 0 0 0
(Goal_OUT)  
 1
;
