## Plot 1

library(dplyr)
library(data.table)
setwd("C:/Users/Farts of War/Desktop/Course Project 1/data")
data_file <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)


## subset data for 2 day period in Feb 2007
Feb_date <- data_file[data_file$Date %in% c("1/2/2007", "2/2/2007"),]

png("plot1.png", width = 480, height = 480)
hist(Feb_date$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active Power (kilowatts)")
dev.off()
