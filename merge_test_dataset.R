# LOAD FILES INTO R

library(here)
library(dplyr)
library(data.table)
working_wd <- getwd() # GÁN GIÁ TRỊ THƯ MỤC LÀM VIỆC

# LOAD TEST DATASET

subject_test_file <- here(working_wd, "dataset", "test", "subject_test.txt")
subject_test <- read.table(subject_test_file)
subject_test <- subject_test %>% rename(subject_code = V1)
# View(subject_test)
# names(subject_test)

y_test_file <- here(working_wd, "dataset", "test", "y_test.txt")
y_test <- read.table(y_test_file)
y_test <- y_test %>% rename(activity = V1)
# View(y_test)
# names(y_test)

full_test_subject_y <- cbind(subject_test, y_test)
# dim(full_test_subject_y)
# View(full_test_subject_y)

X_test_file <- here(working_wd, "dataset", "test", "X_test.txt")
X_test <- read.table(X_test_file)
# dim(X_test)
# View(X_test)
# names(X_test)

features_names_file <- here(working_wd, "dataset", "features.txt")
features_names <- read.table(features_names_file)

# t_names_1 <- features_names$V2  
# t_names_2 <- names(X_test)
# t_names_3 <- paste(t_names_1, t_names_2) 
colnames(X_test) <- features_names$V2 

full_test <- cbind(full_test_subject_y, X_test)
# View(full_test)
# names(full_test)

## LOAD SUB IN TEST

### body_acc
body_acc_x_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "body_acc_x_test.txt")
body_acc_x_test <- read.table(body_acc_x_test_file)
body_acc_x_test_names <- names(body_acc_x_test) 
t_changed_1 <- paste("body_acc_x", body_acc_x_test_names)
colnames(body_acc_x_test) <- t_changed_1
# names(body_acc_x_test)

body_acc_y_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "body_acc_y_test.txt")
body_acc_y_test <- read.table(body_acc_y_test_file)
body_acc_y_test_names <- names(body_acc_y_test) 
t_changed_2 <- paste("body_acc_y", body_acc_y_test_names)
colnames(body_acc_y_test) <- t_changed_2
# names(body_acc_y_test)

body_acc_z_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "body_acc_z_test.txt")
body_acc_z_test <- read.table(body_acc_z_test_file)
body_acc_z_test_names <- names(body_acc_z_test) 
t_changed_3 <- paste("body_acc_z", body_acc_z_test_names)
colnames(body_acc_z_test) <- t_changed_3
# names(body_acc_z_test)

### body_gyro
body_gyro_x_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "body_gyro_x_test.txt")
body_gyro_x_test <- read.table(body_gyro_x_test_file)
body_gyro_x_test_names <- names(body_gyro_x_test) 
t_changed_4 <- paste("body_gyro_x", body_gyro_x_test_names)
colnames(body_gyro_x_test) <- t_changed_4
# names(body_gyro_x_test)

body_gyro_y_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "body_gyro_y_test.txt")
body_gyro_y_test <- read.table(body_gyro_y_test_file)
body_gyro_y_test_names <- names(body_gyro_y_test) 
t_changed_5 <- paste("body_gyro_y", body_gyro_y_test_names)
colnames(body_gyro_y_test) <- t_changed_5
# names(body_gyro_y_test)

body_gyro_z_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "body_gyro_z_test.txt")
body_gyro_z_test <- read.table(body_gyro_z_test_file)
body_gyro_z_test_names <- names(body_gyro_z_test) 
t_changed_6 <- paste("body_gyro_z", body_gyro_z_test_names)
colnames(body_gyro_z_test) <- t_changed_6
# names(body_gyro_z_test)

### total_acc
total_acc_x_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "total_acc_x_test.txt")
total_acc_x_test <- read.table(total_acc_x_test_file)
total_acc_x_test_names <- names(total_acc_x_test) 
t_changed_7 <- paste("total_acc_x", total_acc_x_test_names)
colnames(total_acc_x_test) <- t_changed_7
# names(total_acc_x_test)

total_acc_y_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "total_acc_y_test.txt")
total_acc_y_test <- read.table(total_acc_y_test_file)
total_acc_y_test_names <- names(total_acc_y_test) 
t_changed_8 <- paste("total_acc_y", total_acc_y_test_names)
colnames(total_acc_y_test) <- t_changed_8
# names(total_acc_y_test)

total_acc_z_test_file <- here(working_wd, "dataset", "test", "Inertial Signals", "total_acc_z_test.txt")
total_acc_z_test <- read.table(total_acc_z_test_file)
total_acc_z_test_names <- names(total_acc_z_test) 
t_changed_9 <- paste("total_acc_z", total_acc_z_test_names)
colnames(total_acc_z_test) <- t_changed_9
# names(total_acc_z_test)

########### COMBINE

full_data_test <- cbind(full_test, 
                       body_acc_x_test, body_acc_y_test, body_acc_z_test,
                       body_gyro_x_test, body_gyro_y_test, body_gyro_z_test,
                       total_acc_x_test, total_acc_y_test, total_acc_z_test)

# dim(full_data_test)
# View(full_data_test)