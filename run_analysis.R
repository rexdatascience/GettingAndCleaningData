#Script does the following
#1. Merges the training and test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set.
#4. Appropriately labels the data set with descriptive variable names
#5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

#load the libraries
library(dplyr)
library(data.table)
library(reshape2)

#1. Merge the training and test sets to create one data set
#read in the features list
features <- read.table("./features.txt", stringsAsFactors = FALSE)[,2]

#read training set and combine into 1 table
X_train <- read.table("./train/X_train.txt")
names(X_train) <- features
Y_train <- read.table("./train/y_train.txt")
names(Y_train) <- "Activity_ID"
subject_train <- read.table("./train/subject_train.txt")
names(subject_train) <- "Subject"
train_dt <- cbind(subject_train,Y_train,X_train)

#read test set and combine into 1 table
X_test <- read.table("./test/X_test.txt")
names(X_test) <- features
Y_test <- read.table("./test//y_test.txt")
names(Y_test) <- "Activity_ID"
subject_test <- read.table("./test//subject_test.txt")
names(subject_test) <- "Subject"
test_dt <- cbind(subject_test,Y_test,X_test)

#merge training and test sets into 1 dataset
data <- rbind(train_dt,test_dt)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_data <- data[,c("Subject","Activity_ID", grep("mean\\(\\)|std\\(\\)",names(data), value=TRUE))]

#3.Uses descriptive activity names to name the activities in the data set.
activities_labels <- read.table("./activity_labels.txt")
names(activities_labels) <- c("Activity_ID", "Activity")
mean_std_data <- left_join(mean_std_data,activities_labels)

set(mean_std_data, j="Activity_ID", value = NULL) #remove "Activity_ID" column since we no longer need it

#4. Appropriately labels the data set with descriptive variable names
names(mean_std_data) <- gsub("^t", "Time-domain-", names(mean_std_data))
names(mean_std_data) <- gsub("^f", "Frequency-domain-", names(mean_std_data))
names(mean_std_data) <- gsub("Mag","-Magnitude", names(mean_std_data))
names(mean_std_data) <- gsub("mean\\(\\)","Mean", names(mean_std_data))
names(mean_std_data) <- gsub("std\\(\\)","StdDev", names(mean_std_data))
names(mean_std_data) <- gsub("BodyBody", "Body", names(mean_std_data)) #correct typo "BodyBody" in the column name


#5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
data_melt <- melt(mean_std_data,id=c("Subject","Activity"))
tidy_data <- dcast(data_melt,Subject+Activity ~ variable, mean)

#re-label the columns
names(tidy_data)[-c(1,2)] <- paste("Avg-for-",sep="",names(tidy_data)[-c(1,2)])

#write to text file "tidy_data.txt"
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)