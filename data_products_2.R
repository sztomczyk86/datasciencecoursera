library(plotly)
library(tidyverse)
# NASA Exoplanet archive

planets <- read.csv("PS_2020.10.22_06.31.22.csv", header = T, skip = 97)

p1 <- grepl("^-?[0-9.]+$", planets$pl_orbper)

planets <- planets[p1,]
planets$pl_orbper <- as.numeric(planets$pl_orbper)
planets$disc_year <- as.factor(planets$disc_year)

p2 <- is.na(planets$pl_rade)

planets <- planets[!p2,]

plot1 <- ggplot(data = planets, aes(y = pl_rade, x=log10(pl_orbper)))+
        geom_jitter(aes(color=disc_year, size = 0.01, alpha = 0.5)) + scale_color_viridis_d()+
        labs(title = "Exoplanets radius by the orbital period") + 
        xlab("Orbital period in log10(Days)")+
        ylab("Exoplanet radious")

ggplotly(plot1)

plot_ly(data = planets, y = planets$pl_rade, x=log10(planets$pl_orbper), 
        color = planets$disc_year )

