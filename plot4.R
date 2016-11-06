## Plot 4
library(dplyr)
library(data.table)
setwd("C:/Users/Farts of War/Desktop/Course Project 1/data")
data_file <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)


## subset data for 2 day period in Feb 2007
Feb_date <- data_file[data_file$Date %in% c("1/2/2007", "2/2/2007"),]
Feb_time <- strptime(paste(Feb_date$Date, Feb_date$Time, sep= " "), "%d/%m/%Y %H:%M:%S")


png("plot4.png", width = 480, height = 480)
## divide the graphics window into 2 x 2 Matrix
par(mfrow=(c(2,2)))

## Position One
plot(Feb_time, Feb_date$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Position Two
plot(Feb_time, Feb_date$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Position Three
plot(Feb_time, Feb_date$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Feb_time, Feb_date$Sub_metering_2, type="l", col="red")
lines(Feb_time, Feb_date$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Position Four
plot(Feb_time, Feb_date$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()