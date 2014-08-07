##
##Our overall goal here is simply to examine how household energy usage varies 
##over a 2-day period in February, 2007. 
##In this program, we are constructing following plot
## Histogram showing Global Active Power over 2 day period
##------------------------------------------------
## Read file
fileurl <- "./household_power_consumption.txt"
mydata <- read.csv(fileurl, header=TRUE, sep= ";",)
## Filter data that we are interested in
## Alternate is to only read data for specific dates ;
## I tried to use sqldf package and did not save any specific cpu time but there are other methods out.
mydata2 <- subset(mydata, mydata$Date== '1/2/2007' | mydata$Date == '2/2/2007')

## converting data types from character to numeric
mydata2$Global_active_power <- as.numeric(mydata2$Global_active_power)

## opening png graphics device file
png(file="plot1.png",width=480, height=480 )

## Plotting Global_Active_Power over 2 day period
hist(mydata2$Global_active_power, col="red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

##close the device
dev.off()
