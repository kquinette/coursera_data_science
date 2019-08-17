# Download the file to load

if (!file.exists("data")) {
    dir.create("data")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.csv", method = "curl")
dateDownloaded <- date()

# Loading flat files - read.table()
cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(cameraData)

# Loading flat files - read.csv()
#read.csv sets sep="," and header=TRUE
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)

# Some more important parameters
# 
# quote - you can tell R whether there are any quoted values quote="" means no quotes.
# na.strings - set the character that represents a missing value.
# nrows - how many rows to read of the file (e.g. nrows=10 reads 10 lines).
# skip - number of lines to skip before starting to read