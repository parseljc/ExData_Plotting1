# plot1.r
# author:  Joshua Parsell

# This R script reads energy monitoring data from 1-2 Feb 2007 and creats plot1.png
library(dplyr)

# Download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power_cons.zip")

# Unzip the file.
unzip("power_cons.zip")

