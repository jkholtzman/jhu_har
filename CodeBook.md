## Codebook for Programming Assignment: Human Activity Recognition Using Smartphones Data

A complete list of the 561 features computed is available in the file features.txt in the data directory ('UCI HAR Dataset').

For this exercise, a subset of the features was examined, those concerned with either mean or standard deviation of the various quantities. Many variables take the form:

    1 tBodyAcc-mean()-X
    4 tBodyAcc-std()-X

But some have the mean displayed in another type of format, eg:

    561 angle(Z,gravityMean)

Because the assignment was ambiguous about which to include, I decided for this analaysis to include all features containing 'mean' in any format.

The names as supplied by the research team produced invalid names for R, so the name list was passed through R's make.names function, yielding the following 88 variables. The first two variables identify the subject and activity associated with a particular feature type in the dataset; the remainder are the feature variables.

*Note about units*: The feature values supplied by the research team did not include units (e.g., m/s^2 for acceleration). Instead all feature values were normalized to a range of [-1, 1].

     [1] "Subject"                              "Activity"                            
     [3] "tBodyAcc.mean...X"                    "tBodyAcc.mean...Y"                   
     [5] "tBodyAcc.mean...Z"                    "tGravityAcc.mean...X"                
     [7] "tGravityAcc.mean...Y"                 "tGravityAcc.mean...Z"                
     [9] "tBodyAccJerk.mean...X"                "tBodyAccJerk.mean...Y"               
    [11] "tBodyAccJerk.mean...Z"                "tBodyGyro.mean...X"                  
    [13] "tBodyGyro.mean...Y"                   "tBodyGyro.mean...Z"                  
    [15] "tBodyGyroJerk.mean...X"               "tBodyGyroJerk.mean...Y"              
    [17] "tBodyGyroJerk.mean...Z"               "tBodyAccMag.mean.."                  
    [19] "tGravityAccMag.mean.."                "tBodyAccJerkMag.mean.."              
    [21] "tBodyGyroMag.mean.."                  "tBodyGyroJerkMag.mean.."             
    [23] "fBodyAcc.mean...X"                    "fBodyAcc.mean...Y"                   
    [25] "fBodyAcc.mean...Z"                    "fBodyAcc.meanFreq...X"               
    [27] "fBodyAcc.meanFreq...Y"                "fBodyAcc.meanFreq...Z"               
    [29] "fBodyAccJerk.mean...X"                "fBodyAccJerk.mean...Y"               
    [31] "fBodyAccJerk.mean...Z"                "fBodyAccJerk.meanFreq...X"           
    [33] "fBodyAccJerk.meanFreq...Y"            "fBodyAccJerk.meanFreq...Z"           
    [35] "fBodyGyro.mean...X"                   "fBodyGyro.mean...Y"                  
    [37] "fBodyGyro.mean...Z"                   "fBodyGyro.meanFreq...X"              
    [39] "fBodyGyro.meanFreq...Y"               "fBodyGyro.meanFreq...Z"              
    [41] "fBodyAccMag.mean.."                   "fBodyAccMag.meanFreq.."              
    [43] "fBodyBodyAccJerkMag.mean.."           "fBodyBodyAccJerkMag.meanFreq.."      
    [45] "fBodyBodyGyroMag.mean.."              "fBodyBodyGyroMag.meanFreq.."         
    [47] "fBodyBodyGyroJerkMag.mean.."          "fBodyBodyGyroJerkMag.meanFreq.."     
    [49] "angle.tBodyAccMean.gravity."          "angle.tBodyAccJerkMean..gravityMean."
    [51] "angle.tBodyGyroMean.gravityMean."     "angle.tBodyGyroJerkMean.gravityMean."
    [53] "angle.X.gravityMean."                 "angle.Y.gravityMean."                
    [55] "angle.Z.gravityMean."                 "tBodyAcc.std...X"                    
    [57] "tBodyAcc.std...Y"                     "tBodyAcc.std...Z"                    
    [59] "tGravityAcc.std...X"                  "tGravityAcc.std...Y"                 
    [61] "tGravityAcc.std...Z"                  "tBodyAccJerk.std...X"                
    [63] "tBodyAccJerk.std...Y"                 "tBodyAccJerk.std...Z"                
    [65] "tBodyGyro.std...X"                    "tBodyGyro.std...Y"                   
    [67] "tBodyGyro.std...Z"                    "tBodyGyroJerk.std...X"               
    [69] "tBodyGyroJerk.std...Y"                "tBodyGyroJerk.std...Z"               
    [71] "tBodyAccMag.std.."                    "tGravityAccMag.std.."                
    [73] "tBodyAccJerkMag.std.."                "tBodyGyroMag.std.."                  
    [75] "tBodyGyroJerkMag.std.."               "fBodyAcc.std...X"                    
    [77] "fBodyAcc.std...Y"                     "fBodyAcc.std...Z"                    
    [79] "fBodyAccJerk.std...X"                 "fBodyAccJerk.std...Y"                
    [81] "fBodyAccJerk.std...Z"                 "fBodyGyro.std...X"                   
    [83] "fBodyGyro.std...Y"                    "fBodyGyro.std...Z"                   
    [85] "fBodyAccMag.std.."                    "fBodyBodyAccJerkMag.std.."           
    [87] "fBodyBodyGyroMag.std.."               "fBodyBodyGyroJerkMag.std.."          

