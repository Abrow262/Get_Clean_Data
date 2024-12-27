## Getting and Cleaning Data
## Final Project
## Script: run_analysis.R 

library(tidyr)

# Read in Label Files

activity_label <- read.csv("Data/activity_labels.txt", sep = "", header = FALSE)
features_label <- read.csv("Data/features.txt", sep = "", header = FALSE)

# Read in Training Set

subject_train <- read.csv("Data/train/subject_train.txt", sep = "", header = FALSE)
x_train <- read.csv("Data/train/X_train.txt", sep = "", header = FALSE)
y_train <- read.csv("Data/train/y_train.txt", sep = "", header = FALSE)

# Read in Test Set

subject_test <- read.csv("Data/test/subject_test.txt", sep = "", header = FALSE)
x_test <- read.csv("Data/test/X_test.txt", sep = "", header = FALSE)
y_test <- read.csv("Data/test/y_test.txt", sep = "", header = FALSE)

# Merge Test and Training Sets

df_test <- data.frame(subject_test, y_test, x_test)
df_train <- data.frame(subject_train, y_train, x_train)
df_all <- rbind(df_test, df_train)

# Clean up features_labels names (all lower, use "_" and delete "()" )

features_label <- features_label %>% mutate(V2 = tolower(V2)) %>% 
  mutate(V2 = gsub("\\(\\)", "",V2)) %>% 
  mutate(V2 = gsub("-","_",V2))

# Add Column Names and replace Activity Numbers with Activity Labels

colnames(df_all) <- c("subject", "activity", features_label[,2])
df_all$activity <- as.character(activity_label[match(df_all$activity, activity_label$V1), "V2"])

# Extract only Columns that contain Means and Standard Deviations

df_all_trim <- select(df_all, subject, activity, contains("_mean_"), contains("_std_"))

# Create a column name vector of just factors to be collapsed (to work with across function)

column_calc <- colnames(df_all_trim)
column_calc <- column_calc[! column_calc %in% c("subject", "activity")]

# Calculate Average of Each Variable by Subject and Activity

df_tidy <- df_all_trim %>% group_by(subject, activity) %>% summarize(across(all_of(column_calc),mean))

# Write File

write.table(df_tidy, "./run_analysis_out.txt", sep=" ", row.names = FALSE)
