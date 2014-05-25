# Human Activity Recognition Using Smartphone Course Project's CodeBook
The data set used for this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).For furhter information regarding the process of data gathering you can visit this [page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ).

## Data : 
This data set has been gathered from 30 subjects, performing six activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on the waist.Signals has been captured from accelerometer and gyroscope embedded in the smartphone.Signals gathered from these two sensors are gathered and preprocesses and a collection of 561 features has been extracted. * for further information about the data set please read readme.txt file from the original data set*

## Cleaning :
Here we try to clean this data set , in order to do that these steps are taken: 

### Merging train and test data sets
The provided data set is divided into train and test data sets(train:70% of subjects,test:30% of subjects).Here we combine train and test data sets to get a one single data set.In train and test folder three text files are provided. The subject_train and subject_text holds the number of the subject. The x_train and x_test holds the measured and processed signals for train and test data.There are 561 measured features present. The y_train and y_test shows the activity of the subject. Here , all of the data from test and train data sets are merged together into one data frame.

### Extracting columns that represent **mean** or **standard deviation** of the measurements:
The columns that we are interested about are those that measure mean and standard deviation of measurements.Here without any assumption about which mean or standard deviation might be relevant , each column that has mean or standard deviation(std) as part of it's name has been chosen as the column of interest. The number of columns that meet this criteria in 79. 

### Using activity labels instead of activity numbers
In the y_train and y_test files , activities are represented as numbers.These numbers refer to particular activities that can be found in activity_labels.txt file in the provided data set.By mergind activity_labels data frame and the main data set we can get the activity labels instead of activity numbers.

### Renaming variable names:
This step is taken to make variable names more readable and descriptive.The logic that we have chosen here is as follows:
Here I chose to stick with CamelCase for variables with long names. In my opinion CamelCase works better for long variable names , althought in the lecture videos it claims that lower case is better if it is "possible".Here I uses lower case for 'subjects'
and 'activitylabel' variables.These things are changed :
1. 't' or 'f' in the beginning are changed to 'time_' or 'frequency_'. Here I use lower case since these two are shared among variables.I use hyphen to seperate these from the rest of variable to make it more readable.
2. paranthesis and dots and hyphens(except for frequency_ and time_ ) are omitted.
3. 'Acc' , 'std' , 'Mag' are changed to more descriptive names 'Acceleration','StandardDeviation','Magnitude' respectively.

### Final data set : average of each variable for each activity and each subject
The tidy final data set consists of average of each variable for each activity and each subject.In order to take the mean of each variable , the data set is reshaped using reshape2 package in R. After melting the data set by using 'subjects' and 'activity' as id.vars , the resulting data is used to cast to a new data set using mean function as the aggregate function.This way we managed to get mean for each variable for each subject for each activity.

## Variables: 

