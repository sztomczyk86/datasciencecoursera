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


pm25mary <- filter(pm, fips == "24510")

pm25gr <- group_by(pm25mary, year, type)

pm25sum <- pm25gr %>% summarise(sum=sum(Emissions))

png(file="plot3.png")

ggplot(pm25sum, aes(x=year, y=sum)) +
        geom_point(aes(colour=type)) +
        geom_line(aes(colour=type)) +
        scale_color_ordinal()+
        xlab("Year") +
        ylab("PM2.5 emission (tons)")+
        labs(title = "PM2.5 emmision per year in Baltimore City, Maryland")+
        theme(legend.title =element_blank())

dev.off()
