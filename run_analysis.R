# STEP 1: Merges the training and the test sets to create one data set.

source("merge_train_dataset.R")
source("merge_test_dataset.R")

library(dplyr)
library(data.table)

full_data_clean <- rbind(full_data_train, full_data_test)
# dim(full_data_clean)
names_full <- names(full_data_clean)

full_data_clean <- full_data_clean %>% arrange(subject_code) 

any(is.na(full_data_clean)) # CHECK NAs

# View(full_data_clean)

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

dataset_mean_std <- full_data_clean %>% select(subject_code, activity, matches('mean|std'))
# dim(dataset_mean_std)
# names(dataset_mean_std)
# View(dataset_mean_std)

# STEP 3: Uses descriptive activity names to name the activities in the data set

activity_types <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

dataset_mean_std_activity <- dataset_mean_std %>% 
                             mutate(activity = as.character(factor(activity, levels = 1:6, labels = activity_types))) 

# STEP 4: Appropriately labels the data set with descriptive variable names.

change_name <- names(dataset_mean_std_activity)

change_name_1 <- gsub("mean[(][)]", "mean", change_name)
change_name_2 <- gsub("std[(][)]", "std", change_name_1)
change_name_3 <- gsub("meanFreq[(][)]", "meanFreq", change_name_2)

colnames(dataset_mean_std_activity) <- change_name_3

# STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of **each variable** for **each activity** and **each subject**. 

tidy_data_set <- dataset_mean_std_activity %>% group_by(subject_code, activity) %>% summarise_all(mean)
#write.csv(tidy_data_set, "tidy_data_set.csv")


