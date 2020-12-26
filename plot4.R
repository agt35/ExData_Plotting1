library(dplyr)
#reading data into R
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F,na.strings = "?", dec = ".")
#Subset data
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Change date class

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- mutate(data, date_time = as.POSIXct(paste(data$Date, data$Time, sep=" "), template = "%d/%m/%Y %H:%M:%S", ))

#plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#First plot
plot( data$date_time,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#second plot
with(data, plot(date_time, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))

#third plot
plot(data$date_time, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy Sub Metering", xlab = "")
lines(data$date_time, data$Sub_metering_2, type = "l", col = "red")
lines(data$date_time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright",lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#fourth plot
plot(data$date_time, data$Global_reactive_power, ylab = "Global_reactive_power", xlab ="datetime", type = "l")

dev.off()

