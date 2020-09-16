## Let Rstudio to set working directory to the location of the file
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## A function to read train/test/subject files into matrices 
readfile <- function(filename) {
    ## load file to a vector of characters
    con = file(filename)
    lines <- readLines(con)
    close(con)
    ## split the lines by space and trim the spaces in the beginning and the end
    t <- sapply(lines, function(x) strsplit(trimws(x), "\\s+"))
    ## convert to a matrix
    mat <- sapply(t, as.numeric)  
    return(mat)
}

## read test/train/subject files 
## Transpose X_train and X_test to let each row be a sample
mat_X_train <- t(readfile('./UCI HAR Dataset/train/X_train.txt'))
y_train <- readfile('./UCI HAR Dataset/train/y_train.txt')
s_train <- readfile('./UCI HAR Dataset/train/subject_train.txt')
mat_X_test <- t(readfile('./UCI HAR Dataset/test/X_test.txt'))
y_test <- readfile('./UCI HAR Dataset/test/y_test.txt')
s_test <- readfile('./UCI HAR Dataset/test/subject_test.txt')

## load features and find a vector which indicated whether 
## the feature name includes 'mean' or 'std' but not 'meanFreq'
featurefile <- './UCI HAR Dataset/features.txt'
con = file(featurefile)
features <- readLines(con)
close(con)
meanOrStd <- grepl('mean|std', features)
freq <- grepl("Freq", features)
## the result is a boolean vector 
meanOrStd <- meanOrStd & !freq

## combine and filter training, testing sets and subject into a single data frame
mat_X <- rbind(mat_X_train[, meanOrStd], mat_X_test[, meanOrStd])
y <- c(y_train, y_test)
s <- c(s_train, s_test)
mat <- cbind(mat_X, y, s)
df <- data.frame(mat)

## Modify the column names to remove numbers, -, space, (), 
## capitalize the first letter of mean and std
colnames <- sapply(features[meanOrStd], function(x) gsub("^[0-9]+\\s",  "", x))
names(colnames) <- NULL
colnames <- gsub("-mean\\(\\)", "Mean", colnames)
colnames <- gsub("-std\\(\\)", "Std", colnames)
colnames(df) <- c(colnames, 'activity', 'subject')

## change activity and subject columns to factors
act_levels <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')
activities <- act_levels[y]
df$activity <- factor(activities, levels =  act_levels)
df$subject <- as.factor(df$subject)

## Reshape the data by melt and dcast 
library('reshape2')
dfMelt <- melt(df, id = c('subject', 'activity'), measure.vars = colnames(df)[1:66])
avgTable<- dcast(dfMelt, subject + activity ~ variable, mean)

# output to file
write.table(avgTable, "tidy_dataset.txt",  row.names = FALSE, quote = FALSE)




