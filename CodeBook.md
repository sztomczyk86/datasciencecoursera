==================================================================
    Getting and Cleaning Data Course Project by Szymon Tomczyk
                               using
      Human Activity Recognition Using Smartphones Dataset
==================================================================

The orignal data was split into two separate datasets "train" and "test" with 
separate files providing information about the subject and the measured activity
for each of them. 

The run_analysis.R scrip reads both datasets using "features.txt" file to 
provide column names. combines them with corresponding subject ID and activity 
ID, adds a column with the group ID and merges them in one data frame. 

Subsequently, the descriptive activity names are added based on the activity 
code. Only the columns with subject, group and activity information as well 
as columns containing averages and standard deviations of the variables 
("std()" and "mean()") are slelected for the summary. 

In the last step the data is grouped by subject and activity and the mean value 
for the other 66 variables is calculated.

The tidy processed data is then saved in a new text file called UCI_HAR_tidy.txt

The variable names were kept from original "features.txt" with following 
changes: removed "()" and replaced "-" with "_". For the exact desciption of
the variables refer to the "features_info.txt" from the original data-set.




