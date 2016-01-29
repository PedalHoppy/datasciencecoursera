# Codebook

The original data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unzipped to a folder named 'data' inside the R working directory.

The file folder 'UCI HAR Dataset' contains four text files which describe the data and two folders: 'train' andt 'test' which contain the data.


The following refers to the handling of the original data set and is extracted from the features_info.txt file included with that data:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The experimenters used these signals to calculate twenty-two other variables, the two that are of interest are: 

mean(): Mean value  
std(): Standard deviation  

To build the final tidy data set several steps were needed to transform and reshape the original data. First the two datasets training and test were combined yeilding a data set of 10299 observations of 563 variables. Next only the measurement columns including the literal characters *mean()* or *std()* were retained. All other estimated variables and the original signals were removed leaving a data frame with 10299 observations of 81 variables.  

The activities in the original data were coded 1 to 6 for WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, and LAYING. To improve readability the code for each activity was replaced with its value. 

There are 30 subjects and 6 activities so there are many observations for each activity/subject pairing. The final tidy data summarizes the mean of each mean() and std() estimate for each of the variables yeilding a dataset of 180 observations of the 81 variables. The variables have been renamed to be more human readable by making the following replacements:  
  t if the first character becomes Timed  
  f if the first character becomes Frequency  
  Acc becomes Accelerometer  
  Gyro becomes Gyroscope  
  Mag becomes Magnitude  

These are the variables in the resulting tidy dataset:

>subject                                               
activity                                              
TimedBodyAccelerometer-mean()-X-mean                       
TimedBodyAccelerometer-mean()-Y-mean                       
TimedBodyAccelerometer-mean()-Z-mean                       
TimedBodyAccelerometer-std()-X-mean                        
TimedBodyAccelerometer-std()-Y-mean                        
TimedBodyAccelerometer-std()-Z-mean                        
TimedGravityAccelerometer-mean()-X-mean                    
TimedGravityAccelerometer-mean()-Y-mean                    
TimedGravityAccelerometer-mean()-Z-mean                    
TimedGravityAccelerometer-std()-X-mean                     
TimedGravityAccelerometer-std()-Y-mean                     
TimedGravityAccelerometer-std()-Z-mean                     
TimedBodyAccelerometerJerk-mean()-X-mean                   
TimedBodyAccelerometerJerk-mean()-Y-mean                   
TimedBodyAccelerometerJerk-mean()-Z-mean                   
TimedBodyAccelerometerJerk-std()-X-mean                    
TimedBodyAccelerometerJerk-std()-Y-mean                    
TimedBodyAccelerometerJerk-std()-Z-mean                    
TimedBodyGyroscope-mean()-X-mean                           
TimedBodyGyroscope-mean()-Y-mean                           
TimedBodyGyroscope-mean()-Z-mean                           
TimedBodyGyroscope-std()-X-mean                            
TimedBodyGyroscope-std()-Y-mean                            
TimedBodyGyroscope-std()-Z-mean                            
TimedBodyGyroscopeJerk-mean()-X-mean                       
TimedBodyGyroscopeJerk-mean()-Y-mean                       
TimedBodyGyroscopeJerk-mean()-Z-mean                       
TimedBodyGyroscopeJerk-std()-X-mean                        
TimedBodyGyroscopeJerk-std()-Y-mean                        
TimedBodyGyroscopeJerk-std()-Z-mean                        
TimedBodyAccelerometerMagnitude-mean()-mean                
TimedBodyAccelerometerMagnitude-std()-mean                 
TimedGravityAccelerometerMagnitude-mean()-mean             
TimedGravityAccelerometerMagnitude-std()-mean              
TimedBodyAccelerometerJerkMagnitude-mean()-mean            
TimedBodyAccelerometerJerkMagnitude-std()-mean             
TimedBodyGyroscopeMagnitude-mean()-mean                    
TimedBodyGyroscopeMagnitude-std()-mean                     
TimedBodyGyroscopeJerkMagnitude-mean()-mean                
TimedBodyGyroscopeJerkMagnitude-std()-mean                 
FrequencyBodyAccelerometer-mean()-X-mean                   
FrequencyBodyAccelerometer-mean()-Y-mean                   
FrequencyBodyAccelerometer-mean()-Z-mean                   
FrequencyBodyAccelerometer-std()-X-mean                    
FrequencyBodyAccelerometer-std()-Y-mean                    
FrequencyBodyAccelerometer-std()-Z-mean                    
FrequencyBodyAccelerometer-meanFreq()-X-mean               
FrequencyBodyAccelerometer-meanFreq()-Y-mean               
FrequencyBodyAccelerometer-meanFreq()-Z-mean               
FrequencyBodyAccelerometerJerk-mean()-X-mean               
FrequencyBodyAccelerometerJerk-mean()-Y-mean               
FrequencyBodyAccelerometerJerk-mean()-Z-mean               
FrequencyBodyAccelerometerJerk-std()-X-mean                
FrequencyBodyAccelerometerJerk-std()-Y-mean                
FrequencyBodyAccelerometerJerk-std()-Z-mean                
FrequencyBodyAccelerometerJerk-meanFreq()-X-mean          
FrequencyBodyAccelerometerJerk-meanFreq()-Y-mean           
FrequencyBodyAccelerometerJerk-meanFreq()-Z-mean           
FrequencyBodyGyroscope-mean()-X-mean                       
FrequencyBodyGyroscope-mean()-Y-mean                       
FrequencyBodyGyroscope-mean()-Z-mean                       
FrequencyBodyGyroscope-std()-X-mean                        
FrequencyBodyGyroscope-std()-Y-mean                        
FrequencyBodyGyroscope-std()-Z-mean                        
FrequencyBodyGyroscope-meanFreq()-X-mean                   
FrequencyBodyGyroscope-meanFreq()-Y-mean                  
FrequencyBodyGyroscope-meanFreq()-Z-mean                   
FrequencyBodyAccelerometerMagnitude-mean()-mean            
FrequencyBodyAccelerometerMagnitude-std()-mean             
FrequencyBodyAccelerometerMagnitude-meanFreq()-mean        
FrequencyBodyBodyAccelerometerJerkMagnitude-mean()-mean    
FrequencyBodyBodyAccelerometerJerkMagnitude-std()-mean     
FrequencyBodyBodyAccelerometerJerkMagnitude-meanFreq()-mean
FrequencyBodyBodyGyroscopeMagnitude-mean()-mean            
FrequencyBodyBodyGyroscopeMagnitude-std()-mean             
FrequencyBodyBodyGyroscopeMagnitude-meanFreq()-mean        
FrequencyBodyBodyGyroscopeJerkMagnitude-mean()-mean        
FrequencyBodyBodyGyroscopeJerkMagnitude-std()-mean          
FrequencyBodyBodyGyroscopeJerkMagnitude-meanFreq()-mean


