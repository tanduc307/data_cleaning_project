# THE IDEA OF THIS PROJECT

## Background

One of the most exciting areas in all of data science right now is wearable computing. 

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

## Describe about the research and its parameters

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The experiments have been video-recorded to label the data manually.

There are 561 features were observed and 3 inertial signals were collected using sensor signals (accelerometer and gyroscope).

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values.
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
- Features are normalized and bounded within [-1,1].

## Data cleaning step

From the given dataset which had been partitioned into train (70%) and test (30%) subset, I created two scripts that for merging every files in each set into a complete one, before to bind two completed train-dataset with test-dataset into full dataset (called full_data_clean object).

Step 1/ Merges the training and the test sets to create one data set.
'merge_train_dataset.R' is used for create a complete train-dataset from files in train folder.
'merge_test_dataset.R' is used for create a complete test-dataset from files in test folder.

The 'run_analysis.R' is used for creating a full dataset that satisfy the questions from 2 to 5.

Step 2/ Extracts only the measurements on the mean and standard deviation for each measurement. 

Using 'select' function with argument 'matches' for 'mean' or 'std' strings in the column names that helps extract a new dataset with mean and standard deviation measurements (that called 'dataset_mean_std' object). I kept the two important columns as is 'subject_code' and 'activity' along with these measurements.

Step 3/ Uses descriptive activity names to name the activities in the data set

To replace the coding number (1 to 6) in activity variable by text strings ('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'), I used the 'mutate' function that applied the activity variable as factor before changing to its label.

Step 4/ Appropriately labels the data set with descriptive variable names. 

At this step, I only process the variable names for the 'mean()' to 'mean', the same applied to 'std' strings to get rid of '()' in the heading lable. The 'gsub' function can do its job well.

Step 5/ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The idea to simplify from big dataset into a nice, tydier dataset is much necessary. Therefore, I used 'group_by' function that keep grouping 'subject_code' and 'activity' columns and make averages for the rest parameters then exporting an independent csv file for later analysis.





