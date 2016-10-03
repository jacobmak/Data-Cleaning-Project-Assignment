## Preparation

## 1. Clean all previous records
rm(list=ls(all=TRUE))

## 2. Download File
download.file(url ="http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip",destfile = "dataset.zip")

## 3. Unzip File
unzip<-unzip("dataset.zip", list = TRUE)

## 4. Load Data
xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
features <- read.table('./data/UCI HAR Dataset/features.txt')
activitylables <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

## A. Merge Training & Test Sets Into One Data Set

traindata <- cbind(subjecttrain, ytrain, xtrain)
testdata <- cbind(subjecttest, ytest, xtest)
onedata <- rbind(traindata, testdata)

## B. Extract only the measurements on the mean and standard deviation for each measurement.

featuremsd <- grep(("mean\\(\\)|std\\(\\)"), features)
msd <- onedata[, c(1, 2, featuremsd+2)]
colnames(msd) <- c("subject", "activity", features[featuremsd])

## C. Uses descriptive activity names to name the activities in the data set

msd$activity <- factor(msd$activity,  levels = activitylables[,1], labels = activitylables[,2])

## D. Appropriately labels the data set with descriptive variable names

names(msd) <- gsub("\\()", "", names(msd))
names(msd) <- gsub("^t", "time", names(msd))
names(msd) <- gsub("^f", "frequence", names(msd))
names(msd) <- gsub("-mean", "Mean", names(msd))
names(msd) <- gsub("-std", "Std", names(msd))

## E. Creates an independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
groupdata <- msd %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

write.table(groupdata, "Meandata.txt", row.names = FALSE)






