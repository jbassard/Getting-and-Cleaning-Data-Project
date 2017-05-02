# Getting-and-Cleaning-Data-Project

This is the course assignment for the "Getting and Cleaning Data" Coursera course.

## Data description

The data was obtained from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone fixed to the waist of 30 subjects.

## Provided Files in this repo

* run_analysis.R contains all the code to perform the analyses (described quickly below). The code was written and tested with R version 3.3.3 on Windows environment.

* CodeBook.md describes the variables, the data, and any transformations performed to clean up the data.

* TidyDataSet.txt, textfile result from running "run_analysis.R" script.

## Code explaination

The R script "run_analysis.R" does the following:
 * Downloads the dataset and unzips it (only if files do not exist in the working directory)
 * Loads the different datasets and information
 * Combines trainings and tests datasets in one metadataset.
 * Retrieves only columns containing mean or standard deviation data.
 * Names the activities in the dataset using descriptive activity names
 * relabels the dataset with descriptive variable names
 * Creates a tidy dataset "TidyDataSet.txt" in "Data" folder. "TidyDataSet.txt" consists of the average (mean) value of each variable for each subject and activity pair.
