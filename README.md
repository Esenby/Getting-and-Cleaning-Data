# PROJECT for the Coursea course Getting and Cleaning-Data 
==================================================================
Human Activity Recognition Using Smartphones Dataset Version 1.0
==================================================================

    PREPARATION:
    The description of the original data sets and of their acquisition 
    is given in the "README.txt" and "features.inf0.txt", provided with the two data sets. 
    The labels and variable names are given there in "activity_labels.txt" and "features.txt".
    
    From the sets and these text files, the R-programme "run_analysis.R" developed and 
    all the 6 input data files are collected into the working directory
    For data frame manipulation the libraries of the R-packages "plyr"/"dplyr" are loaded.

  STEP 1.        
   A data frame is built by merging all the training and test data (referred to as "t*"):
       The merge begins with a series of column joins on each run type ("training" and "test")
           - the activity codes, the y_t* objects, as the first column 
           - subject lists, subject_t*, as the second column
           - the 561 columns of the table of measurements, X_t*, as the 3rd to the 563 rd. columns, and finally (optional)
           - the column marking which run type, "training" or "test" is appended.
      Then these separate data tables are merged by joining the two tables with their different number of rows (7352,2947).
      The resulting data frame (object) is called "all_data"
      
  STEP 2 
   The mean (mean()) and standard deviation (std()) data are selected and their column headings used from the entire data set.         
   The relevant column numbers and their headings are found by parsing the file "features.txt"
      The resulting data frame (object) is called "relevant_data".
    
  STEP 3
   The activity labels in the first column are inserted as literals according to the coding scheme given in activity_labels.txt.
   
  STEP 4
   The columns are labelled appropriately
       The function brackets are removed from the original feature names for the selected mean and standard deviation columns 
       The table headings are created as 
            - "Activity_type"
            - "Test_person"
            - features column names ("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z","tBodyAcc-std-X","tBodyAcc-std-Y",..).
        plus 
            - "Trial_type", the (optional) tag which identifies the original source of each observation.
        The result is named "relevant_data".
        
  STEP 5 "Longer" version (see alternate interpretation of STEP 5 below *** for a "wider" version of the results)
    The resulting data frame "relevant_data" is rearranged (grouped)
            - first by activity type, 
            - then by test person 
            - (and by trial type(optional, for the sake of diagnosis or possibly for tracing the original data).
        The resulting data frame is called "relevant_groups", but for the purpose of the assignment, the data frame 
        without the last column, "Trial-Type", is used.
        It is called "merged_groups".
                                                                                                
    The data frame is filtered and split according to the activity, Activity_type, and the test person "Test_person", and,
    at the same time, the means of the features in these separate groups are calculated.
    
    The groups of means are reassembled into a new data frame with 
        - the 6 activity blocks in the first column, labelled "Activity_type" 
        - the 66 feature names for each block in the second column, labelled "Parameter"
        - a set of 30 columns for each test person, labelled "Subject_1", ... "Subject_30".
    
    The resulting data frame of dimensions 396 x 32 is called "trialsummary".
    
   OUTPUT
        1.  The data frame is printed to the text file "trialsummary.txt", with the command:
                    write.table(trialsummary, "trialsummary.txt", row.names=FALSE).
            and uploaded to the Coursera site.
        2.  All labels are explained in the file "CODEbook.md" in this repository according to the schemes in "features_info.txt" .

*** Alternate STEP 5 interpretation would be to select by activity type, but then by feature names, "Parameter", and subsequently
                        calculating the means for the 30 individual subjects.
                        The result would be a table with the same first column, a second column with subject identification and
                        66 columns of parameters with the corresponding means for each result derived from the measurements,
                        producing a data frame of dimensions 180 by 68 (6*30 by 2+66).
        My choice is the first presentation mainly because it seems easier to read the result, and 
        should the mean of all the test persons' results be needed, the table can be shrunk easily from right to left to produce 
        a third column containing the overall means for each activity type and parameter. Something like
                   subjtab<-trialsummary[,3:33]
                   meansub<-rowMeans(subjtab)
                   trialTotalSummary<-cbind(trialsummary[,1:2],meansub)
                   names(trialTotalSummary)<-c(names(trialsummary[1]),names(trialsummary[2]),"Average of all test persons")
            or more compactly:
                   trialTotalSummary<-data.frame(trialsummary[,1:2],Average=rowMeans(trialsummary[,-2:-1]))
            For completeness, I append the printed table "trialTotalSummary.txt" to the repository.   
