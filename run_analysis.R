library(dplyr)
library(stringr)

actLab<-read.table("~/UCI HAR Dataset/activity_labels.txt")

trainSub<-read.table("~/UCI HAR Dataset/train/subject_train.txt")
trainY<-read.table("~/UCI HAR Dataset/train/Y_train.txt")
trainYLab<-inner_join(trainY,actLab,by="V1")
trainX<-read.table("~/UCI HAR Dataset/train/X_train.txt")
train<-cbind(activity=trainYLab[,2],subject=trainSub[,1],trainX)

testSub<-read.table("~/UCI HAR Dataset/test/subject_test.txt")
testY<-read.table("~/UCI HAR Dataset/test/Y_test.txt")
testYLab<-inner_join(testY,actLab,by="V1")
testX<-read.table("~/UCI HAR Dataset/test/X_test.txt")
test<-cbind(activity=testYLab[,2],subject=testSub[,1],testX)

df<-rbind(train,test)

df$subject<-as.factor(df$subject)
feat<-read.table("~/UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)[,2] # string vector of feature labels
names(df)[3:563]<-feat
meanCols<-grep("mean()",names(df),fixed=TRUE)
stdCols<-grep("std()",names(df),fixed=TRUE)
cols<-sort(c(1,2,meanCols,stdCols))
dfMeanStd<-subset(df,select = cols)

camelCase<-gsub("(","",gsub(")","",names(dfMeanStd),fixed=TRUE),fixed=TRUE)
for(i in 1:2){
    dashIndex<-regexpr("-",camelCase)
    camelCase<-paste(
        substr(camelCase,1,dashIndex-1),
        toupper(substr(camelCase,dashIndex+1,dashIndex+1)),
        substr(camelCase,dashIndex+2,nchar(camelCase)),
        sep=""
    )
}
names(dfMeanStd)<-camelCase

dfMeanStd$activity<-paste(as.character(dfMeanStd$activity),as.character(dfMeanStd$subject))
dfMeanStd<-group_by(dfMeanStd,activity)
summary<-summarise_each(dfMeanStd,funs(mean))#[,2:69
summary$activity<-as.factor(str_trim(substr(summary$activity,1,nchar(summary$activity)-2)))
summary$subject<-as.factor(summary$subject)
summary