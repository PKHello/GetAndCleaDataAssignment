## Geting and Cleaning Data - Week 4 Assignment
## 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##

library(reshape2)
library(utils)

## Read activity lables 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Read features 
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = c("integer","character"))
# Extract names of features. This will be used as columns titles
featureNames <- features[,2]

## Read TEST related data
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Add Activity Names to yTest
yTest[,2] <-  activityLabels[yTest[,1],2]

## Give column names
colnames(xTest) <- featureNames
colnames(yTest) <- c("Activity_Id", "Activity_Name")
colnames(subjectTest) <- "Subject"

# Cobine Subject, Activity Name, with Test Data
testData <- cbind(subjectTest, yTest["Activity_Name"], xTest)

## Read Training related Data
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Add Activity Names to yTrain
yTrain[,2] <-  activityLabels[yTrain[,1],2]
  
## Give column names
colnames(xTrain) <- featureNames
colnames(yTrain) <- c("Activity_Id", "Activity_Name")
colnames(subjectTrain) <- "Subject"

# Cobine Subject, Activity Name, with Train Data
trainData <- cbind(subjectTrain, yTrain["Activity_Name"], xTrain)

## Combine Test and TRain data
allData <- rbind(testData, trainData)

## Find columns with Means and Standard deviation
## Then extract first two columns (Subject, Activity Name) and columns with Means and Standard Deviation
reqCols <- grep("[Mm]ean|[Ss]td", colnames(allData))
extractData <- allData[,c(1:2,reqCols)]

## Descriptive variable names for lables
names(extractData) <- gsub("Freq","Frequency",names(extractData))
names(extractData) <- gsub("Mag","Magnitude",names(extractData))
names(extractData) <- gsub("^t","TimeDomain-",names(extractData))
names(extractData) <- gsub("^f","FrequencyDomain-",names(extractData))
names(extractData) <- gsub("BodyBody","Body",names(extractData))

## Melt data by Ids = Activity and Subject
## Dcast the melted data by Activity + Subject to compute mean for all variables 
meltData <- melt(extractData, id = c(1:2), measure.vars = c(3:88))
tidyData <- dcast(meltData, Activity_Name + Subject ~ variable, mean)

write.table(tidyData, file = "./tidy_data.txt")