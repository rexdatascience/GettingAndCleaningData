# Getting And Cleaning Data Course Project

This repository contains the script `run_analysis.R` for performing the analysis required for the course project, the code book `CodeBook.md` that describes the variables in the output data set and the output file containing the tidy data set `tidy_data.txt`.

`run_analysis.R` does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts onlye measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Using the data set from step 4, creates a second, independent tidy data set `tidy_data.txt` with the average of each variable for each activity and each subject.

## Dataset

The dataset used can be downloaded from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the dataset is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Running the script 
1. Download the zipped file from the above link and unzipped the file.
2. The zipped file contains a folder "UCI HAR Dataset". This folder contains two sub-folders "train" and "test".
3. The script `run_analysis.R` has to be placed in the "UCI HAR Dataset"
4. The script can be executed by running `source("run_analysis.R")`. The file 'tidy_data.txt' contains the tidy data set will be created in the folder. 