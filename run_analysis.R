## Libraries
rm(list=ls())
library(plyr)
library(reshape2)

## Loading data sets
message('---loading data , please wait!---')
#features names
features <- read.table('../features.txt',col.names=c('fnum','feature.name'))$feature.name   

# read in train and test data set 
xtrain <- read.table('../train/X_train.txt',col.names=features)
xtest <- read.table('../test/X_test.txt',col.names=features)

# read in train and test subjects 
subj.train <- read.table('../train/subject_train.txt',col.names='subjects')   # train subjects
subj.test <- read.table('../test/subject_test.txt',col.names='subjects')   # test subjects

# read in train and test activities 
ytrain <- read.table('../train/y_train.txt',col.names='activity')   # y_train dataset
ytest <- read.table('../test/y_test.txt',col.names='activity')     # y_test dataset
activity.labels <- read.table('../activity_labels.txt',col.names=c('activity','activity.label'))

##  binding train and test data sets : 
y <- rbind(ytrain,ytest)
subjects <- rbind(subj.train,subj.test)
x <- rbind(xtrain,xtest)
rowdata <- cbind(subjects,y,x)

## merging activity labels data set with the main data set
data <- merge(activity.labels,rowdata,sort=F)


##  use pattern matching to find out columns which has  "mean()" or  "std()" in their names.
columns <- names(data)
meancolumns <- grep('*mean()',columns) # pattern matching to find *mean() columns
stdcolumns <- grep('*std()',columns) # pattern matching to find *std() columns

## extract meancolumns + stdcolumns + subjects + activity label column.
data <- data[,c(2,3,meancolumns,stdcolumns)]


## renaming variables
# Here I chose to stick with CamelCase for variables with long names. In my opinion CamelCase works better for long variable names , althought
# in the lecture videos it claims that lower case is better if it is "possible".Here I uses lower case for 'subjects'
# and 'activitylabel' variables.
# These things are changed :
# 1. 't' or 'f' in the beginning are changed to 'time_' or 'frequency_'. Here I use lower case since these two are 
# shared among variables.I use hyphen to seperate these from the rest of variable to make it more readable.
# 2. paranthesis and dots and hyphens are omitted.
# 3. 'Acc' , 'std' , 'Mag', 'Freq' are changed to more descriptive names 'Acceleration','Standarddeviation','Magnitude','Frequency' respectively.
varNames<- names(data)
varNames <- sub('^f','frequency_',varNames)
varNames <- sub('^t','time_',varNames)
varNames <- gsub('()','',varNames)
varNames <- gsub('-','',varNames)
varNames <- gsub('\\.','',varNames)
varNames <- gsub('Acc','Acceleration',varNames)
varNames <- gsub('std','StandardDeviation',varNames)
varNames <- gsub('mean','Mean',varNames)
varNames <- gsub('Mag','Magnitude',varNames)
varNames <- gsub('Freq','Frequency',varNames)


# assign data's name to the renamed names 
names(data) <- varNames




## getting mean for each measurement for each subject for each activity.  
meltdata <- melt(data,id.vars=c('subjects','activitylabel'))
castdata <- dcast(meltdata,subjects+activitylabel~variable,fun.aggregate=mean,na.rm=T)
final_data <- castdata






