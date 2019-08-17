install.packages("RMySQL")
library(RMySQL)

mysql --user=genome --host=genome-mysql.soe.ucsc.edu -A -P 3306

ucscDb <- dbConnect(MySQL(),user="genome", 
                    host="genome-mysql.cse.ucsc.edu")

# show databases
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
result


hg19 <- dbConnect(MySQL(),user="genome", db="hg19",
                    host="genome-mysql.cse.ucsc.edu")
# list tables
allTables <- dbListTables(hg19)
length(allTables)

allTables[1:5]

dbListFields(hg19,"affyU133Plus2")

dbGetQuery(hg19, "select count(*) from affyU133Plus2")



affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)

affyMisSmall <- fetch(query,n=10); dbClearResult(query);


dim(affyMisSmall)

dbDisconnect(hg19)

# RMySQL vignette http://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf

# List of commands http://www.pantz.org/software/mysql/mysqlcommands.html

# A nice blog post summarizing some other commands 
# http://www.r-bloggers.com/mysql-and-r/






