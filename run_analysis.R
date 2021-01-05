# Getting and Cleaning Data Course Project 
library(data.table)

# 1. Obtain and merge data
#Loading raw data sets
getwd()
setwd("C:/Users/..../3. GETTING AND CLEANING DATA/PROYECT")
if(!file.exists("data")){dir.create("data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/data.zip")
unzip("./data/data.zip")

# reset working directory

setwd("C:/Users/.../3. GETTING AND CLEANING DATA/PROYECT/UCI HAR Dataset")

# The files to be used include the following: 
# test/subject_test.txt, test/X_test.txt, test/y_test.txt, 
# train/subject_train.txt, train/X_train.txt, train/y_train.txt. 
# Inertial Signals file is excluded

Train <- read.table("./train/subject_train.txt", header = FALSE)
XTrain <- read.table("./train/X_train.txt", header = FALSE)
yTrain <- read.table("./train/y_train.txt", header = FALSE)

Test <- read.table("./test/subject_test.txt", header = FALSE)
XTest <- read.table("./test/X_test.txt", header = FALSE)
yTest <- read.table("./test/y_test.txt", header = FALSE)

# Organize and combine raw data sets into one.

DataSet <- rbind(Train, Test)
dim(DataSet)

XDataSet <- rbind(XTrain, XTest)
dim(XDataSet)

yDataSet <- rbind(yTrain, yTest)
dim(yDataSet)

# 2. Extract only the measures from the mean and standard deviation of each measure.

# XData subset based on the logical vector to keep only the desired columns, i.e. mean() and std().

XDataSet_mean_std <- XDataSet[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
names(XDataSet_mean_std) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2]
View(XDataSet_mean_std)
dim(XDataSet_mean_std)

# 3. Use descriptive activity names to name the activities in the data set.

yDataSet[, 1] <- read.table("activity_labels.txt")[yDataSet[, 1], 2]
names(yDataSet) <- "Activity"
View(yDataSet)

# 4. Properly label the data set with descriptive names of the activity

names(DataSet) <- "Subject"
summary(DataSet)

# Organize and combine all data sets into one.

singleDataSet <- cbind(XDataSet_mean_std, yDataSet, DataSet)

# Defining descriptive names for all variables.

names(singleDataSet) <- make.names(names(singleDataSet))
names(singleDataSet) <- gsub('Acc', "Acceleration", names(singleDataSet))
names(singleDataSet) <- gsub('GyroJerk', "AngularAcceleration", names(singleDataSet))
names(singleDataSet) <- gsub('Gyro', "AngularSpeed", names(singleDataSet))
names(singleDataSet) <- gsub('Mag', "Magnitude", names(singleDataSet))
names(singleDataSet) <- gsub('^t', "TimeDomain", names(singleDataSet))
names(singleDataSet) <- gsub('^f', "FrequencyDomain", names(singleDataSet))
names(singleDataSet) <- gsub('\\.mean', ".Mean", names(singleDataSet))
names(singleDataSet) <- gsub('\\.std', ".StandardDeviation", names(singleDataSet))
names(singleDataSet) <- gsub('Freq\\.', "Frequency.", names(singleDataSet))
names(singleDataSet) <- gsub('Freq$', "Frequency", names(singleDataSet))

View(singleDataSet)
dim(singleDataSet)

# 5. Create a second independent and ordered data set with the average of each variable for each activity and each subject.

names(singleDataSet)
Data2 <- aggregate(. ~ Subject + Activity, data = singleDataSet, FUN = mean)
Data2 <- Data2[order(Data2$Subject, Data2$Activity),]
View(Data2)
dim(Data2)

# creating an ordered dataset file
write.table(Data2, file = "tidydataset.txt", row.name = FALSE)
