##jkim19
##Course Project 1
##Following R script reads in data file and creates a png file of plot4

## read in household_power_consumption.txt file
hpcdf <- read.table("household_power_consumption.txt", sep=";", colClasses=c("character","character",rep("numeric",7)), header=TRUE, na.strings="?")
## create new column DateTime
hpcdf$DateTime <- paste(hpcdf$Date, hpcdf$Time)
hpcdf$DateTime <- strptime(hpcdf$DateTime, format=("%d/%m/%Y %H:%M:%S"))
## filter data for dates before date specified 
tempdf <- hpcdf[hpcdf$DateTime < strptime("2007-02-03",format="%Y-%m-%d"),]
## filter data for dates after date specified
tempdf2 <- tempdf[tempdf$DateTime >= strptime("2007-02-01",format="%Y-%m-%d"),]

## open png device
png(filename="plot4.png")
## plot
par(mfrow = c(2, 2))
with(tempdf2,{
  plot(x=tempdf2$DateTime, y=tempdf2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)");
  plot(x=tempdf2$DateTime, y=tempdf2$Voltage,type="l",xlab="datetime",ylab="Voltage");
  with(tempdf2, plot(x=tempdf2$DateTime,y=tempdf2$Sub_metering_1,xlab="",ylab="Energy sub metering",type='l'))
  with(tempdf2, lines(tempdf2$DateTime,y=tempdf2$Sub_metering_2,col=2))
  with(tempdf2, lines(tempdf2$DateTime,y=tempdf2$Sub_metering_3,col=4))
  legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1);
  plot(x=tempdf2$DateTime, y=tempdf2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power");
})
## close device
dev.off()

