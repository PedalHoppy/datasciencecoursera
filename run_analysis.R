## You should create one R script called run_analysis.R that does 
## the following.

## Merges the training and the test sets to create one data set.

## First load the data - presumes dataset is in a folder named 'data' inside 
## current working directory
  xtest <- read.table("data/UCI HAR Dataset/test/X_test.txt")
  ytest <- read.table("data/UCI HAR Dataset/test/y_test.txt")
  subjtest <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
  
  xtrain <- read.table("data/UCI HAR Dataset/train/X_train.txt")
  ytrain <- read.table("data/UCI HAR Dataset/train/y_train.txt")
  subjtrain <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
  
  header <- read.table("data/UCI HAR Dataset/features.txt")

## Now combine to one table and name the columns
  test <- cbind(subjtest, ytest, xtest)
  train <- cbind(subjtrain, ytrain, xtrain)
  whole <- rbind(test, train)
  
  labels <- as.character(header[, 2])
  colnames(whole) <- c("subject", "activity", labels)

## clear out the temp variables to save resources
  rm(xtrain, ytrain, subjtrain, train, xtest, ytest, subjtest, test, header)

## Extracts only the measurements on the mean and standard deviation
##  for each measurement.
  library(dplyr)
  goodcols <- whole[, grepl("mean()|std()", names(whole))]
## workaround - can't seem to select everything I want at once
  goodcols2<- whole[,1:2]
  gooddf <- tbl_df(cbind(goodcols2, goodcols))
  rm(goodcols2, goodcols)


## Uses descriptive activity names to name the activities in the data set

# name the columns so the two lists can merge easily
## I should be able to do this using mutate instead to avoid adding & deleting
## & renaming the column

  activities <- read.table("data/UCI HAR Dataset/activity_labels.txt")
  names(activities) <- c("activity", "activity_desc")
  dfnamed <- merge (activities, gooddf)
  dfnamed <- select(dfnamed, -activity)
  names(dfnamed)[1]<- "activity"
  rm(gooddf, whole)

## Appropriately labels the data set with descriptive variable names.
## Plan of attack : put the names in a vector, grep the vector, reassign to colnames
  labels <- names(dfnamed)
  labels <- gsub("Acc", "Accelerometer", labels)
  labels <- gsub("Gyro", "Gyroscope", labels)
  labels <- gsub("Mag", "Magnitude", labels)
  labels <- gsub("^t", "Timed", labels)
  labels <- gsub("^f", "Frequency", labels)
  names(dfnamed) <- labels
  
## From the data set in step 4, creates a second, independent tidy data set
##  with the average of each variable for each activity and each subject.
  tidy <- dfnamed %>%  
          select(subject, activity, 3:81) %>% 
          group_by(subject, activity)  %>%
          summarise_each(funs(mean))
  
## append -mean to the variable names to reflect the summary  
  labels <- names(tidy)
  labels[3:81]<- gsub("$", "-mean", labels[3:81])
  names(tidy)<- labels
