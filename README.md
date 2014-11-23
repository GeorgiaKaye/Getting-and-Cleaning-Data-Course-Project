Getting-and-Cleaning-Data-Course-Project
========================================

How the script works:
To create a tidy data set from the data collected from the accelerometers from the Samsung Galaxy S smartphone

1. The data is loaded in two seperate tables - the x_train data and the y_test data
2. These data frames are merged to create one data set.
3. The mean and standard deviation for each measurement is calculated and forms a new data table
4. the subject and activity labels are binded to this data
5. Descriptive activity names are matched to appropriately lable the data set 
6. A tidy data set is created from the means of of each variable for each activity and each subject


Code Book:
"subject" - whether the data came from the train or test data.
"activity" - Each person performed six activities wearing a smartphone
  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
"Mean" - The average of the sensor acceleration signal for a particular subject and activity
"StDev" - The Standard deviation of the acceleration signals for a particular subject and activity
