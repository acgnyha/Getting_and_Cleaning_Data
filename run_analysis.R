


# Read in testing and training datasets and labels


     # Labels 

features <- read.table("features.txt")
colsubj <- c("Subject")
activitycol <- c("Activity")


    # Read in raw data

subjtrain <- read.table("~/UCI HAR Dataset/train/subject_train.txt"
                        , col.names = colsubj)
train <- read.table("~/UCI HAR Dataset/train/X_train.txt"
                    , col.names = features[,2])
train2 <- read.table("~/UCI HAR Dataset/train/y_train.txt"
                     , col.names = activitycol)

subjtest <- read.table("~/UCI HAR Dataset/test/subject_test.txt"
                       , col.names = colsubj)
test <- read.table("~/UCI HAR Dataset/test/X_test.txt"
                   , col.names = features[,2])
test2 <- read.table("~/UCI HAR Dataset/test/y_test.txt"
                    , col.names = activitycol)

activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt")

   # Create full subject and activity files from training and test data

subject <- rbind(subjtrain, subjtest)

activitydata <- rbind(train2, test2)

   # Step 1. Merge training and test data into one file 
   # Step 2. Limit to means and std 

analyticset1 <- rbind(train, test)

testtext <- c("mean","std", "Mean")

meanSTDonly<- analyticset1[,grepl(paste(testtext, collapse = "|"), colnames(analyticset1))] 

        # REF: Solution from: http://stackoverflow.com/questions/12837462/how-to-subset-data-with-advance-string-matching

   # Step 3. Attach descriptive activity names to name the activities in the data set

activitydata$Activity <- factor(activitydata$Activity, levels = 1:6, labels = activity_labels[,2])

   # Step 4. Merge subject and activity onto mean and std data 

analyticset <- cbind(subject,activitydata,meanSTDonly)

        
   # Step 5. Creates a second, independent tidy data set with the average of each variable for each activity  
   #         and each subject.

library(dplyr)
group_by_id_activity <- group_by(analyticset, Subject, Activity)

tidymeanset <- summarise_each(group_by_id_activity, funs(mean))

        # REF: Solution from: https://class.coursera.org/getdata-015/forum/thread?thread_id=26#comment-321

# Output to txt file for submission
#write.table(tidymeanset, file = "~/tidymeanset.txt", row.name = FALSE)
