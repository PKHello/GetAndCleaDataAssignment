# Getting and Cleaning Data - Programming Assignment

## Project Overview
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the *training data* and 30% the *test data*. 

The objective of this project is to demonstrate ability to get and clean the data to create tidy data.

## Project Details
The project requires creation of R script **run_analysis.R**, which performs the following:

* Merge the training and test sets to create one data set
* Extract only the measurements on the mean and standard deviation for each measurement
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive activity names
* Create a second, independent tidy data set with the average of each variable for each activity and each subject

## Steps to execute this project
1. Download dataset [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
2. Unzip the downloaded file. You will get folder **UCI HAR Dataset**
3. Keep **run_analysis.R** file the parent folder of the folder **UCI HAR Dataset**. Set it as working directory
4. Run the R source file **run_analysis.R**. It will create output file **tiny_data.txt** in the working directory

## Installation Dependencies
Install packages *reshape2*, *utils*, and *data.table* before executing this project
