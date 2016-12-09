#Getting and Cleaning Data Course Project

## Patti Morsillo
## December 9, 2016


The original data for this assignment is found on the course website:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This zipped file contains the following files:

  **activity_labels.txt** - contains the activities measured in the dataset (walking, walking upstairs, walking downstairs, sitting standing, laying down)
  
  
  **features.txt** - contains the column names measurements in the dataset
  
  **test/subject_test.txt** - the subjects (individuals) tested
  
  **test/x_test.txt** - the measured data
  
  **test/y_test.txt** - the activities being tested (walking, sitting, etc.)
  
  **train/subject_train.txt** - the subjects (individuals) trained
  
  **train/x_test.txt** - the measured data
  
  **train/y_test.txt** - the activities being trianed (walking, sitting, etc.)
  
  
The test data is combined into a data frame, with the subject_test column in the first position, followed by the y_test column, followed by the
561 columns of measured data from the x_test file.
The training data is combined in the same manner into a data frame: subject_train column first, followed by y_train, then the 561 
columns of measured data from the x_train file.
  
After these two data frames are assembled, they are then combined by simply adding the training table to the bottom of the test table.  This
leaves us with a table consisting of 10299 rows of data in 563 columns.  This is part 1 of the assignment
  
The column data begins with the subject, which is coded to represent an individual.  The codes are 1 through 30, representing 6 
individuals who contributed to the data measurements.
The second column contains a code for the activity being measured.  There are 6 activities and the column contains the corresponding 
number 1 through 6.
The remaining columns contain the measured data.
  
In **part 2** of the assignment, we are asked to extract only the measurements on the mean and standard deviation for each measurement.  
To do this, I used the grep command to search for column names that contain "std" or "mean" as a part of the name.  These columns are plucked out 
of the combined data frame along with the subject column and the activity column to create a new, smaller data frame.

After selecting on "std" and "mean", we have the following columns:

**"Subject"                     "Activity"                    "tBodyAcc-mean()-X"          
"tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"       
"tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
"tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"      
"tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
"tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"     
"tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"         
"tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
"tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"        
"tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
"fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
"fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
"fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
"fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
"fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
"fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
"fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
"fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"**

**Part 3** asks us to label the activities with their proper descriptions (found in the activity_labels.txt file).  The following shows the 
conversion of integer to label:

    1   WALKING
    2   WALKING_UPSTAIRS
    3   WALKING_DOWNSTAIRS
    4   SITTING
    5   STANDING
    6   LAYING
    
**Part 4** asks us to appropriately label the data set with descriptive variable names.  Looking through the column names (see above),
the following substitutions became apparent:
To make the Variable names (column names) more readable, make the following substitutions:

               t=time
               f=frequency
               Mag=Magnitude
               Acc=Acceleration
               Gyro=Gyroscope
               BodyBody=Body
               
 Now we have the following column names (in a more readable format):
 
  **"Subject"                                       "Activity"                                     
  "timeBodyAcceleration-mean()-X"                 "timeBodyAcceleration-mean()-Y"                
  "timeBodyAcceleration-mean()-Z"                 "timeBodyAcceleration-std()-X"                 
  "timeBodyAcceleration-std()-Y"                  "timeBodyAcceleration-std()-Z"                 
  "timeGravityAcceleration-mean()-X"              "timeGravityAcceleration-mean()-Y"             
  "timeGravityAcceleration-mean()-Z"              "timeGravityAcceleration-std()-X"              
  "timeGravityAcceleration-std()-Y"               "timeGravityAcceleration-std()-Z"              
  "timeBodyAccelerationJerk-mean()-X"             "timeBodyAccelerationJerk-mean()-Y"            
  "timeBodyAccelerationJerk-mean()-Z"             "timeBodyAccelerationJerk-std()-X"             
  "timeBodyAccelerationJerk-std()-Y"              "timeBodyAccelerationJerk-std()-Z"             
  "timeBodyGyroscope-mean()-X"                    "timeBodyGyroscope-mean()-Y"                   
  "timeBodyGyroscope-mean()-Z"                    "timeBodyGyroscope-std()-X"                    
  "timeBodyGyroscope-std()-Y"                     "timeBodyGyroscope-std()-Z"                    
  "timeBodyGyroscopeJerk-mean()-X"                "timeBodyGyroscopeJerk-mean()-Y"               
  "timeBodyGyroscopeJerk-mean()-Z"                "timeBodyGyroscopeJerk-std()-X"                
  "timeBodyGyroscopeJerk-std()-Y"                 "timeBodyGyroscopeJerk-std()-Z"                
  "timeBodyAccelerationMagnitude-mean()"          "timeBodyAccelerationMagnitude-std()"          
  "timeGravityAccelerationMagnitude-mean()"       "timeGravityAccelerationMagnitude-std()"       
  "timeBodyAccelerationJerkMagnitude-mean()"      "timeBodyAccelerationJerkMagnitude-std()"      
  "timeBodyGyroscopeMagnitude-mean()"             "timeBodyGyroscopeMagnitude-std()"             
  "timeBodyGyroscopeJerkMagnitude-mean()"         "timeBodyGyroscopeJerkMagnitude-std()"         
  "frequencyBodyAcceleration-mean()-X"            "frequencyBodyAcceleration-mean()-Y"           
  "frequencyBodyAcceleration-mean()-Z"            "frequencyBodyAcceleration-std()-X"            
  "frequencyBodyAcceleration-std()-Y"             "frequencyBodyAcceleration-std()-Z"            
  "frequencyBodyAccelerationJerk-mean()-X"        "frequencyBodyAccelerationJerk-mean()-Y"       
  "frequencyBodyAccelerationJerk-mean()-Z"        "frequencyBodyAccelerationJerk-std()-X"        
  "frequencyBodyAccelerationJerk-std()-Y"         "frequencyBodyAccelerationJerk-std()-Z"        
  "frequencyBodyGyroscope-mean()-X"               "frequencyBodyGyroscope-mean()-Y"              
  "frequencyBodyGyroscope-mean()-Z"               "frequencyBodyGyroscope-std()-X"               
  "frequencyBodyGyroscope-std()-Y"                "frequencyBodyGyroscope-std()-Z"               
  "frequencyBodyAccelerationMagnitude-mean()"     "frequencyBodyAccelerationMagnitude-std()"     
  "frequencyBodyAccelerationJerkMagnitude-mean()" "frequencyBodyAccelerationJerkMagnitude-std()" 
  "frequencyBodyGyroscopeMagnitude-mean()"        "frequencyBodyGyroscopeMagnitude-std()"        
  "frequencyBodyGyroscopeJerkMagnitude-mean()"    "frequencyBodyGyroscopeJerkMagnitude-std()"** 
               
 And in **Part 5**, we are asked to create a tidy data set with the average of each variable for each activity and each subject.
 To achieve this, I grouped the data by Subject, then by Activity, and calculated the mean for the each variable. 
