##
##Our overall goal here is simply to examine how household energy usage varies 
##over a 2-day period in February, 2007. 
##In this program, we are constructing following plot
## Line chart showing energy sub metering (1,2,3) over 2 day period
## show the legend with different colors



##------------------------------------------------
## Read file
fileurl <- "./household_power_consumption.txt"
mydata <- read.csv(fileurl, header=TRUE, sep= ";",)
## Filter data that we are interested in
## Alternate is to only read data for specific dates ;
## I tried to use sqldf package and did not save any specific cpu time but there are other methods out.
mydata2 <- subset(mydata, mydata$Date== '1/2/2007' | mydata$Date == '2/2/2007')

## converting data types from character to numeric
mydata2$Sub_metering_1 <- as.numeric(mydata2$Sub_metering_1)
mydata2$Sub_metering_2 <- as.numeric(mydata2$Sub_metering_2)
mydata2$Sub_metering_3 <- as.numeric(mydata2$Sub_metering_3)

##adding Date and Time column together and then converting them to actual Date/Time class in R
temp_date<- paste (mydata2$Date, mydata2$Time, sep = " ")
temp_date<- strptime(temp_date, "%d/%m/%Y %H:%M:%S")

## opening png graphics device file
png(file="plot3.png",width=480, height=480 )

## Plotting Sub_metering_1,2,3 over 2 day period
plot(temp_date,mydata2$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab="")
lines(temp_date,mydata2$Sub_metering_1, type="l", col="black")
lines(temp_date,mydata2$Sub_metering_2,  col="red")
lines(temp_date,mydata2$Sub_metering_3,  col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       box.lty=1,lty=c("solid", "solid", "solid"), cex=0.8,
       text.width=strwidth("sub_metering_1"),adj = 0,
       col=c("black", "red", "blue"))

##close the device
dev.off()
