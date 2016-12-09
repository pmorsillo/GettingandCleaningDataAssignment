# GettingandCleaningDataAssignment
Final assignment for Getting and Cleaning Data course

The purpose of this project is to demonstrate the lessons in the course, Getting and Cleaning Data.  From a set of data, a tidy data set is produced, for some later analysis.

The data for the project is taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

When unzipped, this file creates a directory, UCI HAR Dataset.  Within UCI HAR Dataset/ are the following:

	test/ - this subdirectory contains data files for test phase
	train/ - this subdirectory contains data files for the training phase
	* activity_labels.txt - contains the labels for the 6 activities of the training and testing: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
	* features.txt - this file contains the names of the data columns
	features_info.txt - this file describes how the data in the database was obtained
	README.txt - describes the experiment and the files

Within test/:

	*subject_test.txt - contains the subjects (individuals) used in the test phase of the experiment
	*X_test.txt - contains the calculations from the experiment
	*y_test.txt - contains the activity being performed (walking, sitting, etc.)
	Inertial Signals/ - this subdirectory is not used for this project
  
Within train/:

	*subject_train.txt - contains the subjects (individuals) used in the training phase of the experiment
	*X_train.txt - contains the calculations from the training phase of the experiment
	*y_train.txt - contains the activity being performed (walking, sitting, etc.) during the training phase
	Inertial Signals/ - this subdirectory is not used for this project

Note: * files are files used specifically for this project

The script for this project is in the file run_analysis.R.

The code book, which contains details on the script code is in the file CodeBook.md.

The layout of the project script is as follows:

All of the data is read in and stored.  Then, 2 tables are built: one for the test phase and one for the training phase.  The tables are built by first adding the data column headers to the data, binding the subject and activity to the data, and adding headers for these 2 columns.  Then the 2 tables, test and train, are combined.  

Next, only data corresponding to the mean and standard deviation are kept.  This is done by looking for column names containing mean() or std().

Column names are made more readable, and activity labels are used to replace numbers, again making the data set more readable.
Finally, a tidy data set is created, calculating the average of each variable for each activity and each subject.  

The resulting tidy data set is written to a file.
