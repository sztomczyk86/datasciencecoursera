
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




