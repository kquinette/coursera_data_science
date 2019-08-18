require(XML)
file <- "2018 Green Bay Packers Player Stats | ESPN.html"
doc <- htmlTreeParse(file, useInternal = TRUE)
doc <- htmlParse(file, useInternal = TRUE)
doc

rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
xmlSApply(rootNode,xmlValue)