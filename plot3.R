
#read the txt file and specify separator, define na, and classes for column
powerCons= read.csv("household_power_consumption.txt", sep = ";", na = "?", colClasses = c("character","character",rep("numeric",7)) )
#take subset for the 2 day period date of feb, as per coourse project the days are the 1st and 2nd feb
powerconSubset = subset(powerCons, Date %in% c("1/2/2007","2/2/2007"))


#convert date and time variables to date/times classes using strptime()
datetime <- strptime(paste(powerconSubset$Date, powerconSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(powerconSubset$Sub_metering_1)
subMetering2 <- as.numeric(powerconSubset$Sub_metering_2)
subMetering3 <- as.numeric(powerconSubset$Sub_metering_3)

#open graphic device for plotting 
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, ylab="Energy sub metering", xlab="",type="l")

#joining points for submetering2
lines(datetime, subMetering2, type="l", col="red")

#joining points for submetering2
lines(datetime, subMetering3, type="l", col="blue")

#add legends to graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1)
dev.off() #close the graphical device