#### Variables List : 
Here is the list of variables in the final tidy data set : 
* 1. subjects : an integer that shows subject number
* 2. activitylabel : a factor variable with six levels : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* 3. time_BodyAccelerationMeanX : a numeric variable measuring mean body acceleration in time domain in direction X
* 4. time_BodyAccelerationMeanY : a numeric variable measuring mean body acceleration in time domain in direction Y
* 5. time_BodyAccelerationMeanZ : a numeric variable measuring mean body acceleration in time domain in direction Z
* 6. time_GravityAccelerationMeanX : a numeric variable measuring mean gravity acceleration in time domain in direction X
* 7. time_GravityAccelerationMeanY : a numeric variable measuring mean gravity acceleration in time domain in direction Y
* 8. time_GravityAccelerationMeanZ : a numeric variable measuring mean gravity acceleration in time domain in direction Z
* 9. time_BodyAccelerationJerkMeanX : a numeric variable measuring mean acceleration jerk in time domain in direction X
* 10. time_BodyAccelerationJerkMeanY :  a numeric variable measuring mean acceleration jerk in time domain in direction Y
* 11. time_BodyAccelerationJerkMeanZ :  a numeric variable measuring mean acceleration jerk in time domain in direction Z
* 12. time_BodyGyroMeanX : a numeric variable measuring mean body gyro in time domain in direction X
* 13. time_BodyGyroMeanY : a numeric variable measuring mean body gyro in time domain in direction Y
* 14. time_BodyGyroMeanZ : a numeric variable measuring mean body gyro in time domain in direction Z
* 15. time_BodyGyroJerkMeanX : a numeric variable measuring mean body gyro jerk in time domain in direction X
* 16. time_BodyGyroJerkMeanY : a numeric variable measuring mean body gyro jerk in time domain in direction Y
* 17. time_BodyGyroJerkMeanZ : a numeric variable measuring mean body gyro jerk in time domain in direction Z
* 18. time_BodyAccelerationMagnitudeMean : a numeric variable measuring mean body acceleration magnitude in time domain 
* 19. time_GravityAccelerationMagnitudeMean : a numeric variable measuring gravity acceleration magnitude in time domain 
* 20. time_BodyAccelerationJerkMagnitudeMean : a numeric variable measuring mean body acceleration jerk magnitude in time domain 
* 21. time_BodyGyroMagnitudeMean : a numeric variable measuring mean body  gyro magnitude in time domain
* 22. time_BodyGyroJerkMagnitudeMean : a numeric variable measuring mean body gyro jerk magnitude in time domain
* 23. frequency_BodyAccelerationMeanX : a numeric variable measuring mean body acceleration in frequency domain in direction X
* 24. frequency_BodyAccelerationMeanY : a numeric variable measuring mean body acceleration in frequency domain in direction Y
* 25. frequency_BodyAccelerationMeanZ : a numeric variable measuring mean body acceleration in frequency domain in direction Z
* 26. frequency_BodyAccelerationMeanFrequencyX : a numeric variable measuring mean body acceleration frequency  in frequency domain in direction X
* 27. frequency_BodyAccelerationMeanFrequencyY : a numeric variable measuring mean body acceleration frequency  in frequency domain in direction Y
* 28. frequency_BodyAccelerationMeanFrequencyZ : a numeric variable measuring mean body acceleration frequency  in frequency domain in direction Z
* 29. frequency_BodyAccelerationJerkMeanX : a numeric variable measuring mean body acceleration jerk in frequency domain in direction X
* 30. frequency_BodyAccelerationJerkMeanY : a numeric variable measuring mean body acceleration jerk in frequency domain in direction Y
* 31. frequency_BodyAccelerationJerkMeanZ : a numeric variable measuring mean body acceleration jerk in frequency domain in direction Z
* 32. frequency_BodyAccelerationJerkMeanFrequencyX : a numeric variable measuring mean body acceleration jerk frequency in frequency domain in direction X
* 33. frequency_BodyAccelerationJerkMeanFrequencyY : a numeric variable measuring mean body acceleration jerk frequency in frequency domain in direction Y
* 34. frequency_BodyAccelerationJerkMeanFrequencyZ : a numeric variable measuring mean body acceleration jerk frequency in frequency domain in direction Z
* 35. frequency_BodyGyroMeanX : a numeric variable measuring mean body gyro in frequency domain in direction X
* 36. frequency_BodyGyroMeanY : a numeric variable measuring mean body gyro in frequency domain in direction Y
* 37. frequency_BodyGyroMeanZ : a numeric variable measuring mean body gyro in frequency domain in direction Z
* 38. frequency_BodyGyroMeanFrequencyX : a numeric varialbe measuring mean body gyro frequency in frequency domain in direction X
* 39. frequency_BodyGyroMeanFrequencyY : a numeric varialbe measuring mean body gyro frequency in frequency domain in direction Y
* 40. frequency_BodyGyroMeanFrequencyZ : a numeric varialbe measuring mean body gyro frequency in frequency domain in direction Z
* 41. frequency_BodyAccelerationMagnitudeMean : a numeric variable measuring mean body acceleration magnitude in frequency domian 
* 42. frequency_BodyAccelerationMagnitudeMeanFrequency : a numeric variable measuring mean body acceleration magnitude frequency in frequency domain
* 43. frequency_BodyBodyAccelerationJerkMagnitudeMean : a numeric variable measuring mean body body acceleration jerk magnitude in frequency domain  
* 44. frequency_BodyBodyAccelerationJerkMagnitudeMeanFrequency : a numeric variable measuring mean body body acceleration jerk frequency magnitude in frequency domian
* 45. frequency_BodyBodyGyroMagnitudeMean : a numeric varialbe measuring mean body body gyro magnitude in frequency domain 
* 46. frequency_BodyBodyGyroMagnitudeMeanFrequency : a numeric varialbe measuring mean body body gyro frequency magnitude in frequency domain
* 47. frequency_BodyBodyGyroJerkMagnitudeMean : a numeric variable measuring body body gyro jerk magnitude in frequency domain 
* 48. frequency_BodyBodyGyroJerkMagnitudeMeanFrequency : a numeric variable measuring mean body body gyro jerk frequency magnitude in frequency domain
* 49. time_BodyAccelerationStandardDeviationX : a numeric variable measuring body acceleration standard deviation in time domain in direction X
* 50. time_BodyAccelerationStandardDeviationY : a numeric variable measuring body acceleration standard deviation in time domain in direction Y
* 51. time_BodyAccelerationStandardDeviationZ : a numeric variable measuring body acceleration standard deviation in time domain in direction Z
* 52. time_GravityAccelerationStandardDeviationX : a numeric variable measuring gravity acceleration standard deviation in time domain in direction X
* 53. time_GravityAccelerationStandardDeviationY : a numeric variable measuring gravity acceleration standard deviation  in time domain in direction Y
* 54. time_GravityAccelerationStandardDeviationZ : a numeric variable measuring gravity acceleration standard deviation in time domain in direction Z
* 55. time_BodyAccelerationJerkStandardDeviationX : a numeric variable measuring body acceleration jerk standard deviation in time domain in direction X
* 56. time_BodyAccelerationJerkStandardDeviationY : a numeric variable measuring body acceleration jerk standard deviation in time domain in direction Y
* 57. time_BodyAccelerationJerkStandardDeviationZ : a numeric variable measuring body acceleration jerk standard deviation in time domain in direction Z
* 58. time_BodyGyroStandardDeviationX : a numeric variable measuring body gyro standard deviation in time domain in direction X
* 59. time_BodyGyroStandardDeviationY : a numeric variable measuring body gyro standard deviation in time domain in direction Y
* 60. time_BodyGyroStandardDeviationZ : a numeric variable measuring body gyro standard deviation in time domain in direction Z
* 61. time_BodyGyroJerkStandardDeviationX : a numeric variable measuring body gyro jerk standard deviation in time domain in direction X
* 62. time_BodyGyroJerkStandardDeviationY :  a numeric variable measuring body gyro jerk standard deviation in time domain in direction Y
* 63. time_BodyGyroJerkStandardDeviationZ  : a numeric variable measuring body gyro jerk standard deviation in time domain in direction Z
* 64. time_BodyAccelerationMagnitudeStandardDeviation : a numeric variable measuring body acceleration magnitude standard deviation in time domain 
* 65. time_GravityAccelerationMagnitudeStandardDeviation : a numeric variable measuring gravity acceleratin magnitude standard deviation in time domain
* 66. time_BodyAccelerationJerkMagnitudeStandardDeviation : a numeric variable measuring body acceleration jerk magnitude standard deviation in time domain
* 67. time_BodyGyroMagnitudeStandardDeviation : a numeric variable measuring body gyro  magnitude standard deviation in time domain
* 68. time_BodyGyroJerkMagnitudeStandardDeviation : a numeric variable measuring body gyro jerk magnitude standard deviation in time domain 
* 69. frequency_BodyAccelerationStandardDeviationX : a numeric variable measuring body acceleration stnadard deviation in frequency domain in direction X
* 70. frequency_BodyAccelerationStandardDeviationY : a numeric variable measuring body acceleration stnadard deviation in frequency domain in direction Y
* 71. frequency_BodyAccelerationStandardDeviationZ : a numeric variable measuring body acceleration stnadard deviation in frequency domain in direction Z
* 72. frequency_BodyAccelerationJerkStandardDeviationX : a numeric variable measuring body acceleration jerk standard deviation in frequency domain in direction X
* 73. frequency_BodyAccelerationJerkStandardDeviationY : a numeric variable measuring body acceleration jerk standard deviation in frequency domain in direction Y
* 74. frequency_BodyAccelerationJerkStandardDeviationZ : a numeric variable measuring body acceleration jerk standard deviation in frequency domain in direction Z
* 75. frequency_BodyGyroStandardDeviationX : a numeric variable measuring body gyro standard deviation  in frequency domain in direction X
* 76. frequency_BodyGyroStandardDeviationY : a numeric variable measuring body gyro standard deviation  in frequency domain in direction Y
* 77. frequency_BodyGyroStandardDeviationZ : a numeric variable measuring body gyro standard deviation  in frequency domain in direction Z
* 78. frequency_BodyAccelerationMagnitudeStandardDeviation : a numeric variable measuring body acceleration magnitude standard deviation in frequency domain
* 79. frequency_BodyBodyAccelerationJerkMagnitudeStandardDeviation : a numeric variable measuring body body acceleration jerk magnitude standard deviation in frequency domain
* 80. frequency_BodyBodyGyroMagnitudeStandardDeviation : a numeric variable measuring body body gyro magnitude standard deviation in frequency domain
* 81. frequency_BodyBodyGyroJerkMagnitudeStandardDeviation : a numeric variable measuring body body gyro jekr magnitude stanadard deviation in frequency domain


#### Variables Description - Extra notes:
Note that variable names that start with time belong to measured signals in the time domain and those that start with frequency refer to signals in frequency domain.Also variables that end with X , Y or Z refer to the measured signal in the respective axis.





