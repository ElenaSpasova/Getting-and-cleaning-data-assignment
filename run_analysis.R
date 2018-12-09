# Loading the training data: 
y_train<-read.table("C:/Users/Lenovo/Dropbox/Data Science Specialization/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
x_train<-read.table("C:/Users/Lenovo/Dropbox/Data Science Specialization/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
subject_train<-read.table("C:/Users/Lenovo/Dropbox/Data Science Specialization/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

#Loading the test data: 
y_test<-read.table("C:/Users/Lenovo/Dropbox/Data Science Specialization/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
x_test<-read.table("C:/Users/Lenovo/Dropbox/Data Science Specialization/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
subject_test<-read.table("C:/Users/Lenovo/Dropbox/Data Science Specialization/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

#Loading the file with the names of variables:
features<-read.table("C:/Users/Lenovo/Dropbox/Data Science Specialization/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt")

#Binding together the "training" with its respective "test" dataset.
y_all<-rbind(y_train, y_test)
x_all<-rbind(x_train, x_test)
subject_all<-rbind(subject_train, subject_test)

#Finding out all the variable names containing "mean" and "std".
features_mean_std<-grep("mean|std", features [, 2])

#Now we create a new dataset only with the variables of interest (the mean and standard deviation ones).  
x_all_refined<-x_all[, features_mean_std]

#Replacing activity indexes with descriptive wording. The descriptive values are all lowercase
y_all[,1]<-gsub("1", "walking", y_all[ , 1])
y_all[,1]<-gsub("2", "walking_upstairs", y_all[ , 1])
y_all[,1]<-gsub("3", "walking_downstairs", y_all[ , 1])
y_all[,1]<-gsub("4", "sitting", y_all[ , 1])
y_all[,1]<-gsub("5", "standing", y_all[ , 1])
y_all[,1]<-gsub("6", "laying", y_all[ , 1])


#Adding column names for activity type (in y_all) and participant id (for subject_all)
names(y_all)<-"Activity_type"
names(subject_all)<-"Participant_ID"

#Adding column names for all mean and std variables based on the features.txt file
names(x_all_refined)<-features[features_mean_std, 2]

# Merging together the participants, activities and measurements datasets.
merged_dataset<-cbind(subject_all, y_all, x_all_refined)

# Aggregating mean for each measurement by participant and by activity
tidy_dataset <- aggregate(merged_dataset[, -(1:2)], list(participant_ID = merged_dataset$Participant_ID, activity_type = merged_dataset$Activity_type), mean)

