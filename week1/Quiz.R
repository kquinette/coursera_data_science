#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./data/idaho_housing.csv",method="curl")

# Loading flat files - read.table()
idaho_housing <- read.table("./data/idaho_housing.csv", sep = ",",
                            header = TRUE)

summary(idaho_housing$VAL == 24)

library(xlsx)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,destfile="./data/natgas.xlsx",method="curl")
natgas <- read.xlsx("./data/natgas.xlsx",sheetIndex=1,header=TRUE, 
                    startRow = 18, endRow = 23, colIndex = 7:15)
dat <- natgas
sum(dat$Zip*dat$Ext, na.rm = TRUE)

library(XML)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
# download the file
download.file(fileURL,destfile="./data/restaurants.xml")
# parse file
doc <- xmlTreeParse("./data/restaurants.xml",useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zc <- xpathSApply(rootNode,"//zipcode",xmlValue)
zc[zc %in% 21231]
