# Plot 1
# Examine how household energy usage varies over a 2-day period in February, 2007
# Date in format dd/mm/yyyy
# use data from the dates 2007-02-01 and 2007-02-02
# Use base plotting system
# read txt data file
# create png plot file with a width of 480 pixels and a height of 480 pixels
# plot the global active power on X in a bar chart/histogram

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?")
#only take data from the 2 day period in Feb 2007
subset <- data$Global_active_power[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
#write to png file must be done before plot
png("plot1.png", width=480, height=480)
#plot the global active power on X in a bar chart/histogram
hist(subset, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", xlim = c(0, 6), ylim = c(0, 1200), 
     col = "red")
while (!is.null(dev.list()))  dev.off()