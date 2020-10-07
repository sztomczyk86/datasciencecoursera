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


coal <- grep("Fuel.*- Coal", code$EI.Sector, perl = TRUE)
code_sub <- code[coal, ]
coal_code <- as.character(code_sub$SCC)

pm25coal <-pm %>% filter(SCC %in% coal_code) %>% group_by(year) %>% 
                summarise(sum=sum(Emissions))

pm25coal$year <- as.factor(as.character(pm25coal$year))

png(file="plot4.png")

ggplot(pm25coal, aes(y=sum/1000, x=year)) +
        geom_col(width = .5)+
        xlab("Year") +
        ylab("x1000 tons of PM2.5")+
        labs(title = "Total PM2.5 emmision from coal combustion in USA")

dev.off()
