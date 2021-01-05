**"Getting and Cleaning Data"** Course Project Code Book
========================================

# Data entry

- This project will use six data, which are `x_train.txt`, `x_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt`, all of which can be found within the downloaded data set, namely [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
- The `features.txt` contains the correct name of the variable, which corresponds to each column of `x_train.txt` and `x_test.txt`. There is a more detailed explanation of each characteristic in `features_info.txt`.
- The `activity_labels.txt` contains the descriptive names for each activity tag, which corresponds to each number in the `y_train.txt` and `y_test.txt`.
- `README.txt` describes the general process of how the editors of this dataset performed the experiment and obtained the result of the data.

# Introduction to the course project
The `run_analysis.R` script uses the `data.table` package to rename the column and read files. It performs 5 main steps that include:

1. Merge the training and test sets to create one data set. (Next, the word data means both "training" and "test"). The `x_data.txt`, `y_data.txt`, `subject_data.txt` must be linked by row, and after that, all three must be linked by column.

2. Extract only the measurements from the mean and standard deviation of each measurement.
For the column of `x_data.txt`, extract only the ones that have mean() or std() in their names, compare them with `feature.txt`.

3. Use descriptive activity names to name the activities in the data set.
Match each number in the `y_data` column with `activity_labels.txt`.

4. Appropriately label the data set with descriptive names of the variables.
Rename the column from `y_data` and` subject_data`, instead of using the default name given by R.

5. From the dataset in step 4, create a second dataset that is ordered and independent with the average of each variable for each activity and each theme.
Write the ordered dataset in `tidydataset.txt'. 

# Description of data in final order
The final ordered data is produced within `run_analysis.R`, which I simply called `singleDataSet` and `data2`. 

- `singleDataSet` is the sorted information produced after going through the first 4 steps of the course project. It contains 10,299 observations and 68 variables.
- The first column refers to each subject who did the experiment.
- Columns 2 ~ 67 are the feature variables (mean and std of all feature variables).
- The last column refers to the activity the subjects were performing, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
- `data2` is the ordered data produced after going through the 5 steps of the course project. It contains 180 observations and 68 variables. Where the first column is the identification of the subject, the second column is the activity and the rest are the average of each characteristic variable. 
