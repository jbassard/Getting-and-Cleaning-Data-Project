##Check if files exist in the folder "data" in working directory, otherwise create the folder, download and unzip the dataset in that folder
if(!file.exists("./data")) {
	dir.create("./data")}
if(!file.exists("./data/Dataset.zip")) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl, destfile="data/Dataset.zip")}
if(!file.exists(".data/UCI HAR Dataset")) {
	unzip(zipfile="./data/Dataset.zip", exdir="./data")}

##Store file path
path_data <- file.path("./data", "UCI HAR Dataset")

##Then read and store the various files used for the assignement
Xtest <- read.table(file.path(path_data, "test", "X_test.txt"))
Xtrain <- read.table(file.path(path_data, "train", "X_train.txt"))
Ytest  <- read.table(file.path(path_data, "test", "Y_test.txt"))
Ytrain <- read.table(file.path(path_data, "train", "Y_train.txt"))
SubjectTest  <- read.table(file.path(path_data, "test", "subject_test.txt"))
SubjectTrain <- read.table(file.path(path_data, "train", "subject_train.txt"))
variablenames <- read.table(file.path(path_data, "features.txt"))
activityLabels <- read.table(file.path(path_data, "activity_labels.txt"))

#1-Merge the training and the test sets to create one dataset
##First by rows merging
Xmerge <- rbind(Xtrain, Xtest)
Ymerge <- rbind(Ytrain, Ytest)
Subjectmerge <- rbind(SubjectTrain, SubjectTest)

##Create names for variables
names(Subjectmerge) <- c("Subject")
names(Ymerge) <- c("Activity")
names(Xmerge)<- variablenames$V2

##Final merging (by column)
thedataset <- cbind(Xmerge, Subjectmerge, Ymerge)

#2-Extract only the mean and standard deviation for each measurement
##Store column names
colNames <- colnames(thedataset)

##Extract means, SDs from "thedataset", keeping "Activity" and "Subject" columns
selection <- (grepl("Activity" , colNames) | grepl("Subject" , colNames) | grepl("mean.." , colNames) |  grepl("std.." , colNames))
meanSD <- thedataset[ , selection == TRUE]

#3-Use descriptive activity names to name the activities in the dataset
##Name columns in "activityLabels", with one column name matching to the data table to merge with
colnames(activityLabels) <- c("Activity","ActivityName")

##Merge "activityLabels" with "meanSD" using the common name ("Activity")
almosttidyset <- merge(meanSD, activityLabels, by= "Activity", all.x=TRUE)

#4-Appropriately label the dataset with descriptive variable names.
names(almosttidyset) <- gsub("^t", "Time", names(almosttidyset))
names(almosttidyset) <- gsub("Freq", "Frequency", names(almosttidyset))
names(almosttidyset) <- gsub("^f", "Frequency", names(almosttidyset))
names(almosttidyset) <- gsub("Acc", "Accelerometer", names(almosttidyset))
names(almosttidyset) <- gsub("Gyro", "Gyroscope", names(almosttidyset))
names(almosttidyset) <- gsub("Mag", "Magnitude", names(almosttidyset))
names(almosttidyset) <- gsub("BodyBody", "Body", names(almosttidyset))

#5-From the data set in step 4, create a second independent tidy data set, with the average of each variable for each activity and each subject
##Average (mean) data by subject and by activity
TidyDataSet <- aggregate(. ~Subject + ActivityName, almosttidyset, FUN = mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$Subject, TidyDataSet$Activity), ] #sorting of the data by subjects and activities
TidyDataSet <- TidyDataSet[ ,-3] #remove extra column named "Activity"

##Write the final table
write.table(TidyDataSet, "./data/TidyDataSet.txt", row.name=FALSE, col.names = TRUE)
View (TidyDataSet)
