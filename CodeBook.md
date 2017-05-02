This Code Book summarizes the resulting data presented in "TidyDataSet.txt".


#Source of data

Data Source for this assignement was datasets generated from Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living.
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for this project are donwloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Transformation and work performed by "run_analysis.R" on data to obtain "TidyDataSet"
* 1-Merge the training and the test sets to create one dataset
** First by rows merging
** Create names for variables
** Final merging (by column)

* 2-Extract only the mean and standard deviation for each measurement

* 3-Use descriptive activity names to name the activities in the dataset

* 4-Appropriately label the dataset with descriptive variable names.
* 5-From the data set in step 4, create a second independent tidy data set, with the average of each variable for each activity and each subject
** Average (mean) data by Subject and by Activity
** Write the final table

#TidyDataSet description
This TidyDataSet contains 180 rows and 82 columns.
Columns represent the different variables used for this project.
The data were averaged and grouped by row, based on Subject and Activity identifiers.
Subject column is numbered sequentially from 1 to 30.
Activity column has 6 type-names as listed below:
* WALKING (value 1): subject was walking during the test
* WALKING_UPSTAIRS (value 2): subject was walking up during the test
* WALKING_DOWNSTAIRS (value 3): subject was walking down during the test
* SITTING (value 4): subject was sitting during the test
* STANDING (value 5): subject was standing during the test
* LAYING (value 6): subject was laying down during the test

##The variables in the tidy data
 [1] "Subject"                                                
 [2] "Activity"                                               
 [3] "TimeBodyAccelerometer-mean()-X"                         
 [4] "TimeBodyAccelerometer-mean()-Y"                         
 [5] "TimeBodyAccelerometer-mean()-Z"                         
 [6] "TimeBodyAccelerometer-std()-X"                          
 [7] "TimeBodyAccelerometer-std()-Y"                          
 [8] "TimeBodyAccelerometer-std()-Z"                          
 [9] "TimeGravityAccelerometer-mean()-X"                      
[10] "TimeGravityAccelerometer-mean()-Y"                      
[11] "TimeGravityAccelerometer-mean()-Z"                      
[12] "TimeGravityAccelerometer-std()-X"                       
[13] "TimeGravityAccelerometer-std()-Y"                       
[14] "TimeGravityAccelerometer-std()-Z"                       
[15] "TimeBodyAccelerometerJerk-mean()-X"                     
[16] "TimeBodyAccelerometerJerk-mean()-Y"                     
[17] "TimeBodyAccelerometerJerk-mean()-Z"                     
[18] "TimeBodyAccelerometerJerk-std()-X"                      
[19] "TimeBodyAccelerometerJerk-std()-Y"                      
[20] "TimeBodyAccelerometerJerk-std()-Z"                      
[21] "TimeBodyGyroscope-mean()-X"                             
[22] "TimeBodyGyroscope-mean()-Y"                             
[23] "TimeBodyGyroscope-mean()-Z"                             
[24] "TimeBodyGyroscope-std()-X"                              
[25] "TimeBodyGyroscope-std()-Y"                              
[26] "TimeBodyGyroscope-std()-Z"                              
[27] "TimeBodyGyroscopeJerk-mean()-X"                         
[28] "TimeBodyGyroscopeJerk-mean()-Y"                         
[29] "TimeBodyGyroscopeJerk-mean()-Z"                         
[30] "TimeBodyGyroscopeJerk-std()-X"                          
[31] "TimeBodyGyroscopeJerk-std()-Y"                          
[32] "TimeBodyGyroscopeJerk-std()-Z"                          
[33] "TimeBodyAccelerometerMagnitude-mean()"                  
[34] "TimeBodyAccelerometerMagnitude-std()"                   
[35] "TimeGravityAccelerometerMagnitude-mean()"               
[36] "TimeGravityAccelerometerMagnitude-std()"                
[37] "TimeBodyAccelerometerJerkMagnitude-mean()"              
[38] "TimeBodyAccelerometerJerkMagnitude-std()"               
[39] "TimeBodyGyroscopeMagnitude-mean()"                      
[40] "TimeBodyGyroscopeMagnitude-std()"                       
[41] "TimeBodyGyroscopeJerkMagnitude-mean()"                  
[42] "TimeBodyGyroscopeJerkMagnitude-std()"                   
[43] "FrequencyBodyAccelerometer-mean()-X"                    
[44] "FrequencyBodyAccelerometer-mean()-Y"                    
[45] "FrequencyBodyAccelerometer-mean()-Z"                    
[46] "FrequencyBodyAccelerometer-std()-X"                     
[47] "FrequencyBodyAccelerometer-std()-Y"                     
[48] "FrequencyBodyAccelerometer-std()-Z"                     
[49] "FrequencyBodyAccelerometer-meanFrequency()-X"           
[50] "FrequencyBodyAccelerometer-meanFrequency()-Y"           
[51] "FrequencyBodyAccelerometer-meanFrequency()-Z"           
[52] "FrequencyBodyAccelerometerJerk-mean()-X"                
[53] "FrequencyBodyAccelerometerJerk-mean()-Y"                
[54] "FrequencyBodyAccelerometerJerk-mean()-Z"                
[55] "FrequencyBodyAccelerometerJerk-std()-X"                 
[56] "FrequencyBodyAccelerometerJerk-std()-Y"                 
[57] "FrequencyBodyAccelerometerJerk-std()-Z"                 
[58] "FrequencyBodyAccelerometerJerk-meanFrequency()-X"       
[59] "FrequencyBodyAccelerometerJerk-meanFrequency()-Y"       
[60] "FrequencyBodyAccelerometerJerk-meanFrequency()-Z"       
[61] "FrequencyBodyGyroscope-mean()-X"                        
[62] "FrequencyBodyGyroscope-mean()-Y"                        
[63] "FrequencyBodyGyroscope-mean()-Z"                        
[64] "FrequencyBodyGyroscope-std()-X"                         
[65] "FrequencyBodyGyroscope-std()-Y"                         
[66] "FrequencyBodyGyroscope-std()-Z"                         
[67] "FrequencyBodyGyroscope-meanFrequency()-X"               
[68] "FrequencyBodyGyroscope-meanFrequency()-Y"               
[69] "FrequencyBodyGyroscope-meanFrequency()-Z"               
[70] "FrequencyBodyAccelerometerMagnitude-mean()"             
[71] "FrequencyBodyAccelerometerMagnitude-std()"              
[72] "FrequencyBodyAccelerometerMagnitude-meanFrequency()"    
[73] "FrequencyBodyAccelerometerJerkMagnitude-mean()"         
[74] "FrequencyBodyAccelerometerJerkMagnitude-std()"          
[75] "FrequencyBodyAccelerometerJerkMagnitude-meanFrequency()"
[76] "FrequencyBodyGyroscopeMagnitude-mean()"                 
[77] "FrequencyBodyGyroscopeMagnitude-std()"                  
[78] "FrequencyBodyGyroscopeMagnitude-meanFrequency()"        
[79] "FrequencyBodyGyroscopeJerkMagnitude-mean()"             
[80] "FrequencyBodyGyroscopeJerkMagnitude-std()"              
[81] "FrequencyBodyGyroscopeJerkMagnitude-meanFrequency()"    
[82] "ActivityName"  

##Variable units
"Activity" variable is factor type. "Subject" variable is integer type. All the other variables are numeric type.
