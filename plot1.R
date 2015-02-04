##jkim19
##Course Project 1
##Following R script reads in data file and creates a png file of plot1

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
png(filename="plot1.png")
## plot histogram
hist(tempdf2$Global_active_power, col=2, xlab="Global Active Power (kilowatts)", main="Global Active Power")
## close device
dev.off()


