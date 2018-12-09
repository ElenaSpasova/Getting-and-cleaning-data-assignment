# Getting-and-cleaning-data-assignment
This is a repo containing all the required files for the peer-graded assignment part of the "Getting and Cleaning Data" course.

My solution contains the following steps:

1. Loading the training data.
1. Loading the test data.
1. Loading the file with the names of variables.
1. Binding together the "training" with its respective "test" dataset.
1. Finding out all the variable names containing "mean" and "std".
1. Now we create a new dataset only with the variables of interest (the mean and standard deviation ones).  
1. Replacing activity indexes with descriptive wording. The descriptive values are all lowercase
1. Adding column names for "activity type" (in y_all dataset) and "participant id" (for subject_all dataset)
1. Adding column names for all mean and std variables based on the features.txt file
1. Merging together the participants, activities and measurements datasets.
1. Aggregating mean for each measurement by participant and by activity. For this purpose, the ["aggregate"](https://www.rdocumentation.org/packages/stats/versions/3.5.1/topics/aggregate) function is used. 

The repo contains the following documents: 
* run_analysis.R: the R script used to perform the transformation.
* tidy_dataset.txt: the resulting tidy dataset. 
* CodeBook.md: a Code book describing all the variables in the tidy dataset.

