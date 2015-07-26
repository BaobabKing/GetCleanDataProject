library(reshape2)

## Check if data exist. If not, download data.
if (!file.exists("UCI HAR Dataset")) {
    message("downloading data ...")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  "./Dataset.zip", mode='wb')
    message("extracting data ...")
    unzip("Dataset.zip")
}

message("reading files ...")
test  <- read.table("UCI HAR Dataset/test/X_test.txt")
testL <- read.table("UCI HAR Dataset/test/Y_test.txt")
testS <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
train  <- read.table("UCI HAR Dataset/train/X_train.txt")
trainL <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainS <- read.table("UCI HAR Dataset/train/subject_train.txt")
    
features <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

message("performing anaysis ...")

## 1. Merges the training and the test sets to create one data set.
data <- rbind(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#data2 <- data[,grep("mean()|std()", features[,2])]  ## 10299x79 include meanFreq()
data2 <- data[,grep("mean()\\b|std()\\b", features[,2])]  ## 10299x66

## 3. Uses descriptive activity names to name the activities in the data set.
data3 <- cbind(rbind(cbind(trainS, trainL), cbind(testS, testL)), data2)
#for (i in 1:6) {
#    data3[data3[,2]==as.character(i), 2]  <- as.character(activity[i,2])
#}
data3[,2] <- as.factor(data3[,2])
levels(data3[,2]) <- as.character(activity[,2])

## 4. Appropriately labels the data set with descriptive variable names. 
names(data3) <- c("subject", "activity", as.character(features[grepl("mean()\\b|std()\\b", features[,2]), 2]))

## 5. From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.
dataMelt <- melt(data3, id=c("subject", "activity"), measure.vars=names(data3[-(1:2)]))
dataTidy <- dcast(dataMelt, subject + activity ~ variable, mean)  ## wide form

## Write dataTidy to file
message("writing tidy data to file ...")
#write.csv(dataTidy, "dataTidy.csv", row.names=FALSE)
write.table(dataTidy, "dataTidy.txt", row.names=FALSE)
