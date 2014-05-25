# Human Activity Recognition Using Smartphone: Course Project
This repo is created for Getting and Cleaning Data course project. The dataset that is provided has been gathered from 30 subjects, performing six activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on the waist.Signals has been captured from accelerometer and gyroscope embedded in the smartphone.For further information about the dataset  please visit [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
## Project
In this project , we try to clean the provided data set to a final tidy data set.In order to do that these steps are taken : 
* Train and test data sets  are binded to one data set.
* Columns that only measure **mean** or **standard deviation** of the signals are extracted.
* Activity labels are used to point to activities instead of activity numbers.
* The variable names are changed so that they are more readable(for further details about variable renaming please read Codebook.md)
* A tidy data set has been created with the average of each variable for each activity and each subject.

## Files: 
files that are used in this project are as follows:(*Note: Description of the files are taken from readme.txt file in the original data*)

* activity_labels.txt : Links the class labels with their activity name. 
* features.txt: List of all features.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.

Files that are created:
* run_analysis.R: An R script that will clean the data 
* Codebook.md: A markdown file about variables, data and processings that have been taken.
* Readme.txt

