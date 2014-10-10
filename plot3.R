#Creates plot 3 for course assignment 1
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
png(filename = "plot3.png")

#Plot 3
par(new=F)
plot(epc2Day$DateTime,epc2Day$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ylim=range(c(epc2Day$Sub_metering_1,epc2Day$Sub_metering_2,epc2Day$Sub_metering_3)))
par(new=T)
points(epc2Day$DateTime,epc2Day$Sub_metering_2, type = "l", xlab = "", ylab = "", col = 2, ylim=range(c(epc2Day$Sub_metering_1,epc2Day$Sub_metering_2,epc2Day$Sub_metering_3)))
points(epc2Day$DateTime,epc2Day$Sub_metering_3, type = "l", xlab = "", ylab = "", col = 4, ylim=range(c(epc2Day$Sub_metering_1,epc2Day$Sub_metering_2,epc2Day$Sub_metering_3)))
#Make Legend
legend("topright",pch=1,col=c(1,2,4),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(new=F)

#Turn off png graphics device
dev.off()
