# GCD course project code
# run_Analysis.R
# Data source is from the Human Activity Recognition Using Smartphones Dataset :
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# above data is unzipped into the working directory

# ------------------------------------------------------------------------------
# Part 1 - Merges the training and the test sets to create one data set. 
# ------------------------------------------------------------------------------
# extract training data
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", comment.char="")
train_s <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))
train_data <- cbind(train_s, train_y, train_x)

# extract test data
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", comment.char="")
test_s <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))
test_data <- cbind(test_s, test_y, test_x)

# merge the training and test data
data <- rbind(train_data, test_data)

# read features
feature_names <- read.table("UCI HAR Dataset/features.txt", col.names=c("id", "name"))
features <- c("subject", "activity", as.vector(feature_names[,"name"]))

# ------------------------------------------------------------------------------
# Part 2 - Extracts only the measurements on the mean and std for each measurement.
# ------------------------------------------------------------------------------
filtered_feature_index <- grepl("mean|std|subject|activity", features) & !grepl("meanFreq", features)
filtered_data = data[, filtered_feature_index]

# ------------------------------------------------------------------------------
# Part 3 - Uses descriptive activity names to name the activities in the data set.
# ------------------------------------------------------------------------------
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("id", "name"))
for (i in 1:nrow(activities)) {
        filtered_data$activity[filtered_data$activity == activities[i, "id"]] <- as.character(activities[i, "name"])
}

# ------------------------------------------------------------------------------
# Part 4 - Appropriately labels the data set with descriptive variable names.
# ------------------------------------------------------------------------------
filtered_names <- features[filtered_feature_ids]
filtered_names <- gsub("\\(\\)", "", filtered_names)
filtered_names <- gsub("Acc", "-acceleration", filtered_names)
filtered_names <- gsub("Mag", "-Magnitude", filtered_names)
filtered_names <- gsub("BodyBody", "Body", filtered_names)
filtered_names <- gsub("(Jerk|Gyro)", "-\\1", filtered_names)
filtered_names <- gsub("^t(.*)$", "\\1-time", filtered_names)
filtered_names <- gsub("^f(.*)$", "\\1-frequency", filtered_names)
filtered_names <- tolower(filtered_names)

# assign filtered names to features
names(filtered_data) <- filtered_names

# ------------------------------------------------------------------------------
# Part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# ------------------------------------------------------------------------------
tidy_data <- tbl_df(filtered_data) %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean)) 
        
# ------------------------------------------------------------------------------
# Part 6 - Upload data set as a txt file created with write.table() using row.name=FALSE.
# ------------------------------------------------------------------------------
# Save the data into tidy_data.txt file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)