Getting and Cleaning Data Course Project

Original data:
The files "X_train.txt", "y_train.txt" and "subject_train.txt" contain information about training data;
whereas "X_test.txt", "y_test.txt" and "subjuect_test.txt" contain information about testing data; and
"features.txt" contains names of all measurements.

By the use of the following functions, the orignal data are being cleaned and analyzed:
- download.file() & unzip() : to download and unzip the file from website;
- read.table() : to load "X_train.txt", "y_train", "subject_train", "X_test", "y_test", "subject_test", "features.txt", "activity_labels.txt" into R.
- rbind() and cbind() : to bind relevant rows and columns data together;
- grep() : to find the indexes with "mean()" and "sd()";
- factor() : to replace the numbers to activity names;
- gsub() : to replace symbols with relevant name;
- group_by() & summarise_each() : to calculate means for activities of relevant subjects.

How the above functions are used to analysed the data are more particularly described in the actual script contained in run.analysis.R file.
