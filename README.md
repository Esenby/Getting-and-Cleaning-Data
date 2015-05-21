# PROJECT for the Coursea course Getting and Cleaning-Data 

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

    PREPARATION:
    The description of the original data sets and of their acquisition 
    is given in the README.txt provided with the two data sets.

    The R-programme "run_analysis.R" developed and all the 6 input data files  are collected into the working directory
    and the libraries of the R-packages "dplyr"/"plyr" are loaded.

    
  STEP 1.        
   A data frame is built by merging all the training and test data (referred to as "t*"):
       The merge begins with a series of column joins on each run type (training and test)
           - the activity codes, the y_ t* objects, as the first column 
           - subject lists, subject_t*, as the second column
           - the 561 columns of the table of measurements, X_t*, as the 3rd to the 563 rd. columns, and finally
           - the column marking which run type, "training" or "test" is appended.
      Then these separate data tables are merged by joining  the two tables with their different nunmbers (7352,2947) of rows.
      The resulting data frame (object) is called "all_data"
  STEP 2 
   The mean (mean()) and standard deviation (std()) data are selected and their column headings used from the entire data set.         
   The relevant column numbers and their headings are found by parsing the file "features.txt"
      The resulting data frame (object) is called "relevant_data".
    
  STEP 3
   The activity labels in the first column are inserted according to the coding in activity_labels.txt.
   
  STEP 4
   The columns are labelled appropriately
       The function brackets are removed from the original feature names for the selected mean and standard deviation columns 
       The table headings are created as 
            - "Activity_type"
            - "Test_person"
            - features column names ("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z","tBodyAcc-std-X","tBodyAcc-std-Y",..).
        plus 
            - "Trial_type", the (optional) tag which identifies the original source of each observation.
  STEP 5 
    The resulting data frame "relevant_data" is rearranged (grouped)
            - first by activity type, 
            - then by test person 
            - (and by trial type(optional, for the sake of diagnosis possiblly in order to extract the original data).
        The resulting data frame is called "relevant_groups", but for the purpose of the assignment the data frame 
        without the last column, "Trial-Type", is used.
        It is called "merged_groups"
                                                                                                
    The data fraame is filtered and split according to the activity  and Test_person, and the means of the features in these 
    separate groups are calculated.
    
    The groups of means are reassembled into a new data frame with 
        - the activity in the first column, labelled "Activity_type" 
        - the feature names in the second, labelles "Parameter"
        - a set of 30 columns for each test person, labelled "Subject_1", ... "Subject_30".
    
    The resulting data frame is called "trialsummary".
    
   OUTPUT
    The data frame is printed to the text file "trialsummary.txt", with the command:
            write.table(trialsummary, "trialsummary.txt", row.names=FALSE).
    and uploaded to the Coursera site.  
            
  
  
       



















==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

