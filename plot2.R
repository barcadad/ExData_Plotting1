# Course Project 1, Plot 2

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

# output png
png("plot2.png",width=480,height=480)
plot(DT$DateTime, DT$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()