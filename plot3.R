# Course Project 1, plot 3

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
DT$Sub_metering_1 = as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 = as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 = as.numeric(DT$Sub_metering_3)

# output png
png("plot3.png",width=480,height=480)
plot(DT$DateTime, DT$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(DT$DateTime, DT$Sub_metering_2, col="red")
lines(DT$DateTime, DT$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=3, col=c("black","red","blue"))
dev.off()