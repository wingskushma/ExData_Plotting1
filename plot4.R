
#read the txt file and specify separator, define na, and classes for column
powerCons= read.csv("household_power_consumption.txt", sep = ";", na = "?", colClasses = c("character","character",rep("numeric",7)) )
#take subset for the 2 day period date of feb, as per coourse project the days are the 1st and 2nd feb
powerconSubset = subset(powerCons, Date %in% c("1/2/2007","2/2/2007"))


#convert date and time variables to date/times classes using strptime()
datetime <- strptime(paste(powerconSubset$Date, powerconSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



globalActivePower <- as.numeric(powerconSubset$Global_active_power)
voltage <- as.numeric(powerconSubset$Voltage)
subMetering1 <- as.numeric(powerconSubset$Sub_metering_1)
subMetering2 <- as.numeric(powerconSubset$Sub_metering_2)
subMetering3 <- as.numeric(powerconSubset$Sub_metering_3)
globalReactivePower <- as.numeric(powerconSubset$Global_reactive_power)

#open graphic device for plotting 
png("plot4.png", width=480, height=480)

#change par, set 2*2 row column for plotting mutiple graphs
par(mfrow = c(2, 2))
#plot 1st graph
plot(datetime,globalActivePower, ylab="Global Active Power", xlab = "",type = "l")
#plot 2nd graph goes to row1,col2
plot(datetime, voltage,  ylab="Voltage",xlab="datetime", type="l")

#plot 3rd graph
plot(datetime, subMetering1, ylab="Energy sub metering", xlab="",type="l")

#joining points for submetering2 to graph 3
lines(datetime, subMetering2, type="l", col="red")

#joining points for submetering2
lines(datetime, subMetering3, type="l", col="blue")

#add legends to graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1, bty="n")


#graph 4th
plot(datetime, globalReactivePower, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off() #close the graphical device