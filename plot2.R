#!/usr/bin Rscript

#R code for plot1

#Name the columns since I'm only loading in the relevent data
col_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Load only the relevent data (Febuary 1st and 2nd 2007)  Discovered using grep, head, tail at unix command line
df <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = col_names)

date <- as.POSIXct((strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")))

#Set up the plot output file
png("plot2.png", width = 480, height = 480)

plot(date, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
