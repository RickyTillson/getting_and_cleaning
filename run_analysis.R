# read the features file to get the column names
features <- read.table("./Data/features.txt", na.strings = "N/A")
activity_labels <- c("Walking","Walking Upstairs","Walking Downstairs",
                     "Sitting","Standing","Laying")

# read the test data, name the columns and convert the y data to activity name
x_test <- read.table("./Data/test/X_test.txt", na.strings = "N/A")
y_test <- read.table("./Data/test/y_test.txt", na.strings = "N/A")
subject_test <- read.table("./Data/test/subject_test.txt", na.strings = "N/A")
names(x_test) <- features$V2
names(y_test) <- "Activity"
names(subject_test) <- "Subject"
y_test[,1] <- as.factor(y_test[,1])
levels(y_test[,1]) <- activity_labels

# read the train data, name the columns and convert the y data to activity name
x_train <- read.table("./Data/train/X_train.txt", na.strings = "N/A")
y_train <- read.table("./Data/train/y_train.txt", na.strings = "N/A")
subject_train <- read.table("./Data/train/subject_train.txt", na.strings = "N/A")
names(x_train) <- features$V2
names(y_train) <- "Activity"
names(subject_train) <- "Subject"
y_train[,1] <- as.factor(y_train[,1])
levels(y_train[,1]) <- activity_labels

# clearing the memory as we go along
rm(activity_labels, features)


# subset x data to interested columns - subset to include mean and stdev and
# again to remove meanFreq
col_interested_test <- unique(grep("-mean|-std", names(x_test), value = TRUE))
col_interested_test <- unique(grep("meanFreq", col_interested_test, value = TRUE, invert = TRUE))
x_wanted_test <- x_test[,col_interested_test]
col_interested_train <- unique(grep("mean|std", names(x_train), value = TRUE))
col_interested_train <- unique(grep("meanFreq", col_interested_train, value = TRUE, invert = TRUE))
x_wanted_train <- x_train[,col_interested_train]

# clearing the memory as we go along
rm(col_interested_test, x_test, col_interested_train, x_train)

# binds the test and training data together before row binding them together
train_all <- cbind(subject_train,y_train, x_wanted_train)
test_all <- cbind(subject_test,y_test, x_wanted_test)
merged_data <- rbind(train_all, test_all)

# clearing the memory as we go along
rm(x_wanted_test, x_wanted_train, y_test, y_train, subject_test, subject_train, train_all, test_all)

# now return the average for each variable for each subject and activity
library(plyr)
summary_data <- ddply(merged_data, .(Subject, Activity), numcolwise(mean))
write.table(summary_data, file = "summary_data.txt", sep = "\t")