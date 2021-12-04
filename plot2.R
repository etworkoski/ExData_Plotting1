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

#Create line graph plotting global active power versus day of week for Feb 1 and 2, 2007
png(filename = "plot2.png", width = 480, height = 480)
with(power_data_feb2007, plot(DateTime,Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
lines(power_data_feb2007$DateTime, power_data_feb2007$Global_active_power)
dev.off()