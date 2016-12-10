## Getting and Cleaning Data Course Project
## The following script will read in test and training data representing data collected from 
## the accelerometers from the Samsung Galaxy S smartphone.  The data is then combined, specific data of 
## interest is extracted, and the data is cleaned to provide the average of each variable for each activity
## and each subject

library(dplyr)

## Set up a data directory, if one does not already exist
if (!file.exists("./data")) {
          dir.create("./data")
}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/projectdata.zip")
## unzip the file, creating the directory UCI HAR Dataset, with test and train subdirectories
unzip(zipfile="./data/projectdata.zip", exdir="./data")

## create a variable, fpath, to hold the prefix of the file names
fpath<-file.path("./data", "UCI HAR Dataset")

## read in the labels for the data (labels) and the activities (activityLabels) to be used in project
labels<-read.table(file.path(fpath, "features.txt"), header=FALSE)
activityLabels<-read.table(file.path(fpath, "activity_labels.txt"), header=FALSE)

## read in test data
testData<-read.table(file.path(fpath, "test", "X_test.txt"), header=FALSE)
testLabel<-read.table(file.path(fpath, "test","y_test.txt"), header=FALSE)
testSubject<-read.table(file.path(fpath, "test", "subject_test.txt"), header=FALSE)

## set up the complete test data
## Attach the column names to the test data, using "labels" table
colnames(testData)<-labels[,2]
## bind the subject column, activity column and the test data together, in order
newTestData<-cbind(testSubject, testLabel, testData)
## add column names to the first 2 columns: Subject and Activity
colnames(newTestData)[1]<-"Subject"
colnames(newTestData)[2]<-"Activity"

## read in the training data
trainData<-read.table(file.path(fpath, "train", "X_train.txt"), header=FALSE)
trainLabel<-read.table(file.path(fpath, "train", "y_train.txt"), header=FALSE)
trainSubject<-read.table(file.path(fpath, "train", "subject_train.txt"), header=FALSE)

## set up the complete training data
## Attach the column names to the training data, using "labels" table
colnames(trainData)<-labels[,2]
## bind the subject column, activity column and the test data together, in order
newTrainData<-cbind(trainSubject, trainLabel, trainData)
## add column names to the first 2 columns: Subject and Activity
colnames(newTrainData)[1]<-"Subject"
colnames(newTrainData)[2]<-"Activity"

## Part 1: Merge the training and test sets to create one data set

combinedData<-rbind(newTrainData, newTestData)

## Part 2: Extract only the measurements on the mean and standard deviation for each measurement
##         Keep the first 2 columns: Subject and Activity, with mean and starndard deviation data following
##         Mean and STD measurements are found by searching for "mean()" or "std()" in column names

selectData<-combinedData[,c(1,2,grep("-std\\(\\)|-mean\\(\\)", names(combinedData), ignore.case=TRUE))] 

## Part 3: Use descriptive activity names to name the activities in the data set
##         The descriptive names were read in to activityLabels: Walking, Walking_Upstairs, Walking_Downstairs,
##         Sitting, Standing, Laying
##         First, Subset the Activity column, then use the text descriptions from activityLabels for the levels

selectData$Activity<-factor(selectData$Activity)
levels(selectData$Activity)<-activityLabels$V2

## Part 4: Appropriately label the data set with descriptive names
##         To make the Variable names (column names) more readable, make the following substitutions:
##                  t=time
##                  f=frequency
##                  Mag=Magnitude
##                  Acc=Acceleration
##                  Gyro=Gyroscope
##                  BodyBody=Body

colnames(selectData)<-sub("^t", "time", colnames(selectData))
colnames(selectData)<-sub("^f", "frequency", colnames(selectData))
colnames(selectData)<-sub("Mag", "Magnitude", colnames(selectData))
colnames(selectData)<-sub("Acc", "Acceleration", colnames(selectData))
colnames(selectData)<-sub("Gyro", "Gyroscope", colnames(selectData))
colnames(selectData)<-sub("BodyBody", "Body", colnames(selectData))

## Part 5: Using the (selectData) data set from part 4, create a second, independent tidy data set
##         with the average of each variable for each activity and each subject

tidyData<-selectData %>%
          group_by(Subject, Activity) %>%
          summarize_each(funs(mean), -Subject, -Activity)

## write the tidyData to a file
write.table(tidyData, file="./data/tidydata.txt", row.names=FALSE)



