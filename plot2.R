# plot2.R
# author:  Joshua Parsell

# This R script reads energy monitoring data from 1-2 Feb 2007 and creates plot2.png
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


# Create a plot2.png graphics device for the plot.  Defaults to 480x480.
png(filename = "plot2.png")

# Plot the Global Active Power versus time over the two day period
plot(data_1_2_feb_07$DateTime, data_1_2_feb_07$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#Close the device.
dev.off()


