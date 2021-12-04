#Download and unzip file, and read in table
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./household_power_consumption.zip")
unzip("household_power_consumption.zip")
power_data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset to data corresponding to the first or second of Feb 2007
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
power_data_feb2007 <- subset(power_data, Date == "2007-02-01" | Date == "2007-02-02")

#Create plot showing histogram of global active power during Feb 1st and 2nd, 2007
png(filename = "plot1.png", width = 480, height = 480)
par(mar = c(4,4,2,2))
hist(power_data_feb2007$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     cex.lab = 0.9,
     cex.axis=0.9)
dev.off()