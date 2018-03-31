library(dplyr)
library(purrr)
library(data.table)

### Load data
setwd("C:/Users/rodgesc/Documents/R/coursera/exploratory data analysis/ExData_Plotting1-master/")
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename = "household_power_consumption.zip"
download.file(url, filename)
unzip(filename)

filename = "household_power_consumption.txt"
housePowerData <-  read.csv(filename, sep=";", stringsAsFactors = FALSE)
housePowerData$FixedDate <- as.Date(housePowerData$Date,format="%d/%m/%Y")
filteredHousePowerData <- filter(housePowerData, (FixedDate == as.Date("2007-02-01", format="%Y-%m-%d") | FixedDate == as.Date("2007-02-02",format="%Y-%m-%d")))

# plot 1

hist(as.numeric(filteredHousePowerData$Global_active_power), xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="Red")
dev.copy (png,'plot1.png')
dev.off()
