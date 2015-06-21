columnnames <- read.table("UCI HAR Dataset/features.txt")
columnnames <- columnnames[,2]

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = columnnames)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
train <- cbind(subject_train, y_train, X_train)

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = columnnames)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
test <- cbind(subject_test, y_test, X_test)

merged <- rbind(test, train)

cols <- grep("(Subject)|(Activity)|(mean)|(std)", names(merged))
merged <- merged[cols]

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
merged[,2] <- activity_labels[merged[,2],2]

data_final <- aggregate(merged[3:81], by=list(merged$Subject, merged$Activity), mean)
names(data_final)[1:2] <- c("Subject", "Activity")
data_final <- data_final[ order(data_final[,1], data_final[,2]), ]

write.table(data_final, file="getdata_proj.txt", row.name=FALSE)