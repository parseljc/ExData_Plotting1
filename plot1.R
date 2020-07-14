# plot1.r
# author:  Joshua Parsell

# This R script reads energy monitoring data from 1-2 Feb 2007 and creates plot1.png
library(dplyr)

# Download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power_cons.zip")

# Unzip the file.
unzip("power_cons.zip")

# Read in all the data, pipe it to a filter for only 1-2 Feb 2007, and store those 2880 values in a variable.
data_1_2_feb_07<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?") %>% filter(Date=="1/2/2007"|Date=="2/2/2007")

# Create a plot1.png graphics device for the plot.  Defaults to 480x480.
png(filename = "plot1.png")

# Plot a histogram of the frequency during which global active power fell within 0.5 kilowatt ranges
hist(data_1_2_feb_07$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close the device.
dev.off()


