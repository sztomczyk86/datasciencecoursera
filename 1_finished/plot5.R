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


vehicle <- grep("Vehicle", code$EI.Sector, perl = TRUE)
code_sub <- code[vehicle, ]
veh_code <- as.character(code_sub$SCC)

pm25veh <-pm %>% filter(SCC %in% veh_code) %>% 
        filter(fips == "24510") %>%
        group_by(year) %>% 
        summarise(sum=sum(Emissions))

pm25veh$year <- as.factor(as.character(pm25veh$year))

png(file="plot5.png")

ggplot(pm25veh, aes(y=sum, x=year)) +
        geom_col(width = .5)+
        xlab("Year") +
        ylab("Tons of PM2.5")+
        labs(title = "Total PM2.5 emmision from motor vehicles in Baltimore City")

dev.off()
