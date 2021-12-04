#Download and unzip file, and read in table
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./household_power_consumption.zip")
unzip("household_power_consumption.zip")
power_data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset to data corresponding to the first or second of Feb 2007
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
power_data_feb2007 <- subset(power_data, Date == "2007-02-01" | Date == "2007-02-02")

#Create and format DateTime variable
power_data_feb2007$DateTime <- paste0(power_data_feb2007$Date, " ", power_data_feb2007$Time)
power_data_feb2007$DateTime <- strptime(power_data_feb2007$DateTime, "%Y-%m-%d %H:%M:%S")

#Create line graph showing energy use by meter across the two days in Feb
png(filename = "plot3.png", width = 480, height = 480)
with(power_data_feb2007, plot(DateTime, Sub_metering_1, type = 'n', ylab = 'Energy sub metering', xlab = ''))
with(power_data_feb2007, lines(DateTime, Sub_metering_1, col = 'black'))
with(power_data_feb2007, lines(DateTime, Sub_metering_2, col = 'red'))
with(power_data_feb2007, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'), cex = 0.9)
dev.off()