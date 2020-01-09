#ExploratoryDataAnalysis_Assignment1_Plot4

#Read in datafile
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Tidy data table
library(dplyr)
data <- tbl_df(data)

#Subset data to select for date
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
dt <- strptime(paste(data1$Date, data1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Create graphics device for plot
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

#Plot 1
plot(dt, data3, type = "l", xlab = "", ylab = "Global Active Power")

#Plot 2
voltage <- as.numeric(as.character(data1$Voltage))
plot(dt, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(dt, data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black", ylim = c(0,38))
lines(dt, data1$Sub_metering_2, col = "red")
lines(dt, data1$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 4
GRP <- as.numeric(as.character(data1$Global_reactive_power))
plot(dt, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
