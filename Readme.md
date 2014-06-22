# Readme

## The Raw Data

For the purposes of this cleaning script it is assumed that the zip file is already downloaded and unzipped, with the existing file names and structure, into a subdirectory of your working directory called Data.

There are 6 files we are interested in, with ‘test’ and ‘train’ data for each of the following 3 file types:
1. X – contains a data frame of all the readings. NOTE - Features are normalized and bounded within [-1,1].
2. y – contains a vector list of which activity type was being undertaken during the readings, these are:
		* Walking
		* Walking Upstairs
		* Walking Downstairs
		* Sitting
		* Standing
		* Laying
3. subject – each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## What this script does

The cleaning script works by going through the following steps:

1. Call the 'Features' file to retrieve the complete list of variables.
2. Store a vector containing the activity labels.
3. Call the 'X_test' file and naming it with the list of variables.
4. Call the 'y_test' file and naming it 'Activity'.
5. Call the 'subject_test' file and naming it 'Subject'.
6. Convert the 'y_test' file to factors and label the factors
7. Repeat steps 3-6 for the train data
8. Clear ‘factors’ and 'activity_labels' from memory
9. Subset the 'X_test' and 'X_train' data based upon column headers containing '-std' or '-mean' – but exclude 'meanFreq'  
10. Clear more variables from memory.
11. Column bind the X, y and subject data for both test and train
12. Row bind the now complete test and training data into 'merged_data'
13. Remove all variables from memory except 'merged_data'
14. Call the library (plyr)
15. Use the ddply function to return 'summary_data' which is then exported as a tab separated txt file to the working directory.


Original Data sourced from:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Ricky Tillson. June 2014.