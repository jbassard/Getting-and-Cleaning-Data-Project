##Check if files exist in the folder "data" in working directory, otherwise creates the folder, download and unzip the dataset in that folder

if(!file.exists("./data/Dataset.zip")) {
	dir.create("./data")
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl, destfile="data/Dataset.zip")}
if(!file.exists(".data/UCI HAR Dataset")) {
	unzip(zipfile="./data/Dataset.zip", exdir="./data")}

##Store file path
path_data <- file.path("./data", "UCI HAR Dataset")

##Then read and store the various files used for the assignement
Xtest <- read.table(file.path(path_data, "test", "X_test.txt"), header = FALSE)
Xtrain <- read.table(file.path(path_data, "train", "X_train.txt"), header = FALSE)
Ytest  <- read.table(file.path(path_data, "test", "Y_test.txt"), header = FALSE)
Ytrain <- read.table(file.path(path_data, "train", "Y_train.txt"), header = FALSE)
SubjectTest  <- read.table(file.path(path_data, "test", "subject_test.txt"), header = FALSE)
SubjectTrain <- read.table(file.path(path_data, "train", "subject_train.txt"), header = FALSE)
variablenames <- read.table(file.path(path_data, "features.txt"), header=FALSE)
activityLabels <- read.table(file.path(path_data, "activity_labels.txt"),header = FALSE)

#Merging the training and the test sets to create one dataset
##Merge the trainings and the tests datasets in one dataset, first by rows merging
Xmerge <- rbind(Xtrain, Xtest)
Ymerge <- rbind(Ytrain, Ytest)
Subjectmerge <- rbind(SubjectTrain, SubjectTest)

##Create names for variables
names(Subjectmerge) <- c("Subject")
names(Ymerge) <- c("Activity")
names(Xmerge)<- variablenames$V2

##Final merging (by column)
thedataset <- cbind(Xmerge, Subjectmerge, Ymerge)

#Extracts only the measurements on the mean and standard deviation for each measurement
##Store column names
colNames <- colnames(thedataset)

##Extract mean, SD
selection <- (grepl("Activity" , colNames) | grepl("Subject" , colNames) | grepl("mean.." , colNames) |  grepl("std.." , colNames))
meanSD <- thedataset[ , selection == TRUE]

#Uses descriptive activity names to name the activities in the dataset
##Name columns in "activityLabels"
colnames(activityLabels) <- c("Activity","ActivityName")

##Merge "activityLabels" with "meanSD"
almosttidyset <- merge(meanSD, activityLabels, by= "Activity", all.x=TRUE)

#Appropriately labels the data set with descriptive variable names.

##activity names applied to the dataset
names(thedataset)<-gsub("^t", "time", names(thedataset))
names(thedataset)<-gsub("^f", "frequency", names(thedataset))
names(thedataset)<-gsub("Acc", "Accelerometer", names(thedataset))
names(thedataset)<-gsub("Gyro", "Gyroscope", names(thedataset))
names(thedataset)<-gsub("Mag", "Magnitude", names(thedataset))
names(thedataset)<-gsub("BodyBody", "Body", names(thedataset))

View(thedataset)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
colnames(mean_SD) <- "subject"
total <- cbind(Xmerge, activityLabels, mean_SD)

TidyDataSet <- aggregate(. ~subject + activity, thedataset, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$subject, TidyDataSet$activity), ]

View(TidyDataSet)
write.table(TidyDataSet, "./data/TidyDataSet.txt", row.name=FALSE, col.names = TRUE)
