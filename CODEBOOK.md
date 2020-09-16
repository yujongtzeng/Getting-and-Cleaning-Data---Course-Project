This code book summarizes the meaning of columns in tidy_dataset.txt. 
The columns are grouped into two categories -- identifiers (2 columns) and measurement (66 columns)

## identifiers
* subject - The ID of the test object
* activity - The activity performed

## Measurement 
The measurements extracts only the measurements on the mean and standard deviation from the original dataset. 
Their detailed descriptions can be found in the 'features.txt' file in the original dataset. 

The list of measurement variables:
* tBodyAccMean-X 
* tBodyAccMean-Y 
* tBodyAccMean-Z 
* tBodyAccStd-X 
* tBodyAccStd-Y 
* tBodyAccStd-Z 
* tGravityAccMean-X 
* tGravityAccMean-Y 
* tGravityAccMean-Z 
* tGravityAccStd-X 
* tGravityAccStd-Y 
* tGravityAccStd-Z 
* tBodyAccJerkMean-X 
* tBodyAccJerkMean-Y 
* tBodyAccJerkMean-Z 
* tBodyAccJerkStd-X 
* tBodyAccJerkStd-Y 
* tBodyAccJerkStd-Z 
* tBodyGyroMean-X 
* tBodyGyroMean-Y 
* tBodyGyroMean-Z 
* tBodyGyroStd-X 
* tBodyGyroStd-Y 
* tBodyGyroStd-Z 
* tBodyGyroJerkMean-X 
* tBodyGyroJerkMean-Y 
* tBodyGyroJerkMean-Z 
* tBodyGyroJerkStd-X 
* tBodyGyroJerkStd-Y 
* tBodyGyroJerkStd-Z 
* tBodyAccMagMean 
* tBodyAccMagStd 
* tGravityAccMagMean 
* tGravityAccMagStd 
* tBodyAccJerkMagMean 
* tBodyAccJerkMagStd 
* tBodyGyroMagMean 
* tBodyGyroMagStd 
* tBodyGyroJerkMagMean 
* tBodyGyroJerkMagStd 
* fBodyAccMean-X 
* fBodyAccMean-Y 
* fBodyAccMean-Z 
* fBodyAccStd-X 
* fBodyAccStd-Y 
* fBodyAccStd-Z 
* fBodyAccJerkMean-X 
* fBodyAccJerkMean-Y 
* fBodyAccJerkMean-Z 
* fBodyAccJerkStd-X 
* fBodyAccJerkStd-Y 
* fBodyAccJerkStd-Z 
* fBodyGyroMean-X 
* fBodyGyroMean-Y 
* fBodyGyroMean-Z 
* fBodyGyroStd-X 
* fBodyGyroStd-Y 
* fBodyGyroStd-Z 
* fBodyAccMagMean 
* fBodyAccMagStd 
* fBodyBodyAccJerkMagMean 
* fBodyBodyAccJerkMagStd 
* fBodyBodyGyroMagMean 
* fBodyBodyGyroMagStd 
* fBodyBodyGyroJerkMagMean 
* fBodyBodyGyroJerkMagStd

## Modifications from the original dataset

1. Training set and test set are merged into one set
2. Two new columns --activity  and subject -- are added to the measurement data(X) as type factors. 
3. Only the mean and std data are extracted from the measurements. 
4. The resulting table from 1-3 is grouped by activity and subjects and the mean of each measurement are computed. 