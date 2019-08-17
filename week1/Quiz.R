https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./data/idaho_housing.csv",method="curl")

# Loading flat files - read.table()
idaho_housing <- read.table("./data/idaho_housing.csv", sep = ",", header = TRUE)
head(idaho_housing)
idaho_housing[,"VAL"]==24
head(idaho_housing[idaho_housing[,"val"]=24,])
