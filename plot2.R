library(dplyr)
#reading data into R
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F,na.strings = "?", dec = ".")
#Subset data
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Change date class

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- mutate(data, date_time = as.POSIXct(paste(data$Date, data$Time, sep=" "), template = "%d/%m/%Y %H:%M:%S", ))

#Plot
png("plot2.png", width = 480, height = 480)
plot( data$date_time,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
