getwd()
setwd("/Users/kevinquinette/Desktop/coursera/datasciencecoursera/gettingandcleaningdata/week1")

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true&format=true"
download.file(fileUrl,destfile="./data/cameras.xlsx",method="curl")
dateDownloaded <- date()

# may need to run at terminal: sudo R CMD javareconf
library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)

colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/cameras.xlsx",sheetIndex=1,
                              colIndex=colIndex,rowIndex=rowIndex)
cameraDataSubset


#Further notes

# The write.xlsx function will write out an Excel file with similar arguments.
# read.xlsx2 is much faster than read.xlsx but for reading subsets of rows may be 
# slightly unstable.
# The XLConnect package has more options for writing and manipulating Excel files
# The XLConnect vignette is a good place to start for that package
# In general it is advised to store your data in either a database or 
# in comma separated files (.csv) or tab separated files (.tab/.txt) as they are 
# easier to distribute.