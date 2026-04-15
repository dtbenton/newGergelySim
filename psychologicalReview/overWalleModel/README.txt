# baseOverwallModel: the original model of Gergely et al. with all the bells and whistles (e.g., plot for seeing the model settle); this model was reported in Overwalle (2010)


# overwalleModelOriginal: this is the model reported in Overwalle (2010); identical to above sans the bells and whistles.

# overalleModelModified: this is the version of the model that more faithfully represents the experimental setup of the control condition; all other aspects of this model are identical to "overwalleModelOriginal"
	#--> Things that changed in the code itself:
		#--> "straight_critical_cells and jump_critical_cells" truncated given the shorter curved and straight paths
		#--> jumping_path and straight_path truncated
		#--> obstacle_cells_absent changed to obstacle_cells_control
		#--> obstacle cells increased in hgihet
		# critical cells equated for number of horizontal steps
		# NOTE: To ensure that the right obstacle is both not blocking and also remote, it is made more irrelevant and not a part of the orthogonality computation
			# experimental condition: obstacle at R1C3, which lies on the straight route and supports the jump
			# control condition: obstacle at R2C4, which is near the action and locally represented, but does not explain the jump


# overwalleModelOriginal_csibraInferringConstraints:this version models Experiment 1 in Csibra et al. (2003); the "base" model, rather than the modified one (that more faithfully models Gergely et al. (1995) is used here given that it is the true comparison to my model and is the one proposed by Overwalle.
# overwalleModelOriginal_csibraInferringConstraints: this version models Experiment 2 in Csibra et al. (2003); the "base" model, rather than the modified one (that more faithfully models Gergely et al. (1995) is used here given that it is the true comparison to my model and is the one proposed by Overwalle.


# NOTE: Impossible model developmental findings given that there is no notion of pretraining in the Overwalle model, so can't model Liu and Spelke or Skerry, Carey, & Spelke; these will be NAs in the model comparison table