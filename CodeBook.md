# Getting and Cleaning Data Course Project_Code Book

## Analysis Method and Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Steps of this Study
Step1: Remove all current data in the workspace, and set the working directory where the data files exist;

Step2: Read and run these files;

Step3: Create one R script called run_analysis.R that does the following: 

- Merges the training and the test sets to create one data set;
- Extracts only the measurements on the mean and standard deviation for each measurement;
- Uses descriptive activity names to name the activities in the data set;
- Appropriately labels the data set with descriptive variable names; 
- Creates a tidy data set from data in step 4 with the average of variables for each activity and subject.

Step4: Read the tidy data set produced from the code using read.table("activitydata.txt");

Step5: Make a link to a Github repository with the script for performing the analysis; 

Step6: Create a code book that describes the variables, data, and transformations that performed to clean up   
       the data; 
   
Step7: Explain this repo how all of the scripts work and how they are connected at README.md.

## Information about the Raw Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

- subject_test.txt: participant number (1-30) for the test data
- y_test.txt:activity number (1-6) for the test data
- x_test.txt: vector information (1-531) for the test data
 
- subject_training.txt: participant number (1-30) for the training data
- y_training.txt: activity number (1-6) for the training data
- x_trainingt.txt: vector information (1-531) for the training data
 
- features.txt: descriptive names of activities

## Transformations (R Script)

Firstly, load data and label into R. The vector measurement column names were renamed according to the features text file. These names were cleaned up by removed unneccessary brackets.The identifier column names were given more appropriate labels such as "activity" and "participant". 

Create a summarising data frame that gives only the mean and standard deviation. Merge the test and train data sets together into a single data frame, and filtered by searching the column names for "std" and "mean". These filtered columns were combined with the identifier columns to create a new data frame.

The numeric labels for activities were converted to descriptive ones Use "mapvalues" function and activity_labels text file. Tidy up file by changing the characters to lower case and replacing underscores with spaces.

Create the tidy data frame using the "aggretate"" function with the mean of each variable for each activity and subject. As a result,write the tidy data frame to a file called "activitydata.txt" in the working directory.

## Data and Variables

Participant - the participant number (1-30)

Activity - the activity description

The activities in the data set "activity_labels.txt:

- walking

- walkingupstairs

- walkingdownstairs

- sitting

- standing

- laying

The names of the attributes are similar as follows:

- tbodyacc-mean-x 

- tbodyacc-mean-y 

- tbodyacc-mean-z 

- tbodyacc-std-x 

- tbodyacc-std-y 

- tbodyacc-std-z 

- tgravityacc-mean-x 

- tgravityacc-mean-y

