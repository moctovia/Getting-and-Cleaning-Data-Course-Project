# Getting-and-Cleaning-Data-Course-Project


The dataset includes the following files:
=========================================

- 'README.MD'

- 'CodeBook.MD': Data dictionary that describes the variables in final.txt file

- 'run_analysis.R': The R function that processes the original data sets from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
		    and outputs a tidy data file. The function averages each mean() and std() variable for each activity and 
		    each subject. 

- 'final.txt': The output tidy data file


What run_analysis.R does:
=========================
1. Uploads the Samsung data into memory. The Samsung data must be placed in your work directory.

2. Appropriately labels the train and test data sets with descriptive variable names from features file

3. Merges the training and the test Data sets to create one data set.

4. Rename subject_train & subject_test's column from V1 to subjectNo

5. Merges the training and the test Subject sets to create one data set.

6. Merges the training and the test Activity sets to create one data set.

7. Merges the Data set, Activity set and Subject set into one data set

7. Removes duplicate columns names from merged train and test Data set.

8. Extracts only the measurements on the mean and standard deviation for each measurement from merged Data set.

9. Using merged Data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

10. Uses descriptive activity names to name the activities in the data set

11. Reorder data columns of data set

12. Saves the final tidy data set into "final.txt" file in your work directory
