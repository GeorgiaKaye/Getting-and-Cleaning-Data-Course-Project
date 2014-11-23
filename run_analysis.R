##Load data from both sources
x_train <- read.table("X_train.txt")
x_test <- read.table("X_test.txt")

##Merges the training and the test sets to create one data set.
all_data <- rbind(x_train,x_test)
all_data <- data.matrix(all_data, rownames.force = NA)

##Extracts only the measurements on the mean and standard deviation for each measurement. 
library(matrixStats)
StDev <- rowSds(all_data)
Mean<- rowMeans(all_data)
MS<- data.frame(Mean,StDev)

##Uses descriptive activity names to name the activities in the data set
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")

Y <- rbind(y_train,y_test)

DATA <- cbind(Y,MS)

## Puts "train" and "test" labels on data
n<-1:7352
x<-"train"
train_label<-cbind(n,x)

n<-1:2947
x<-"test"
test_label<-cbind(n,x)

labels <- rbind(train_label,test_label)
DATA <- cbind(labels,DATA)

##Appropriately labels the data set with descriptive variable names. 
  
  DATA <- arrange(DATA,V1)
                     
        DATA$V1[DATA$V1 == 1] <- "WALKING"
        DATA$V1[DATA$V1 == 2] <- "WALKING_UPSTAIRS"
        DATA$V1[DATA$V1 == 3] <- "WALKING_DOWNSTAIRS"
        DATA$V1[DATA$V1 == 4] <- "SITTING"
        DATA$V1[DATA$V1 == 5] <- "WALKING_UPSTAIRS"
        DATA$V1[DATA$V1 == 6] <- "LAYING"

##From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

library(reshape2)
DATAmelt <- melt(DATA, id = c("x", "V1"),
                      measure.vars = c("Mean" , "StDev"))
Tidy_data <- dcast(DATAmelt, x + V1 ~ variable, mean)
