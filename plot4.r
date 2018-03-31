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



par(mfrow=c(2,2))


# Plot 1
filteredHousePowerData$FixedDate <- with(filteredHousePowerData, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
plot(filteredHousePowerData$FixedDate, as.numeric(filteredHousePowerData$Global_active_power), type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(filteredHousePowerData$FixedDate, as.numeric(filteredHousePowerData$Voltage), type="l", xlab="Datetime", ylab="Voltage")

# Plot 3
plot(filteredHousePowerData$FixedDate, as.numeric(filteredHousePowerData$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(filteredHousePowerData$FixedDate, as.numeric(filteredHousePowerData$Sub_metering_2), col="red")
lines(filteredHousePowerData$FixedDate, as.numeric(filteredHousePowerData$Sub_metering_3), col="blue")
legend("topright", bty = "n", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col=c("black", "red", "blue"), lty=1, cex=0.6)

# Plot 4
plot(filteredHousePowerData$FixedDate, as.numeric(filteredHousePowerData$Global_reactive_power), type="l", xlab="datetime", ylab="Global reactive Power")


dev.copy (png,'plot4.png')
dev.off()
