#rm(list=ls())

library(dplyr)
library(data.table)

# Clean names
features=read.table("./features.txt",sep="",header=FALSE,stringsAsFactors = FALSE)
feature_names=features[,2]

feature_names=gsub("-","_",feature_names)
feature_names=gsub("tBody","TimeBody",feature_names)
feature_names=gsub("tGravity","TimeGravity",feature_names)
feature_names=gsub("fBody","FourierBody",feature_names)
feature_names=gsub("\\(|\\)", "", feature_names)

##############################################################################################

# Train data
# For parts 1.-4.
X_train<-fread("./train/X_train.txt",data.table=TRUE)
y_train<-fread("./train/y_train.txt",data.table=TRUE)
subject_train<-fread("./train/subject_train.txt",data.table=TRUE)

names(X_train)<-feature_names
names(y_train)<-"Activity"

feature_names_mean=grepl("mean", feature_names, perl=TRUE)
feature_names_sd=grepl("std", feature_names, perl=TRUE)
feature_names_mean_sd=feature_names_mean|feature_names_sd

X_train_clean=X_train[, feature_names_mean_sd, with=FALSE]

train=cbind(y_train,X_train_clean)
train$Activity=as.factor(train$Activity)

train <- train %>% 
  mutate(Activity = recode(Activity,
                           "1" = "WALKING",
                           "2" = "WALKING_UPSTAIRS",
                           "3" = "WALKING_DOWNSTAIRS",
                           "4" = "SITTING",
                           "5" = "STANDING",
                           "6" = "LAYING")
  )

# For part 5.
names(subject_train)<-"Subject"
train_subject<-cbind(train,subject_train)

##############################################################################################

# Test data
# For parts 1.-4.
X_test<-fread("./test/X_test.txt",data.table=TRUE)
y_test<-fread("./test/y_test.txt",data.table=TRUE)
subject_test<-fread("./test/subject_test.txt",data.table=TRUE)

names(X_test)<-feature_names
names(y_test)<-"Activity"

feature_names_mean=grepl("mean", feature_names, perl=TRUE)
feature_names_sd=grepl("std", feature_names, perl=TRUE)
feature_names_mean_sd=feature_names_mean|feature_names_sd

X_test_clean=X_test[, feature_names_mean_sd, with=FALSE]

test=cbind(y_test,X_test_clean)
test$Activity=as.factor(test$Activity)

test <- test %>% 
  mutate(Activity = recode(Activity,
                           "1" = "WALKING",
                           "2" = "WALKING_UPSTAIRS",
                           "3" = "WALKING_DOWNSTAIRS",
                           "4" = "SITTING",
                           "5" = "STANDING",
                           "6" = "LAYING")
  )

# For part 5.
names(subject_test)<-"Subject"
test_subject<-cbind(test,subject_test)

##############################################################################################

# Combine datasets
data=rbind(train,test)
data_subject=rbind(train_subject,test_subject)

# Aggregate
aggregated_data_subject=aggregate(data_subject[, 2:80], list(data_subject$Activity,data_subject$Subject), mean)
aggregated_data_subject=rename(aggregated_data_subject, Activity = Group.1,Subject = Group.2)

# Write .txt file
write.table(aggregated_data_subject,file = "step_5_data.txt",row.names = FALSE)

