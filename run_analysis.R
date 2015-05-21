#   It is assumed that the working directory is set as the directory contains all 6 text files of data

##  PREPARATORY STEP
#   The required libraries are loaded. 
        
        library(plyr)
        library(dplyr)

#   The 6 text files of data are loaded into R without headers, and the dimensions of the R-tables investigated
        subject_train<-read.table("subject_train.txt", header=FALSE)
        X_train<-read.table("X_train.txt", header=FALSE)
        y_train<-read.table("y_train.txt", header=FALSE)
        subject_test<-read.table("subject_test.txt", header=FALSE)
        X_test<-read.table("X_test.txt", header=FALSE)
        y_test<-read.table("y_test.txt", header=FALSE)

##  STEP 1.        
#   A data frame is built by merging all the training and test data:
#       The merge begins with a series of column joins on each run type (training and test)
#           - the activity codes, the y_ t* objects, as the first column 
#           - subject lists, subject_t*, as the second column
#           - the 561 columns of the table of measurements, X_t*, as the 3rd to the 563 rd. columns, and finally
#           - the column marking which run type, "training" or "test" is appended.
#      Then these separate data tables are joined by joining the two tables with their different nunmbers (7352,2947) of rows.
#       
        runType<-c("Training-run","Test-run")
        lastCol<-runType[1]
        training_data<-data.frame(cbind(y_train,subject_train,X_train,lastCol)) #merged training data with training tags, 
                                                                                #dimension 7352 by 564 
        lastCol<-runType[2]
        test_data<-data.frame(cbind(y_test,subject_test,X_test,lastCol))        #merged test data with test tags, 
                                                                                #dimension 2947 by 564
        all_data<-data.frame(rbind(training_data,test_data))                    #merged training and test data, 
                                                                                #dimension 10299 by 564

##  STEP 2 
#   The mean mean()and standard deviation std() data are selected and their column headings used from the entire data set          
#   The relevant column numbers and their headings are found by parsing the file features.txt
        meanstd<-read.table("features.txt", header=FALSE,stringsAsFactors=FALSE)
        colno<-NULL
        for (i in 1:nrow(meanstd)) {
            line<-meanstd[i,2]
            if (length(grep("mean\\(",line))>0 | length(grep("std\\(",line))>0) 
                {   newcol<-meanstd[i,]
                    colno<-rbind(colno,newcol)
                    }
                 }
#   The selection used is the first column of this table       
        relcol<-colno[,1]+2
        relcol<-c(1:2,relcol,564)
        relevant_data<-select(all_data,relcol)
        
##  STEP 3
#   The activity labels in the first column are inserted according to the coding in activity_labels.txt
        activity_list<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
        test_list<-relevant_data[,1]
        test_list<-as.vector(test_list)
        len<-length(test_list)
        for (i in 1:len)  {
            {new_list[i]<-activity_list[test_list[i]]}
            }
        relevant_data[,1]<-new_list
        
##  STEP 4
#   Labelling the columns appropriately
#       The function brackets are removed from the original feature names for the selected mean and standard deviation columns 
#       The table headings are created as "Activity_type","Test_person",the features column names 
#       plus "Trial_type", the (optional) tag which identifies the original source of each observation  
        features<-as.character(lapply(colno[,2],function(x) sub("\\(\\)","",x)))
        headings<-("Activity_type","Test_person",features,"Trial_type")
        names(relevant_data)<-headings
        
##  STEP 5 
#   Grouping by activity type, test person and trial type 
        indices<-with(relevant_data,order(Activity_type,Test_person,-Trial_type))
        relevant_groups<-relevant_data[indices,]
#   Omitting the source of the original data in the last column, Test_type for the purpose of the assignment
        merged_groups<-relevant_groups[,-69]
#   Taking the mean of the measurements grouped by Activity_type and Test_person
               activity_list<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
        tablemeans<-NULL
        col_1<-NULL
        for (al in activity_list) {
            col_1<-c(col_1,c(rep(al,66)))   
            activitygroup<-filter(merged_groups, Activity_type==al)
            activitysplit<-split(activitygroup,activitygroup$Test_person)
            activitymeans<-sapply(activitysplit, function(x) colMeans(x[,3:68]))
            tablemeans<-rbind(tablemeans,activitymeans)
            }
        col_2<-rownames(tablemeans)
        tidydata<-data.frame(tablemeans,rownames=c(1:396))
        trialsummary<-cbind(col_1,col_2,tidydata)
        subjhead<-sapply(c(1:30), FUN=function (x) paste("Subject_",x,""))
        names(trialsummary)<-c("Activity_type", "Parameters",subjhead)
        
#   WRITING final table "trialsummary.txt" to the working directory
    
    write.table(trialsummary, "trialsummary.txt",row.names=FALSE,sep=" ")
