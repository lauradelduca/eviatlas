## global.R ##
library(dplyr)
library(leaflet)

#load sample data set
pilotdata <- read.csv("https://raw.githubusercontent.com/ESHackathon/eviatlas/8a4b9edaa852d1a07ae219e103e4a0327f62ad9a/exploration/NarrativeTable_GoogleMap.csv")
over_year <- read.csv("https://raw.githubusercontent.com/ESHackathon/eviatlas/8a4b9edaa852d1a07ae219e103e4a0327f62ad9a/data-raw/pilotdata.csv")
# Heatmap stuff
