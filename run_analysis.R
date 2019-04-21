
library(dplyr)

##Part1
setwd("")

#getting training data
training1 = read.table("./UCI HAR Dataset/train/subject_train.txt")
training2 = read.table("./UCI HAR Dataset/train/X_train.txt")
training3 = read.table("./UCI HAR Dataset/train/y_train.txt")

#getting test dataset
testing1 = read.table("./UCI HAR Dataset/test/subject_test.txt")
testing2 = read.table("./UCI HAR Dataset/test/X_test.txt")
testing3 = read.table("./UCI HAR Dataset/test/y_test.txt")
#combining testing and training dataset components
testing = cbind(testing1, testing2, testing3)
training = cbind(training1, training2, training3)

#labelling data type
training$type = "train"
testing$type = "test"
#combining training and testing data
full_data = rbind(testing, training)


##Part2
#Getting feature data
features = read.table("./UCI HAR Dataset/features.txt")
#feature subsets of interest
extract = grep("mean()|std()", features$V2)
#features columns of interest
extract

length(extract)
#subject, x columns of interest, y variable
extract_mod = c(1, extract+1, ncol(full_data)-1)

#data of the columns of interest
extracted_data = full_data[, extract_mod]

##Part3

#activity labels
activity_label = read.table("./UCI HAR Dataset/activity_labels.txt")
#changes activity names
names(activity_label) = c("key", "activity_type")

#merge data by the key 1-6
extracted_data2 = merge(extracted_data, activity_label, by.x="V1.2", by.y ="key")

##Part4

#feature names
feature_names = features[extract, 2]
feature_names2 = as.character(feature_names)

column_names = c("key", "test_subject", feature_names2, "activity_type")
names(extracted_data2) = column_names
##Part5
tidy_data = extracted_data2 %>%
  group_by(test_subject, activity_type) %>%
  summarise_all(funs(mean))

#Change names to be more descriptive
names_prep = paste("Average of", names(tidy_data[ , -c(1,2,3)]))

#full name set
names_col = c("test_subject", "activity_type", "key", names_prep)

#changing the names
names(tidy_data) = names_col

write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE )
