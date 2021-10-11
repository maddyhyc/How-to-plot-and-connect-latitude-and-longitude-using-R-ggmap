
library(readxl)
library(tidyr)
library(dplyr)
library(tidyverse)
library(openxlsx)
library(ggplot2)
library(ggmap)

setwd("your drive")

uber_tidy2 <- read_excel("Uber_tidy.xlsx", 3) 
uber_tidy2 <- as.data.frame(uber_tidy2)

str(uber_tidy2)

register_google(key = "your key")

# Using Google map
map_g <- get_map(location = 'Lima', zoom = 11, scale =4, source = "google")
map_g

a_g <- ggmap(map_g) + geom_point(data = uber_tidy2, aes(x = start_lon, y = start_lat, colour = "red", alpha = 0.1, size= 25)) + geom_point(data = uber_tidy2, aes(x = end_lon, y = end_lat, colour = "blue", alpha = 0.1, size = 25))
a_g

# Using Stamen map
map <- get_map(location = 'Lima', zoom = 11, source = "stamen")
map

a <- ggmap(map) + geom_point(data = uber_tidy2, aes(x = start_lon, y = start_lat, colour = "red", alpha = 0.1, size= 25)) + geom_point(data = uber_tidy2, aes(x = end_lon, y = end_lat, colour = "blue", alpha = 0.1, size = 25))
a

b <- ggmap(map) + geom_point(data = uber_tidy2, aes(x = start_lon, y = start_lat), shape = 5, size = 2, stroke = 1) + geom_point(data = uber_tidy2, aes(x = end_lon, y = end_lat), colour = "green", shape = 17, size = 2)
b

# Stamen vary shape and color
b1 <- ggmap(map) + geom_point(data = uber_tidy2, aes(x = start_lon, y = start_lat), shape = 9, size = 2, stroke = 1) + geom_point(data = uber_tidy2, aes(x = end_lon, y = end_lat), colour = "pink", shape = 8, size = 2)
b1

# Stamen connect points
b + geom_segment(data = uber_tidy2, aes(x = as.numeric(start_lon), y = as.numeric(start_lat), xend = as.numeric(end_lon), yend = as.numeric(end_lat), colour = "curve"))
