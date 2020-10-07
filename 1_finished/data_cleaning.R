
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              "communities.csv")

communities <- read.csv("communities.csv",  TRUE)

mill <- communities$VAL == 24

sum(mill[!is.na(mill)])

communities$FES
table(communities$FES)
str(communities$FES)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
              "gas.xlsx")

library(xlsx)

gas <- read.xlsx("gas.xlsx", sheetIndex = 1 ,rowIndex = 18:23, colIndex = 7:15, header = T)
sum(gas$Zip*gas$Ext,na.rm=T)

library(XML)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
              "rest.xml")

rest <- xmlParse("rest.xml")
rest_data <- xmlToList(rest)
str(rest_data)

root <- xmlRoot(rest)
xmlApply(rest, "//zipcode", xmlValue)
xmlName(root)
names(root)

root[[1]][[1]][[2]]

xmlSApply(root, xmlValue)

bla <- xpathSApply(root, "//zipcode", xmlValue)
table(bla)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
              "idaho.csv")
library(data.table)

DT <- fread(input = "idaho.csv")




library(sqldf)
 download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
               , "mysql.csv")
 
 acs <- read.csv.sql("mysql.csv")       
 
 dbGetQuery(acs)

sqldf("select pwgtp1 from acs where AGEP < 50")

unique(acs$AGEP)

sqldf("select distinct AGEP from acs")

library(httr)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"

html2 = GET(url)

content2 = content(html2, as = "text")

parsedHtml = htmlParse(content2, asText = T)

parsedHtml

nchar(parsedHtml)

con1 = url("http://biostat.jhsph.edu/~jleek/contact.html")

close(con1)

lines = readLines(con1)
nchar(lines[c(10,20,30,100)])

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
              "bla.fwf")



blabla <- read.fwf("bla.fwf", widths = c(15,4,4,9,4,9,4,9,4), skip=4)

sum(blabla$V4)
                   