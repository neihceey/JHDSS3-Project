## Getting and Cleaning Data Course Project

## download file from URL and unzip file
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(url1, destfile = "./Project/projdata.zip")
f <- unzip("./Project/projdata.zip")

## reading the 6 files with data
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

## reads the list of features and activites
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

## comines the feature values from the training and test data sets (in the x files)
xAll <- rbind(xTrain, xTest)

## combines the identifiers for the subjects who performed the activities in training and test data sets
subjAll <- rbind(subjTrain, subjTest)

## combines the test labels for the training and test data
yAll <- rbind(yTrain, yTest)

## combines the full dataset with identifies and labels
allData <- cbind(subjAll, yAll, xAll)

## add list in "features" as names of columns of merged data
colnames(allData) <- c("subject", "activityCode", as.character(features[,2]))

## identify column numbers of variables which has "mean" and "Std"
reqvar <- c(1, 2, grep("mean|std", names(allData)))

## forms dataframe consisting of vairables with "mean" and "std"
reqdata1 <- cbind(allData[reqvar])

## rename the columns with descriptive names 
colnames(reqdata1) <- gsub("-", "", colnames(reqdata1))
colnames(reqdata1) <- gsub("\\(\\)","", colnames(reqdata1))

## find mean of each variable for each activity and each subject
reqdata2 <- aggregate(x = reqdata1, by = list(reqdata1$activityCode, reqdata1$subject), FUN = "mean")

## add in activity names
colnames(activities) <- c("activityCode","activity")
reqdata3 <- merge(activities, reqdata2, by="activityCode", all=FALSE)

## outputs the tidydata into csv format
write.csv(reqdata3, file = "tidy.txt", row.names=FALSE)

