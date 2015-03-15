# Course Project 1, Plot 1

library(data.table)
DT = fread("data/household_power_consumption.txt")

# create date/time variables
DT$DateTime = paste(DT$Date, DT$Time)

# subset for the target dates
DT$Date = as.Date(DT$Date, "%d/%m/%Y")
DT = subset(DT, Date == "2007-02-01" | Date=="2007-02-02")

# format datetime variables into POSIX for charting
DT$DateTime = as.POSIXct(DT$DateTime, format="%d/%m/%Y %H:%M:%S")

# format other variable
DT$Global_active_power = as.numeric(DT$Global_active_power)

# output png chart
png("plot1.png",width=480,height=480)
hist(DT$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()