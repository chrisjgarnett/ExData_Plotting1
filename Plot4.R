## Script to re-create Plot4.png
## Assumes source data downloaded and unzipped
## Read in of raw data
powerConsumption <- read.delim("household_power_consumption.txt",sep=";")
## Get subset of dates that we are interested in
daysinterested <- subset(powerConsumption,Date == "1/2/2007" | Date == "2/2/2007")
## Convert Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, and Sub_metering_2 to numeric from factor - plot function requires numeric input
daysinterested$Global_active_power <- as.numeric(levels(daysinterested$Global_active_power))[daysinterested$Global_active_power]
daysinterested$Global_reactive_power <- as.numeric(levels(daysinterested$Global_reactive_power))[daysinterested$Global_reactive_power]
daysinterested$Sub_metering_1 <- as.numeric(levels(daysinterested$Sub_metering_1))[daysinterested$Sub_metering_1]
daysinterested$Sub_metering_2 <- as.numeric(levels(daysinterested$Sub_metering_2))[daysinterested$Sub_metering_2]
daysinterested$Voltage <- as.numeric(levels(daysinterested$Voltage))[daysinterested$Voltage]
## Convert time into correct format
daysinterested$Date <- as.Date(daysinterested$Date,"%d/%m/%Y")
daysinterested$DateTime <- as.POSIXct(paste(as.Date(daysinterested$Date),daysinterested$Time))
## Open PNG file
png(filename = "Plot4.png")
## Set up 2x2 Plots
par(mfrow=c(2,2))
plot(daysinterested$Global_active_power~daysinterested$DateTime,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
plot(daysinterested$Voltage~daysinterested$DateTime,type="l",ylab = "Voltage",xlab="datetime")
plot(daysinterested$Sub_metering_1~daysinterested$DateTime,type="l",ylab = "Energy sub metering",xlab="")
lines(daysinterested$Sub_metering_2~daysinterested$DateTime,col="red")
lines(daysinterested$Sub_metering_3~daysinterested$DateTime,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1)
plot(daysinterested$Global_reactive_power~daysinterested$DateTime,type="l",ylab = "Global_reactive_power",xlab="datetime")
dev.off()
## Clean up environment
rm(list=ls())