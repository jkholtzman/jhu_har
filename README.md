# Introduction

An experiment was performed on 30 human subjects, capturing data from accelerometers and gyroscopes embedded in smartphones. The purpose was to see if a machine learning algorithm could determine the activity being performed by the subject, one of: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING.

Data was captured from each of three axes at a rate of 50 Hz (i.e., a reading every 20 ms). The raw sensor signals were filtered and grouped into 2.56 second windows, and a set of 561 features was computed, across both test and training data sets. Features come from both the time (t) and frequency (f) domains and are marked accordingly with a prefix character in the code book. Features values are normalized to a range of [-1, 1].

The purpose of this exercise is to extract the mean and standard deviation of several features across all three axes, and combine test and training sets into a single tidy set suitable for statistical analysis. Then generate a summary data set showing average values for each activity and subject, across all features.

## Data storage

The main data folder is 'UCI HAR Dataset'. It contains test and train folders. Each of those contains three data files, plus a subdirectory of low-level signals, not of interest here. The files are as follows.

    subject: a list of subjects, one for each data point
    X: each line represents the complete set of 561 features
    y: the activity id (1-6) for each data point

The actual file names have '_test.txt' or '_train.txt' suffixed to the base name listed above. The test set has 2947 lines of data, and the train set has 7352 lines, for a total of 10,299. Reading the data files is simplified by the fact that they are in a fixed 16-character window for each feature.

## Data processing

We want to end up with a tidy data set, where each row represents a subject, an activity, and a feature. The rough approach is as follows (see run_analysis.R for details):

- Read in the test subject file, the test X file, the test y file, and join (cbind) them together.
- Read in the same files for the train set and join (rbind) to the test set.
- Substitute activity names for activity IDs. 
- Label the columns.
- Extract the columns of interest, including the subject ID, activity, and the features of interest.
- Tranform (melt) the wide table into a tall table, with one feature value per line.
- Create (dcast) a second, independent table with the average of each feature for each activity and each subject. This table is grouped by Subject, followed by Activity, then the features. Thus, the first six rows are the 6 Activity and 86 feature values for Subject 1, the next 6 for Subject 2, and so on.

The data file is 'har_feature_means.csv'. It can be read in to R using the following:

    x <- read.csv('har_feature_means.csv')

## Performance notes

The initial version of the load_data routine used read.fwf, which caused load times in minutes for the two data files. I experimented with trying to optimize read.fwf by giving it a larger read buffer and specifying the number of lines to read, but with no improvement. Then I converted to use read_table from the readr package by Hadley Wickham, and read time dropped to about 1 second for both files.

### Initial version

    > system.time(load_data(data_dir, 'test'))
    user  system elapsed 
    60.943  17.862  84.220 
    > system.time(load_data(data_dir, 'train'))
    user  system elapsed 
    156.490  31.797 192.972 

### Final version using read_table

    > system.time(load_data(data_dir, 'train'))
    cols(
        .default = col_double()
    )
    user  system elapsed 
    0.930   0.050   0.984 

## For further information...
 [UCI Source for data sets] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 [Youtube video demonstrating activities measured] (https://www.youtube.com/watch?v=XOEN9W05_4A)
 [Link to published paper] (http://www.jucs.org/jucs_19_9/energy_efficient_smartphone_based/jucs_19_09_1295_1314_anguita.pdf)
