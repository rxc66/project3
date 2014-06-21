
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest_file <- "project_data.zip"
subDir <- "project3"
if (file.exists(subDir)){
        setwd(file.path(getwd(),subDir))
} else {
        dir.create(file.path(getwd(),subDir))
        setwd(file.path(getwd(),subDir))
}
download.file(file_url,dest_file,method="curl")
unzip(dest_file,list=FALSE)
setwd(file.path(getwd(),"UCI HAR Dataset"))

c <- read.table("activity_labels.txt", sep=" ",col.names=c("activity_id","activity_description"))
features <- read.table("features.txt", sep=" ",col.names=c("feat_id","feat_description"))
features[,2] <- gsub("-|,","_",features[,2])
features[,2] <- gsub("\\()","",features[,2])
features[,2] <- gsub("\\(|\\)","",features[,2])
train_y <- read.table("train/y_train.txt",col.names="activity_id")
train_y_full <- merge(train_y,activity_labels,by.x="activity_id",by.y="activity_id")
train_x <- read.table("train/X_train.txt",col.names=features[,2])
train_subj <- read.table("train/subject_train.txt",col.names="subject_id")
train <- cbind(train_subj,train_y_full,train_x)
train_cols <- c(1,3,grep('mean',names(train)),grep('std',names(train)))
train_final <- train[,train_cols]
test_y <- read.table("test/y_test.txt",col.names="activity_id")
test_y_full <- merge(test_y,activity_labels,by.x="activity_id",by.y="activity_id")
test_x <- read.table("test/X_test.txt",col.names=features[,2])
test_subj <- read.table("test/subject_test.txt",col.names="subject_id")
test <- cbind(test_subj,test_y_full,test_x)
test_cols <- c(1,3,grep('mean',names(test)),grep('std',names(test)))
test_final <- test[,test_cols]
all_final <- rbind(train_final,test_final)
tidy <- aggregate(. ~ subject_id + activity_description, data=all_final,FUN=mean)
final_tidy <- tidy[order(tidy$subject_id,tidy$activity_description),]
