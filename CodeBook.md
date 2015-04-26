#CodeBook for Getting and Cleaning Data Course Project
* actLab: Dataframe containing the activity labels from activity_labels.txt
* trainSub: Dataframe containing the subjects from subject_train.txt
* trainY: Dataframe containing the activity numbers from y_train.txt
* trainYLab: Modification of the trainY dataframe, where activity numbers have been replaced with the corresponding activity labels from actLab
* trainX: Dataframe containing the training data from X_train.txt
* train<-Dataframe containing the training data from X_train.txt as well as a variable "subejct" containing subject numbers and "activity" containing activity labels

* testSub: Same as trainSub but with test data
* testY: Same as trainY but with test data
* testYLab: Same as trainYLab but with test data
* testX: Same as trainX but with test data
* test: Same as train but with test data

* df: Data frame with train and test combined

* feat: dataframe containing the feature labels from features.txt
* meanCols: Vector indicating which variables of df that are the mean of a measurement
* stdCols: Vector indicating which variables of df that are the standard deviation of a measurement
* cols: Vector indicating which variables of df that are either the mean or the standard deviation of a measurement (a combination of meanCols and stdCols
* dfMeanStd<-a subset of the df dataframe containing only mean and standard deviation measurements

* camelCase: Vector containing cleansed variable names
* dashIndex: Vector indicating location of first dash in each value of camelCase
* summary: Final data frame containing the mean of each variable for each activity and each subject
