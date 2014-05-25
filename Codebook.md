Codebook for run_analysis.R
========================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, readings for the 3-axial linear acceleration and 3-axial angular velocity were captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The data collected is at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

A full description is available at the following site where the data was obtained
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The training and the test sets, the identifiers for the subjects, and the variable names using the list in the "features" file are merged into one data set. The merged data consists of 10299 records, each with 561 vairables. 

From this data set, 79 variables with names containing "mean" and "std" are extracted. 

The mean of each variable for each of the 6 activities for each subject is computed. The resulting tidy data set is in tidy.txt.