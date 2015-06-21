# getdata_project

This script takes in raw data from UCI HAR Dataset directory and outputs a tidy dataset with the averages of mean and standart deviation variables for each activity and each subject.

Script does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set. Names are taken from activity_labels.txt
- Appropriately labels the data set with descriptive variable names from features.txt
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Dataset is saved as getdata_proj.txt
