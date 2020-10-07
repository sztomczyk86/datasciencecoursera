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
        filter(fips %in% c("24510","06037")) %>%
        group_by(fips, year) %>% 
        summarise(sum=sum(Emissions)) %>%
        mutate(area=if_else(fips=="06037", "Los Angeles County", "Baltimore City" ))

pm25veh$year <- as.factor(as.character(pm25veh$year))
pm25veh$area <- as.factor(as.character(pm25veh$area))


png(file="plot6.png")

ggplot(pm25veh, aes(y=sum/1000, x=year)) +
        geom_point(aes(colour=area))+
        geom_line(aes(colour=area, group=area))+
        xlab("Year") +
        ylab("x1000 tons of PM2.5")+
        labs(title = "Total PM2.5 emmision from motor vehicles")+
        theme(legend.title =element_blank())

dev.off()
