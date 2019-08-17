
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
str(jsonData)
summary(jsonData)
head(jsonData, 1)
colnames(jsonData)

jsonData$name
jsonData[3]

names(jsonData$owner)

jsonData$owner$login

# print iris dataframe
iris
# convert iris df format to json format
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

# convert iris json format to df format
iris2 <- fromJSON(myjson)
head(iris2)