CODE BOOK FOR DATA SET

    Activity_type|: 
         Mode of motion
            WALKING
            WALKING_UPSTAIRS
            WALKING_DOWNSTAIRS
            SITTING
            STANDING
            LAYING

    Parameters:
         Mean values over each test person's measurement of parameters involving the means and standard deviations 
         of the data derived from the measured signal data for each activity type.
            tBodyAcc-mean-X         | time analysis |acceleration   |body       |mean   |X-direction
            tBodyAcc-mean-Y         |      "        |      "        |     "     |  "    |Y-direction  
            tBodyAcc-mean-Z         |      "        |      "        |     "     |  "    |Z-direction
            tBodyAcc-std-X          |      "        |      "        |     "     |std    |X-direction
            tBodyAcc-std-Y          |      "        |      "        |     "     |  "    |Y-direction
            tBodyAcc-std-Z          |      "        |      "        |     "     |  "    |Z-direction
            tGravityAcc-mean-X      |      "        |      "        |gravity    |mean   |X-direction
            tGravityAcc-mean-Y      |      "        |      "        |     "     |  "    |Y-direction
            tGravityAcc-mean-Z      |      "        |      "        |     "     |  "    |Z-direction
            tGravityAcc-std-X       |      "        |      "        |     "     |std    |X-direction
            tGravityAcc-std-Y       |      "        |      "        |     "     |  "    |Y-direction
            tGravityAcc-std-Z       |      "        |      "        |     "     |  "    |Z-direction
            tBodyAccJerk-mean-X     |      "        |      "        |body       |jerked |mean   |X-direction
            tBodyAccJerk-mean-Y     |      "        |      "        |     "     |  "    |   "   |Y-direction 
            tBodyAccJerk-mean-Z     |      "        |      "        |     "     |  "    |   "   |Z-direction
            tBodyAccJerk-std-X      |      "        |      "        |     "     |  "    |std    |X-direction
            tBodyAccJerk-std-Y      |      "        |      "        |     "     |  "    |   "   |Y-direction
            tBodyAccJerk-std-Z      |      "        |      "        |     "     |  "    |   "   |Z-direction
            tBodyGyro-mean-X        |      "        |angularVelocity|body       |mean   |X-direction
            tBodyGyro-mean-Y        |      "        |      "        |     "     |  "    |Y-direction
            tBodyGyro-mean-Z        |      "        |      "        |     "     |  "    |Z-direction
            tBodyGyro-std-X         |      "        |      "        |     "     |std    |X-direction
            tBodyGyro-std-Y         |      "        |      "        |     "     |  "    |Y-direction
            tBodyGyro-std-Z         |      "        |      "        |     "     |  "    |Z-direction
            tBodyGyroJerk-mean-X    |      "        |      "        |body       |jerked |mean   |X-direction
            tBodyGyroJerk-mean-Y    |      "        |      "        |     "     |  "    |   "   |Y-direction
            tBodyGyroJerk-mean-Z    |      "        |      "        |     "     |  "    |   "   |Z-direction 
            tBodyGyroJerk-std-X     |      "        |      "        |     "     |  "    |std    |X-direction
            tBodyGyroJerk-std-Y     |      "        |      "        |     "     |  "    |   "   |Y-direction
            tBodyGyroJerk-std-Z     |      "        |      "        |     "     |  "    |   "   |Z-direction
            tBodyAccMag-mean        |      "        |acceleration   |body       |normed |mean
            tBodyAccMag-std         |      "        |      "        |     "     |  "    |std
            tGravityAccMag-mean     |      "        |      "        |gravity    |normed |mean
            tGravityAccMag-std      |      "        |      "        |     "     |  "    |std
            tBodyAccJerkMag-mean    |      "        |      "        |body       |jerked |normed |mean
            tBodyAccJerkMag-std     |      "        |      "        |     "     |  "    |   "   |std
            tBodyGyroMag-mean       |      "        |angularVelocity|body       |normed |mean
            tBodyGyroMag-std        |      "        |      "        |     "     |  "    |std
            tBodyGyroJerkMag-mean   |      "        |      "        |     "     |jerked |normed |mean
            tBodyGyroJerkMag-std    |      "        |      "        |     "     |  "    |   "   |std
            fBodyAcc-mean-X         |Fourieranalysis|acceleration   |body       |mean   |X-direction
            fBodyAcc-mean-Y         |      "        |      "        |     "     |  "    |Y-direction
            fBodyAcc-mean-Z         |      "        |      "        |     "     |  "    |Z-direction
            fBodyAcc-std-X          |      "        |      "        |     "     |std    |X-direction
            fBodyAcc-std-Y          |      "        |      "        |     "     |  "    |Y-direction
            fBodyAcc-std-Z          |      "        |      "        |     "     |  "    |Z-direction
            fBodyAccJerk-mean-X     |      "        |      "        |     "     |jerked |mean   |X-direction
            fBodyAccJerk-mean-Y     |      "        |      "        |     "     |  "    |   "   |Y-direction
            fBodyAccJerk-mean-Z     |      "        |      "        |     "     |  "    |   "   |Y-direction
            fBodyAccJerk-std-X      |      "        |      "        |     "     |jerked |std    |X-direction
            fBodyAccJerk-std-Y      |      "        |      "        |     "     |  "    |   "   |Y-direction
            fBodyAccJerk-std-Z      |      "        |      "        |     "     |  "    |   "   |z-direction
            fBodyGyro-mean-X        |      "        |angularVelocity|body       |mean   |X-direction
            fBodyGyro-mean-Y        |      "        |      "        |     "     |  "    |Y-direction
            fBodyGyro-mean-Z        |      "        |      "        |     "     |  "    |Y-direction
            fBodyGyro-std-X         |      "        |      "        |     "     |std    |X-direction
            fBodyGyro-std-Y         |      "        |      "        |     "     |  "    |Y-direction
            fBodyGyro-std-Z         |      "        |      "        |     "     |  "    |Z-direction
            fBodyAccMag-mean        |      "        |acceleration   |body       |normed |mean
            fBodyAccMag-std         |      "        |      "        |     "     |  "    |std
            fBodyBodyAccJerkMag-mean|      "        |      "        |     "     |body   |jerked |normed |mean
            fBodyBodyAccJerkMag-std |      "        |      "        |     "     |  "    |jerked |normed |std
            fBodyBodyGyroMag-mean   |      "        |angularVelocity|body       |body   |normed |mean
            fBodyBodyGyroMag-std    |      "        |      "        |     "     |  "    |   "   |std
            fBodyBodyGyroJerkMag-mean|     "        |      "        |     "     |  "    |jerked |normed |mean
            fBodyBodyGyroJerkMag-std|      "        |      "        |     "     |  "    |jerked |normed |std

    Test_person:
        Identify of the person performing the test:
            Subject_1
            Subject_1
                .
                .
                .
            Subject_30    