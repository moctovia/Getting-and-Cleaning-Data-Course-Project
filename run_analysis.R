
library(dplyr)
library(reshape2)

run_analysis <- function () {
  
  ## upload files into memory
  X_train<-read.table("X_train.txt")
  subject_train<-read.table("subject_train.txt")
  y_train<-read.table("y_train.txt")
  X_test<-read.table("X_test.txt")
  subject_test<-read.table("subject_test.txt")
  y_test<-read.table("y_test.txt")
  features<-read.table("features.txt")
  activity_labels<-read.table("activity_labels.txt")

  
  ## Appropriately labels the train and test data sets with descriptive variable names from features file 
  colnames(X_train) <- features[,2]
  colnames(X_test) <- features[,2]
  
  ## Merges the training and the test Data sets to create one data set.
  ## rbind train and test data into 1
  trainTest<-rbind(X_train, X_test)
  
  
  ## rename subject_train & subject_test's column from V1 to subjectNo
  colnames(subject_train)<-"subjectNo"
  colnames(subject_test)<-"subjectNo"
  
  
  ## Merges the training and the test Subject sets to create one data set.
  ## rbind subject train and test into 1
  subjectTrainTest<-rbind(subject_train, subject_test)
  
  ## Merges the training and the test Activity sets to create one data set.
  ## rbind subject train and test into 1
  activityTrainTest<-rbind(y_train, y_test)
  
  
  ## Merges the Data set, Activity set and Subject set into one data set
  ## cbind subject, activity and trainTest 
  allMerged<-cbind(subjectTrainTest, activityTrainTest, trainTest)
  names(allMerged)[2] <- "activityID"
   
  
  ## Removes duplicate columns names from merged train and test Data set. none of the duplicate columns are mean/std
  allMerged<-allMerged[!duplicated(names(allMerged))]
  
  
  ## Extracts only the measurements on the mean and standard deviation for each measurement.
  meanStd<-select(allMerged, subjectNo:activityID, contains("mean()", ignore.case = TRUE), contains("std()", ignore.case = TRUE))
 
  ## creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  by_subject_activity<-meanStd %>% group_by( subjectNo, activityID) %>% summarise_each(c("mean"))
  
  ## Uses descriptive activity names to name the activities in the data set
  groupedWithActivityName<-merge(by_subject_activity,activity_labels, by.x = "activityID", by.y = "V1")
  groupedWithActivityName<-groupedWithActivityName[order(groupedWithActivityName$subjectNo),]
  names(groupedWithActivityName)[69] <- "activityLabel"
  
  
  ## Reorder data columns of data set
  final<-groupedWithActivityName[c(2,69,3:68)]
  
  # Saves the final tidy data set into "final.txt" file in your work directory
  write.table(final, file = "final.txt", row.names = FALSE)
  #View(final)
}