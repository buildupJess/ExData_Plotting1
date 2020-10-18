# Plot 3
# Examine how household energy usage varies over a 2-day period in February, 2007
# Date in format dd/mm/yyyy
# use data from the dates 2007-02-01 and 2007-02-02
# Use base plotting system
# read txt data file
# create png plot file with a width of 480 pixels and a height of 480 pixels
# plot sub_metering_1:3 on Y and days of the week on X all on one plot

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?")
#only use date and global active power columns
subsetdata <- data[c(1, 2, 7, 8, 9)]
#only use the 2 day period in Feb 2007
subsetdata <- subsetdata[subsetdata$Date %in% c("1/2/2007", "2/2/2007"), ]
#combine date and time columns to one column
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#write to png file must be done before plot
png("plot3.png", width=480, height=480)
plot(datetime, subsetdata$Sub_metering_1, type = "l", 
     ylab = "Energy Sub Metering", xlab = "")
#plot more y data on same plot
lines(datetime, subsetdata$Sub_metering_2, type = "l", col = "red")
lines(datetime, subsetdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = colnames(subsetdata[3:5]), col = c("black", "red", "blue"), 
       lty = 1, cex = 0.7)
while (!is.null(dev.list()))  dev.off()