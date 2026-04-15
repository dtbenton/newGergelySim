#########################################
##                                     ##
## SCRIPT TO DETERMINE BEST SIMULATION ##
##                                     ##
#########################################

################
# EXPERIMENT 1 #
################

# folder_path = "C:/Users/Deon T. Benton/Documents/projects/gergeley-liuSims/data/liuEtAl2019/noncausal"
folder_path = "C:/Users/detbe/Documents/projects/NEWgergliuSims/data/gergEtAl1995/exp1"

files = list.files(path = folder_path, pattern = ".txt", full.names = TRUE)

# Initialize an empty dataframe to store the results
results_df1 <- data.frame(FileName = character(),
                          PValue = numeric(),
                          MeanInconsistent = numeric(),
                          MeanConsistent = numeric(),
                          Condition = character(),
                          stringsAsFactors = FALSE)

for (file in files) {
  options(scipen=999)
  file_name = basename(file)
  
  data = read.table(file, header = FALSE, stringsAsFactors = FALSE)
  
  data$ID = rep(1:20, each = 2)
  data$test_event = rep(c("Inconsistent", "Consistent"), each = 1, times = 20)
  data$test_event = as.factor(data$test_event)
  data$condition = rep("Experimental", times = 40)
  
  data$looking_time = data$V3
  
  data = data[,-c(1:3)]
  
  test = t.test(data$looking_time[data$test_event=="Inconsistent"],
                data$looking_time[data$test_event=="Consistent"], 
                paired = TRUE)
  
  # Calculate the p-value and mean values
  p_value = test$p.value
  mean_inconsistent = mean(data$looking_time[data$test_event=="Inconsistent"])
  mean_consistent = mean(data$looking_time[data$test_event=="Consistent"])
  
  # Extract condition (assumed to be the same for all rows in `data`)
  condition = unique(data$condition)
  
  
  # Append results to the dataframe
  results_df1 <- rbind(results_df1, data.frame(FileName = file_name, 
                                               PValue = p_value,
                                               MeanInconsistent = mean_inconsistent,
                                               MeanConsistent = mean_consistent,
                                               Condition = condition))
}

# Sort the dataframe by PValue in ascending order
results_df1 <- results_df1[order(results_df1$FileName), ]

t.test(results_df1$MeanConsistent,
       results_df1$MeanInconsistent, 
       paired = TRUE)

mean(results_df1$MeanConsistent)
mean(results_df1$MeanInconsistent)


################
# EXPERIMENT 2 #
################

# folder_path = "C:/Users/Deon T. Benton/Documents/projects/gergeley-liuSims/data/liuEtAl2019/causal"
folder_path = "C:/Users/detbe/Documents/projects/NEWgergliuSims/data/gergEtAl1995/exp2"

files = list.files(path = folder_path, pattern = ".txt", full.names = TRUE)

# Initialize an empty dataframe to store the results
results_df2 <- data.frame(FileName = character(),
                          PValue = numeric(),
                          MeanInconsistent = numeric(),
                          MeanConsistent = numeric(),
                          Condition = character(),
                          stringsAsFactors = FALSE)

for (file in files) {
  options(scipen=999)
  file_name = basename(file)
  
  data = read.table(file, header = FALSE, stringsAsFactors = FALSE)
  
  data$ID = rep(1:20, each = 2)
  data$test_event = rep(c("Inconsistent", "Consistent"), each = 1, times = 20)
  data$test_event = as.factor(data$test_event)
  data$condition = rep("Experiment 2", times = 40)
  
  data$looking_time = data$V3
  
  data = data[,-c(1:3)]
  
  test = t.test(data$looking_time[data$test_event=="Inconsistent"],
                data$looking_time[data$test_event=="Consistent"], 
                paired = TRUE)
  
  # Calculate the p-value and mean values
  p_value = test$p.value
  mean_inconsistent = mean(data$looking_time[data$test_event=="Inconsistent"])
  mean_consistent = mean(data$looking_time[data$test_event=="Consistent"])
  
  # Extract condition (assumed to be the same for all rows in `data`)
  condition = unique(data$condition)
  
  
  # Append results to the dataframe
  results_df2 <- rbind(results_df2, data.frame(FileName = file_name, 
                                               PValue = p_value,
                                               MeanInconsistent = mean_inconsistent,
                                               MeanConsistent = mean_consistent,
                                               Condition = condition))
}

# Sort the dataframe by PValue in ascending order
results_df2 <- results_df2[order(results_df2$FileName), ]

t.test(results_df2$MeanConsistent,
       results_df2$MeanInconsistent, 
       paired = TRUE)

mean(results_df2$MeanConsistent)
mean(results_df2$MeanInconsistent)

combine_df = rbind(results_df1, results_df2)
write.csv(combine_df, "C:\\Users\\bentod2\\Documents\\projects\\current\\NEWgergliuSims\\gerg95.csv", row.names = FALSE)
