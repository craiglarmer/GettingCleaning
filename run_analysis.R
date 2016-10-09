#Script to clean and summarise the Human Activity Recognition Using Smartphones Dataset
#Craig Larmer

#load the required libraries
library(readr)
library(dplyr)

#load lookup data
feature_labels<-read.csv("features.txt",sep=" ",header=FALSE, col.names=c("feature_index","feature_label"))
activity_labels<-read.csv("activity_labels.txt",sep=" ",header=FALSE, col.names=c("activity_index","activity_label"))

#load subject and activities
y_test<-read.csv("test/y_test.txt",header=FALSE,col.names=c("activity_index"))
y_test<-merge(y_test,activity_labels,sort=FALSE)
subject_test<-read.csv("test/subject_test.txt",header=FALSE,col.names=c("subject"))
y_train<-read.csv("train/y_train.txt",header=FALSE,col.names=c("activity_index"))
y_train<-merge(y_train,activity_labels,sort=FALSE)
subject_train<-read.csv("train/subject_train.txt",header=FALSE,col.names=c("subject"))

#setup the filewidths vector for fixed width file
file_widths<-c(1:561)
file_widths[]=16
feature_labels_only<-feature_labels[1:561,2]

#load and label test data
x_test<-read_fwf("test/x_test.txt",fwf_widths(file_widths))
names(x_test)<-feature_labels_only
x_test<-x_test[,grep("mean\\(\\)|std\\(\\)",feature_labels_only)]
x_test<-cbind(subject_test,y_test,x_test)

#load and label train data
x_train<-read_fwf("train/x_train.txt",fwf_widths(file_widths))
names(x_train)<-feature_labels_only
x_train<-x_train[,grep("mean\\(\\)|std\\(\\)",feature_labels_only)]
x_train<-cbind(subject_train,y_train,x_train)

# merge test and train data
tidy_data<-rbind(x_test,x_train)

#summarise data by grouping by subject and activity and getting mean of all other variables
tidy_data_df<-tbl_df(tidy_data)
tidy_summary<- tidy_data_df %>% group_by(subject,activity_label) %>% summarise_each(funs(mean))

#record the results
if(file.exists("tidy_data.csv")) {file.remove("tidy_data.csv")}
write.csv(tidy_data,"tidy_data.csv",row.names=FALSE)

if(file.exists("tidy_summary.csv")) {file.remove("tidy_summary.csv")}
write.csv(tidy_summary,"tidy_summary.csv",row.names=FALSE)

