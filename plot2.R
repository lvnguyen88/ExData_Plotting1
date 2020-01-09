#ExploratoryDataAnalysis_Assignment1_Plot2

#Read in datafile
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Tidy data table
library(dplyr)
data <- tbl_df(data)

#Subset data to select for date
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Subset data to get Global_active_power
data2 <- data1$Global_active_power

#Plot
data3 <- as.numeric(as.character(data2))
png("plot2.png",width = 480, height = 480)
dt <- strptime(paste(data1$Date, data1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
plot(dt, data3, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
