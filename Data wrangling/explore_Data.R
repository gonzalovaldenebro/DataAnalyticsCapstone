# First day exploration
rm(list=ls())


# Load packages
install.packages("tidyverse")
library(tidyverse)

install.packages("lubridate")
library(lubridate)

# Importing the data from the Project
wo = read.csv("Project 1/Data/work order scrubbed.csv")

# Please don't use attach()

# Check the datatypes
str(wo)

# View data in tabular way
View(wo)

# R doesn't know start_date and end_date are dates - they were read in as numeric
# convert those both to date objects
wo$wo_start_date = ymd_hms(wo$wo_start_date)
wo$interval_date = round_date()
summary(wo)

wo$wo_finish_date = ymd_hms(wo$wo_finish_date)
summary(wo)


# Bar chart to count the number of requests per day
ggplot(data=wo)+ 
  geom_bar(aes(x=wo_start_date))


# 
ggplot(data=wo)+ 
  geom_bar(aes(x=component_type))+ 
  coord_flip()



############### FAULT CODES TIME SERIES ###################


sensor_files = list.files("Project 1/Data/Fault Codes Time Series")
sensor_files

# Name of the second file
sensor_files[2]

# Lenght of sensor files
length(sensor_files)

s2= read.csv(paste0("Project 1/Data/Fault Codes Time Series/", sensor_files[2]))

# Path to file 
paste0("Project 1/Data/Fault Codes Time Series/", sensor_files[2])
# "Project 1/Data/Fault Codes Time Series/part-00142-tid-6633228128322539575-7fd47406-7ae5-4c5c-8dd3-dfa81eb3c49c-103374-1-c000.csv"

str(s2)
#data.frame:	32 obs. of  7 variables:
# $ Turbine.11               : chr  "Turbine 11" "Turbine 11" "Turbine 11" "Turbine 11" ...
# $ X2021.12.10T23.24.10.000Z: chr  "2021-12-11T03:25:00.000Z" "2021-12-10T21:29:40.000Z" "2021-12-10T21:19:40.000Z" "2021-12-10T23:44:10.000Z" ...
# $ X2021.12.10              : chr  "2021-12-11" "2021-12-10" "2021-12-10" "2021-12-10" ...
# $ X8230                    : int  15001 8230 8230 8230 15001 8230 8230 15001 1001 15038 ...
# $ OEM.Status.Code          : chr  "OEM Status Code" "OEM Status Code" "OEM Status Code" "OEM Status Code" ...
# $ Ice.Detection..Low.Torque: chr  "Grdinv: 1 Interlock" "Ice Detection: Low Torque" "Ice Detection: Low Torque" "Ice Detection: Low Torque" ...
# $ External                 : chr  "Informational" "External" "External" "External" ..."








