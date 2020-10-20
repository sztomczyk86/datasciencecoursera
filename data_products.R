library(tidyverse)
library(leaflet)

p1 <- read.csv("leaflet.csv")


icon1 <- makeIcon(
        iconUrl = "https://cdn.icon-icons.com/icons2/1449/PNG/256/beachumbrella3x_99142.png",
        iconWidth = 50, iconHeight = 50,
        iconAnchorX = 25, iconAnchorY = 40)

map1 <- leaflet() %>%
        addTiles() %>% addMarkers(lng = p1$lng, lat=p1$lat, popup = p1$popup,
                                  icon = icon1)

map1
