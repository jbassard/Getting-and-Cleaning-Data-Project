# Getting-and-Cleaning-Data-Project

This is the course assignment for the "Getting and Cleaning Data" Coursera course.

## Data description

The data was obtained from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone fixed to the waist of 30 subjects.

## Files

run_analysis.R contains all the code to perform the analyses described quickly below. The code was writted and tested with R version 3.3.3 on windows environment.

CodeBook.md describes the variables, the data, and any transformations performed to clean up the data.

## Code explaination

The R script "run_analysis.R" does the following:
 * Download the dataset and unzip it, if files do not exist in working directory
 * Load the different datasets and information
 * Combine trainings and tests datasets in one metadata.
 * Retrieve only columns containing mean or standard deviation data.
 


Converts the activity and subject columns into factors
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.txt.





