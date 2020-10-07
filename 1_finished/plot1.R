library(tidyverse)

if(!file.exists("./summarySCC_PM25.rds")) {
        
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                      "pm25.zip")
        unzip("pm25.zip")
        
        pm <- readRDS("summarySCC_PM25.rds")
        code <- readRDS("Source_Classification_Code.rds")
} else {
        
        pm <- readRDS("summarySCC_PM25.rds")
        code <- readRDS("Source_Classification_Code.rds")
        
}

pm25sum <- with(pm, tapply(Emissions, year, sum))

png(file="plot1.png")

barplot(pm25sum/1000, main="Total PM2.5 emmision per year", xlab="Year", 
        ylab="x 1000 tons of PM2.5")

dev.off()




