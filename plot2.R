
#read the txt file and specify separator, define na, and classes for column
powerCons= read.csv("household_power_consumption.txt", sep = ";", na = "?", colClasses = c("character","character",rep("numeric",7)) )
#take subset for the 2 day period date of feb, as per coourse project the days are the 1st and 2nd feb
powerconSubset = subset(powerCons, Date %in% c("1/2/2007","2/2/2007"))


#convert date and time variables to date/times classes using strptime()
datetime <- strptime(paste(powerconSubset$Date, powerconSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(powerconSubset$Global_active_power)

#open graphic device for plotting 
png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower, ylab="Global Active Power (kilowatts)", xlab = "",type = "l") #type l for lines
dev.off() #close the graphical device