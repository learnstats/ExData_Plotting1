## Reading all dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting the data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates and submetering
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subM1 <- as.numeric(data$Sub_metering_1)
subM2 <- as.numeric(data$Sub_metering_2)
subM3 <- as.numeric(data$Sub_metering_3)
gap <- as.numeric(data$Global_active_power)
grp <- as.numeric(data$Global_reactive_power)
v <- as.numeric(data$Voltage)

## plot 4
par(mfrow = c(2, 2))
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")
plot(datetime, grp, type="l", xlab="datetime", ylab="Global Reactive Power")
plot(datetime, v, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subM1, type="l", xlab ="", ylab="Energy Submetering")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Submetering_1", "Submetering_2", "Submetering_3"), bty="o", lwd=2.0, lty=1, col=c("black", "red", "blue"))

## Saving plot in the current directory and closing the file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()