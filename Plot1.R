## Script to re-create Plot1.png
## Assumes source data downloaded and unzipped
## Read in of raw data
powerConsumption <- read.delim("household_power_consumption.txt",sep=";")
## Get subset of dates that we are interested in
daysinterested <- subset(powerConsumption,Date == "1/2/2007" | Date == "2/2/2007")
## 
## Convert Global_active_power to numeric from factor - hist function requires numeric input
daysinterested$Global_active_power <- as.numeric(levels(daysinterested$Global_active_power))[daysinterested$Global_active_power]
png(filename = "Plot1.png")
hist(daysinterested$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
## Clean up environment
rm(list=ls())