JHDSS3-Project
==============

Repo for Getting and Cleaning Data Course Project
The script assumes the data is in a file called "UCI HAR Dataset" in the current working directory.

The script does the following:
* Merges the training and the test sets, as well as the identifiers for the subjects, using the list in the "features" file as the column names.
* Extracts only columns with names containing "mean" and "std"  
* Computes the mean of each column for each activity and each subject
* Matches the Activity Codes to the Activity names. 
* Outputs a tidy data set (tidy.txt) with the average of each variable for each activity and each subject
