# look for one of the unzipped file, if it exists then assume all data is present
if(!file.exists(".Data/feature.txt")) {
    
    # look for the zip file, if not found then download it and unzip
    # it otherwise move on
    if(!file.exists("./getdata-projectfiles-UCI HAR Dataset.zip")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "raw_data.zip", method = "curl")
        unzip("raw_data.zip")
        file.rename(from = "UCI HAR Dataset", to = "Data")
        }
}