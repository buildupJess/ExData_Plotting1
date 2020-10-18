# Plot 4
# Examine how household energy usage varies over a 2-day period in February, 2007
# Date in format dd/mm/yyyy
# use data from the dates 2007-02-01 and 2007-02-02
# Use base plotting system
# read txt data file
# create png plot file with a width of 480 pixels and a height of 480 pixels
# plot 4 plots- topleft: global active power, topright: voltage, 
# bottomleft: energy sub metering, bottomright: global reactive power

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?")
#only use the 2 day period in Feb 2007
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
#combine date and time columns to one column
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#write to png file must be done before plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
#plot the global active power on X
plot(datetime, subsetdata$Global_active_power, main = "Global Active Power", type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
#plot voltage
plot(datetime, subsetdata$Voltage, type = "l", ylab = "Voltage")
#plot sub_metering
plot(datetime, subsetdata$Sub_metering_1, type = "l", 
     ylab = "Energy Sub Metering", xlab = "")
lines(datetime, subsetdata$Sub_metering_2, type = "l", col = "red")
lines(datetime, subsetdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = colnames(subsetdata[7:9]), col = c("black", "red", "blue"), 
       lty = 1, cex = 0.7, bty = "n")
#plot global reactive power
plot(datetime, subsetdata$Global_reactive_power, type = "l", 
     ylab = "Global Reactive Power (kilowatts)")
while (!is.null(dev.list()))  dev.off()