###############################################################################
## This code is designed to read and tidy the Human Activity Recognition     ## 
## Using Smartphones Dataset                                                 ##
###############################################################################
library(dplyr)
library(tidyr)
library(stringr)
library(tibble)
library(data.table)

## Read the file with activity codes and measurement labels
code <- fread("./UCI_HAR_Dataset/activity_labels.txt", 
              col.names = c("code","activity"))

feature <- fread("./UCI_HAR_Dataset/features.txt", drop = 1)
feature <- as.vector(feature$V2)


## Read the train data and the corresponding subject and activity labels
train <- fread("./UCI_HAR_Dataset/train/X_train.txt", col.names = feature)
subject_train <- fread("./UCI_HAR_Dataset/train/subject_train.txt", 
                       col.names = "subject")
activity_train <- fread("./UCI_HAR_Dataset/train/y_train.txt", 
                        col.names = "code")

## Merge the subject ID, activity label and the data for train dataset
df_train <- bind_cols(subject_train, activity_train, train)

## add column with the the group name
df_train <- mutate(df_train, group = "train")

## Read the test data and the corresponding subject and activity labels
test <- fread("./UCI_HAR_Dataset/test/X_test.txt", col.names = feature)
subject_test <- fread("./UCI_HAR_Dataset/test/subject_test.txt", 
                       col.names = "subject")
activity_test <- fread("./UCI_HAR_Dataset/test/y_test.txt", 
                        col.names = "code")

## Merge the subject ID, activity label and the data for test dataset
df_test <- bind_cols(subject_test, activity_test, test)

## add column with the the group name
df_test <- mutate(df_test, group = "test")

## combine test and train datasets in one data frame
df_all <- bind_rows(df_test, df_train)

## add the descriptive activity label
df_all <- merge(df_all, code, by = "code")

## keep only columns with mean and standard deviations
df_select <- select(df_all, subject, group, activity, 
                    contains("mean()", ignore.case = TRUE),
                    contains("std()", ignore.case = TRUE)) %>% arrange(subject)

## Make remove brackets from column names, replace "-" with "_"
colnames(df_select) <- str_replace_all(colnames(df_select), "[(,)]", "")
colnames(df_select) <- str_replace_all(colnames(df_select), "-", "_")


## average of each variable for each activity and each subject
df_avg <- df_select %>% group_by(subject, activity, group) %>% 
        summarise_at(vars(tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std), mean) 

write.table(df_avg, file = "UCI_HAR_tidy.txt", row.names = FALSE)







