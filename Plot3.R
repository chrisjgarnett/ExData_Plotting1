## Script to re-create Plot2.png
## Assumes source data downloaded and unzipped
## Read in of raw data
powerConsumption <- read.delim("household_power_consumption.txt",sep=";")
## Get subset of dates that we are interested in
daysinterested <- subset(powerConsumption,Date == "1/2/2007" | Date == "2/2/2007")
## 
## Convert Sub_metering_1 and Sub_metering_2 to numeric from factor - plot function requires numeric input
## Sub_metering_3 already in correct format
daysinterested$Sub_metering_1 <- as.numeric(levels(daysinterested$Sub_metering_1))[daysinterested$Sub_metering_1]
daysinterested$Sub_metering_2 <- as.numeric(levels(daysinterested$Sub_metering_2))[daysinterested$Sub_metering_2]
## Convert time into correct format
daysinterested$Date <- as.Date(daysinterested$Date,"%d/%m/%Y")
daysinterested$DateTime <- as.POSIXct(paste(as.Date(daysinterested$Date),daysinterested$Time))
## Open PNG file
png(filename = "Plot3.png")
plot(daysinterested$Sub_metering_1~daysinterested$DateTime,type="l",ylab = "Energy sub metering",xlab="")
lines(daysinterested$Sub_metering_2~daysinterested$DateTime,col="red")
lines(daysinterested$Sub_metering_3~daysinterested$DateTime,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1)
dev.off()
## Clean up environment
rm(list=ls())