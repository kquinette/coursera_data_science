getwd()
setwd("/Users/kevinquinette/Desktop/coursera/datasciencecoursera/gettingandcleaningdata/week1")


library("XML")

fileURL <- "http://www.w3schools.com/xml/simple.xml"
# download the file
download.file(fileURL,destfile="./data/simple.xml")
# parse file
doc <- xmlTreeParse("./data/simple.xml",useInternal=TRUE)
doc


rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

rootNode[[1]]
rootNode[[2]]

rootNode[[1]][[1]]
rootNode[[1]][[2]]

xmlSApply(rootNode,xmlValue)

xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

#other packages to try 