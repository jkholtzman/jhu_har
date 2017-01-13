# run_analysis.R

library(data.table)
library(Hmisc)
library(readr)
library(dplyr)

setwd('~/Dropbox/data_science_jhu/03-getting_cleaning_data/programming assignment')
data_dir <- 'UCI HAR Dataset'

all_activities <- c('WALKING'=1, 'WALKING_UPSTAIRS'=2, 'WALKING_DOWNSTAIRS'=3, 'SITTING'=4,
                    'STANDING'=5, 'LAYING'=6)

load_data <- function(data_dir, data_type) {
    # load subjects
    fn <- sprintf('%s/%s/subject_%s.txt', data_dir, data_type, data_type)
    subjects <- read.csv(fn, header=F)
    
    # load activities and convert to factor
    fn <- sprintf('%s/%s/y_%s.txt', data_dir, data_type, data_type)
    activities <- read.csv(fn, header=F)
    activities <- factor(activities$V1)
    levels(activities) <- names(all_activities)
    
    # load features
    fn <- sprintf('%s/%s/X_%s.txt', data_dir, data_type, data_type)
    features <- read_table(fn, col_names=F)
    
    # combine and return
    dt <- data.table(subjects, activities, features)
    dt
}

# load all data
test_data <- load_data(data_dir, 'test')
train_data <- load_data(data_dir, 'train')
all_data <- rbind(test_data, train_data)

# load features and set column names
fn <- sprintf('%s/features.txt', data_dir)
col_names <- read.csv(fn, sep=' ', header=F)
col_names <- col_names[,2]
col_names <- c('Subject', 'Activity', as.character(col_names))
col_names <- make.names(col_names, unique=T) # strip illegal characters and make names unique
colnames(all_data) <- col_names

# extract desired columns and transform to tidy format
mm <- select(all_data, Subject, Activity, contains('mean'), contains('std'))
mmm <- melt(mm, id=c('Subject', 'Activity'))

# compute average of each variable for each activity and each subject
dc <- dcast(mmm, Subject + Activity ~ ..., mean)

# save to file
write.table(dc, 'har_feature_means.csv', sep=',', row.names=F)
