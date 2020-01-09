#ExploratoryDataAnalysis_Assignment1_Plot3

#Read in datafile
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Tidy data table
library(dplyr)
data <- tbl_df(data)

#Subset data to select for date
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
dt <- strptime(paste(data1$Date, data1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot
png("plot3.png",width = 480, height = 480)
plot(dt, data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black", ylim = c(0,38))
lines(dt, data1$Sub_metering_2, col = "red")
lines(dt, data1$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
