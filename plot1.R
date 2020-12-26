#reading data into R
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F,na.strings = "?", dec = ".")
#Subset data
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Plot
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
