#!/usr/bin Rscript

#R code for plot1

#Name the columns since I'm only loading in the relevent data
col_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Load only the relevent data (Febuary 1st and 2nd 2007)  Discovered using grep, head, tail at unix command line
df <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = col_names)

date <- as.POSIXct((strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")))

#Set up the plot output file
png("plot3.png", width = 480, height = 480)
plot(date, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
lines(date, df$Sub_metering_2, col = 2)
lines(date, df$Sub_metering_3, col = 4)

legend(x = 1170423780 , y = 39.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black","red", "blue"))

dev.off()

