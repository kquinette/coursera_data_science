getwd()
setwd("/Users/kevinquinette/Desktop/coursera/datasciencecoursera/gettingandcleaningdata/week1")


library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)

DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

tables()

DT[2,]
DT[DT$y=="a",]

#returns rows 2 and 3
DT[c(2,3)]
#returns columns 2 and 3
DF[c(2,3)]

# consistent use between a df and dt
DT[c(2,3),]
DF[c(2,3),]
DT[,c(2,3)]
DF[,c(2,3)]

# expression enclosed in {}: executes sequence and returns the last value
z <- {
  x = 1
  y = 2
}
z #prints 2

k = {print(10); 5} #prints 10...expression is execute during assignment
print(k) #prints 5...5 is returned by the expression since it is the last value

# compute the mean of column x and sum of column z; returns a dt
DT[,list(mean(x),sum(z))]

# table uses the cross-classifying factors to build a contingency table of the 
# counts at each combination of factor levels. 
DT[,table(y)] # counts of factors in column "y"

# add a new column with := followed by expression
DT[,w:=z^2]
DT

DT2 <- DT # not a copy;  DT2 and DT refer to the same object
# change an existing column with :=
DT[, y:= 2] # changes both DT and DT2
head(DT,n=3)
head(DT2,n=3)

#multiple operations
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]

# create column a with logical values
DT[,a:=x>0]
DT

# take mean of x+y grouped by column a
DT[,b:= mean(x+w),by=a]
DT

# special variables
# .N An integer, length 1, containing the number of elements of a factor level
set.seed(123);
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

# keys
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x) #
DT['a']

# joins
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)

big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, 
            col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file))

system.time(read.table(file, header=TRUE, sep="\t"))



