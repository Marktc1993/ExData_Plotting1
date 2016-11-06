## Plot 3

library(dplyr)
library(data.table)
setwd("C:/Users/Farts of War/Desktop/Course Project 1/data")
data_file <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)


## subset data for 2 day period in Feb 2007
Feb_date <- data_file[data_file$Date %in% c("1/2/2007", "2/2/2007"),]
Feb_time <- strptime(paste(Feb_date$Date, Feb_date$Time, sep= " "), "%d/%m/%Y %H:%M:%S")



png("plot3.png", width=480, height=480)
plot(Feb_time, Feb_date$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Feb_time, Feb_date$Sub_metering_2, type="l", col="red")
lines(Feb_time, Feb_date$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()