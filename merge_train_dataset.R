# LOAD FILES INTO R

library(here)
library(dplyr)
library(data.table)
working_wd <- getwd() # GÁN GIÁ TRỊ THƯ MỤC LÀM VIỆC

# LOAD TRAIN DATASET

subject_train_file <- here(working_wd, "dataset", "train", "subject_train.txt")
subject_train <- read.table(subject_train_file)
subject_train <- subject_train %>% rename(subject_code = V1)
# View(subject_train)
# names(subject_train)

y_train_file <- here(working_wd, "dataset", "train", "y_train.txt")
y_train <- read.table(y_train_file)
y_train <- y_train %>% rename(activity = V1)
# View(y_train)
# names(y_train)

full_train_subject_y <- cbind(subject_train, y_train)
# dim(full_train_subject_y)
# View(full_train_subject_y)

X_train_file <- here(working_wd, "dataset", "train", "X_train.txt")
X_train <- read.table(X_train_file)
# dim(X_train)
# View(X_train)
# names(X_train)

features_names_file <- here(working_wd, "dataset", "features.txt")
features_names <- read.table(features_names_file)

# names_1 <- features_names$V2  
# names_2 <- names(X_train)
# names_3 <- paste(names_1, names_2) 
colnames(X_train) <- features_names$V2  

full_train <- cbind(full_train_subject_y, X_train)
# View(full_train)
# names(full_train)

## LOAD SUB IN TRAIN

### body_acc
body_acc_x_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "body_acc_x_train.txt")
body_acc_x_train <- read.table(body_acc_x_train_file)
body_acc_x_train_names <- names(body_acc_x_train) 
changed_1 <- paste("body_acc_x", body_acc_x_train_names)
colnames(body_acc_x_train) <- changed_1
# names(body_acc_x_train)

body_acc_y_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "body_acc_y_train.txt")
body_acc_y_train <- read.table(body_acc_y_train_file)
body_acc_y_train_names <- names(body_acc_y_train) 
changed_2 <- paste("body_acc_y", body_acc_y_train_names)
colnames(body_acc_y_train) <- changed_2
# names(body_acc_y_train)

body_acc_z_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "body_acc_z_train.txt")
body_acc_z_train <- read.table(body_acc_z_train_file)
body_acc_z_train_names <- names(body_acc_z_train) 
changed_3 <- paste("body_acc_z", body_acc_z_train_names)
colnames(body_acc_z_train) <- changed_3
# names(body_acc_z_train)

### body_gyro
body_gyro_x_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "body_gyro_x_train.txt")
body_gyro_x_train <- read.table(body_gyro_x_train_file)
body_gyro_x_train_names <- names(body_gyro_x_train) 
changed_4 <- paste("body_gyro_x", body_gyro_x_train_names)
colnames(body_gyro_x_train) <- changed_4
# names(body_gyro_x_train)

body_gyro_y_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "body_gyro_y_train.txt")
body_gyro_y_train <- read.table(body_gyro_y_train_file)
body_gyro_y_train_names <- names(body_gyro_y_train) 
changed_5 <- paste("body_gyro_y", body_gyro_y_train_names)
colnames(body_gyro_y_train) <- changed_5
# names(body_gyro_y_train)

body_gyro_z_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "body_gyro_z_train.txt")
body_gyro_z_train <- read.table(body_gyro_z_train_file)
body_gyro_z_train_names <- names(body_gyro_z_train) 
changed_6 <- paste("body_gyro_z", body_gyro_z_train_names)
colnames(body_gyro_z_train) <- changed_6
# names(body_gyro_z_train)

### total_acc
total_acc_x_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "total_acc_x_train.txt")
total_acc_x_train <- read.table(total_acc_x_train_file)
total_acc_x_train_names <- names(total_acc_x_train) 
changed_7 <- paste("total_acc_x", total_acc_x_train_names)
colnames(total_acc_x_train) <- changed_7
# names(total_acc_x_train)

total_acc_y_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "total_acc_y_train.txt")
total_acc_y_train <- read.table(total_acc_y_train_file)
total_acc_y_train_names <- names(total_acc_y_train) 
changed_8 <- paste("total_acc_y", total_acc_y_train_names)
colnames(total_acc_y_train) <- changed_8
# names(total_acc_y_train)

total_acc_z_train_file <- here(working_wd, "dataset", "train", "Inertial Signals", "total_acc_z_train.txt")
total_acc_z_train <- read.table(total_acc_z_train_file)
total_acc_z_train_names <- names(total_acc_z_train) 
changed_9 <- paste("total_acc_z", total_acc_z_train_names)
colnames(total_acc_z_train) <- changed_9
# names(total_acc_z_train)

########### COMBINE

full_data_train <- cbind(full_train, 
                       body_acc_x_train, body_acc_y_train, body_acc_z_train,
                       body_gyro_x_train, body_gyro_y_train, body_gyro_z_train,
                       total_acc_x_train, total_acc_y_train, total_acc_z_train)

# dim(full_data_train)
# View(full_data_train)