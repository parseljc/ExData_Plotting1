# plot3.R
# author:  Joshua Parsell

# This R script reads energy monitoring data from 1-2 Feb 2007 and creates plot3.png
library(dplyr)
library(lubridate)

# Download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power_cons.zip")

# Unzip the file.
unzip("power_cons.zip")

# Read in all the data, pipe it to a filter for only 1-2 Feb 2007, and store those 2880 values in a variable.
data_1_2_feb_07<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?") %>% filter(Date=="1/2/2007"|Date=="2/2/2007")

# Add a column for DateTime by pasting Date and Time together.
data_1_2_feb_07<-mutate(data_1_2_feb_07, DateTime = dmy_hms(paste0(data_1_2_feb_07$Date," ",data_1_2_feb_07$Time)))


# Create a plot3.png graphics device for the plot.  Defaults to 480x480.
png(filename = "plot3.png")

# Plot the three Energy Sub Metering values versus time over the two day period
plot(data_1_2_feb_07$DateTime, data_1_2_feb_07$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(data_1_2_feb_07$DateTime, data_1_2_feb_07$Sub_metering_2, xlab = "", type = "l", col = "red")
lines(data_1_2_feb_07$DateTime, data_1_2_feb_07$Sub_metering_3, xlab = "", type = "l", col = "blue")

# Put the legend in the top right corner
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

#Close the device.
dev.off()


