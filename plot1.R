#Creates plot 1 for course assignment 1
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data/electricpowerconsumption.csv", method = "curl")
#setwd("~/Documents/learning/exploratory data analysis")

#Read data
epc <- read.csv("data/household_power_consumption.txt", header = TRUE, sep = ";")

#Process data
#create a datetime field
epc$DateTime <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date,format = "%d/%m/%Y")
#Select 2 day period as requested
epc2Day <- epc[epc$Date == "2007-02-01" | epc$Date == "2007-02-02",]
#convert numeric fields to numeric
epc2Day$Global_active_power <- as.numeric(as.character(epc2Day$Global_active_power))
epc2Day$Sub_metering_1 <- as.numeric(as.character(epc2Day$Sub_metering_1))
epc2Day$Sub_metering_2 <- as.numeric(as.character(epc2Day$Sub_metering_2))
epc2Day$Sub_metering_3 <- as.numeric(as.character(epc2Day$Sub_metering_3))
epc2Day$Voltage <- as.numeric(as.character(epc2Day$Voltage))
epc2Day$Global_reactive_power <- as.numeric(as.character(epc2Day$Global_reactive_power))

#Set global parameter for label size
par(cex = .5)

#Initialize png graphics device
png(filename = "plot1.png")

#Makes plot 1, a histogram of Global Active Power
hist(epc2Day$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Turn off png graphics device
dev.off()
