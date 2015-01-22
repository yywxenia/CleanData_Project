
##===========================================================================
# Remove current data in the workspace, and set the working directory at where the data files exist
rm(list=ls())
setwd("C:/Users/elva.yan/Documents/Training/Coursera/Cleaning Data")

##---------------------------------------------------------------------------
# use package "plyr"
library(plyr)

##---------------------------------------------------------------------------
# Read the raw data
t1<- read.table("UCIHAR/UCI HAR Dataset/test/X_test.txt")
t2 <- read.table("UCIHAR/UCI HAR Dataset/test/Y_test.txt")
t3 <- read.table("UCIHAR/UCI HAR Dataset/test/subject_test.txt")

tr1 <- read.table("UCIHAR/UCI HAR Dataset/train/X_train.txt")
tr2 <- read.table("UCIHAR/UCI HAR Dataset/train/Y_train.txt")
tr3 <- read.table("UCIHAR/UCI HAR Dataset/train/subject_train.txt")

label <- read.table("UCIHAR/UCI HAR Dataset/activity_labels.txt")
feature <- read.table("UCIHAR/UCI HAR Dataset/features.txt")

##---------------------------------------------------------------------------
# clean up labels
feature <- gsub("\\()", "", feature$V2)

label <- label$V2
label <- tolower(label)
label <- sub("_", " ", label)

##---------------------------------------------------------------------------
# Rename the label 
names(t1) <- feature; names(tr1) <- feature
names(t2) <- "activity"; names(tr2) <- "activity"
names(t3) <- "participant"; names(tr3) <- "participant"

##---------------------------------------------------------------------------
# Bind the test data and train data, pick up columns with mean/standard deviation, 
# and create a new bind dataframe that holds only identifiers
com <- rbind(t1, tr1)

criteria <- grep("mean|std", names(com))
 
comT <- data.frame(t2, t3)
comTr <- data.frame(tr2, tr3)
NewCom <- rbind(comT, comTr)
for (each in criteria){
  NewCom<- cbind(NewCom, com[each])
}
NewCom$activity <- mapvalues(NewCom$activity, 
                             from = levels(factor(NewCom$activity)), 
                             to = label)

##---------------------------------------------------------------------------
# Create tidy dataframe that with the mean of each variable for each activity and subject
Tidy <- aggregate(NewCom, list(NewCom$participant, NewCom$activity), mean)
Tidy$participant <- NULL; Tidy$activity <- NULL
names(Tidy)[1] <- "participant"; names(Tidy)[2] <- "activity"

##---------------------------------------------------------------------------
# write out the dataframeb named "NewDataSet"
write.table(file = "NewDataSet.txt", x = Tidy, row.names = FALSE)

