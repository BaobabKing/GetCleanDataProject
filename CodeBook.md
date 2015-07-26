# Getting and Cleaning Data Course Project CodeBook

## Data
The data was collected from the accelerometers from the Samsung Galaxy S smartphone:  
[Human Activity Recognition Using Smartphones Data Set Description] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
[getdata-projectfiles-UCI HAR Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A tidy data set was created from this extended data archive. The path folder is `UCI HAR Dataset`.

* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.
* `test/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Variables
* `features <- features.txt`
* `activity <- activity_labels.txt`
* `train    <- train/X_train.txt`
* `trainL   <- train/y_train.txt`
* `trainS   <- train/subject_train.txt`
* `test     <- test/X_test.txt`
* `testL    <- test/y_test.txt`
* `testS    <- test/subject_train.txt`

## Transformations
0) Check if data exist. If not, download data.  
1) Merges the training and the test sets to create one data set.  
   `data`  
2) Extracts only the measurements on the mean and standard deviation for each measurement.  
   `data2`  
3) Uses descriptive activity names to name the activities in the data set.  
   `data3`  
4) Appropriately labels the data set with descriptive variable names.  
   `data3`  
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
   `dataMelt`  
6) Write the tidy data set to file.  
   `dataTidy`



