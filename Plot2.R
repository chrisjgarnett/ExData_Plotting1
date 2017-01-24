## Script to re-create Plot2.png
## Assumes source data downloaded and unzipped
## Read in of raw data
powerConsumption <- read.delim("household_power_consumption.txt",sep=";")
## Get subset of dates that we are interested in
daysinterested <- subset(powerConsumption,Date == "1/2/2007" | Date == "2/2/2007")
## 
## Convert Global_active_power to numeric from factor - hist function requires numeric input
daysinterested$Global_active_power <- as.numeric(levels(daysinterested$Global_active_power))[daysinterested$Global_active_power]
## Convert time into correct format
daysinterested$Date <- as.Date(daysinterested$Date,"%d/%m/%Y")
daysinterested$DateTime <- as.POSIXct(paste(as.Date(daysinterested$Date),daysinterested$Time))
## Open PNG file
png(filename = "Plot2.png")
plot(daysinterested$Global_active_power~daysinterested$DateTime,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()
## Clean up environment
rm(list=ls())