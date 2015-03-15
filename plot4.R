# Course Project 1, plot 4

library(data.table)
DT = fread("data/household_power_consumption.txt")

# create date/time combo variable
DT$DateTime = paste(DT$Date, DT$Time)

# subset for only the target dates
DT$Date = as.Date(DT$Date, "%d/%m/%Y")
DT = subset(DT, Date == "2007-02-01" | Date=="2007-02-02")

# format datetime variables into POSIX for charting
DT$DateTime = as.POSIXct(DT$DateTime, format="%d/%m/%Y %H:%M:%S")

# format other variables
DT$Global_active_power = as.numeric(DT$Global_active_power)
DT$Global_reactive_power = as.numeric(DT$Global_reactive_power)
DT$Global_intensity = as.numeric(DT$Global_intensity)
DT$Voltage = as.numeric(DT$Voltage)
DT$Sub_metering_1 = as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 = as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 = as.numeric(DT$Sub_metering_3)

# output png
png("plot4.png",width=480,height=480)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma= c(0,0,2,0))

with(DT, {

  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

  plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")

  plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=3, col=c("black","red","blue"))
  
  plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  
})  

dev.off()