#ExploratoryDataAnalysis_Assignment1_Plot1

#Read in datafile
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Tidy data table
library(dplyr)
data <- tbl_df(data)

#Subset data to select for date
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Subset data to get Global_active_power
data2 <- data1$Global_active_power

#Plot histogram
data3 <- as.numeric(as.character(data2))
png("plot1.png", width = 480, height = 480)
hist(data3, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
