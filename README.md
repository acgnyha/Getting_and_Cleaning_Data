## Getting and Cleaning Data Course Project
---
### Data 

A full description of the data used for the assignment can be found here:
	[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
The included "Original README.txt" and "Original features_info.txt" provides additional data and measure specifications on the original source data obtained from the link above. 

Data was accessed on June 3, 2015: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

#### Description

Smartphone data was collected on 30 volunteers to track activity processing. Activities tracked were walking, walking upstairs, walking downstairs, sitting, standing and laying while wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The data was been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### The Tidy Dataset

The final "tidy" dataset or analytic dataset was created by combining the training and testing datasets and adding activity labels. Measures were limited to the mean and standard deviation measures. For each subject, the value presented is the mean of the mean and standard deviation measures for each activity. 

Following tidy data principles, the data is set in the wide format where: 

1. Each variable forms a column. *Each column represents the mean or standard deviation for a measure with columns identifying the subject and activity.*
2. Each observation forms a row. *Each observation is identified by a subject and activity.*
3. Each type of observational unit forms a table. *The data could be evaluated by subject (i.e. results for across activities for a subject) or by activity (i.e. results for all subjects for a given activity).*

### Code: run_analysis.R

NOTE: In order to have correct file references, the raw source data should be saved in a folder called 'UCI HAR Dataset' in your R work directory.

The code is organized as follows:

1. Labels are read in.
2. Raw data is read in.
3. A full dataset for the subject data and a full dataset for the activity data are created from the training and test data.
4. Training and test data is merged into one file (**step one** of the assignment).
5. The data is limited to the means and standard deviation measures by using a string search to determine those columns containing the strings "mean", "std" and "Mean" (**step two** of the assignment). (Reference to code used in this section: [http://stackoverflow.com/questions/12837462/how-to-subset-data-with-advance-string-matching])
6. Attach descriptive names of activities (**step three** of the assignment).
7. Subject and activity data is merged onto the mean and standard deviation data (**step four** of the assignment).
8. Create a second, independent tidy dataset with the mean of each mean and standard deviation measure for each subject for each activity (**step five** of the assignment).
9. There is a commented out section of code that outputs the tidy dataset to a text file.

#### Measures

- Subject 
-- Assigned a number from 1 to 30

-Activity
-- Possible values for activity:
     - WALKING           
     - WALKING_UPSTAIRS  
     - WALKING_DOWNSTAIRS     
     - SITTING           
     - STANDING          
     - LAYING   

- Signals
-- The measures collected. Those labeled XYZ include 3 additional measurements where each measure is collected for the X-axis, Y-axis and Z-axis. 

	- tBodyAcc-XYZ
	- tGravityAcc-XYZ
	- tBodyAccJerk-XYZ
	- tBodyGyro-XYZ
	- tBodyGyroJerk-XYZ
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAcc-XYZ
	- fBodyAccJerk-XYZ
	- fBodyGyro-XYZ
	- fBodyAccMag
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag

- Measures  

	- Measures collected for each Signal in the list above.
	- mean
	- std
	- meanFreq -  Weighted average of the frequency components to obtain a mean frequency

- Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

	- angle.tBodyAccMean.gravity.
	- angle.tBodyAccJerkMean..gravityMean.
	- angle.tBodyGyroMean.gravityMean.
	- angle.tBodyGyroJerkMean.gravityMean.
	- angle.X.gravityMean.
	- angle.Y.gravityMean.
	- angle.Z.gravityMean.

- The full measure list and specifications can be found in the "CODEBOOK.MD" provided.

