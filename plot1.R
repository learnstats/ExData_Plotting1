## Reading all dataset
data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## plot 1
hist(data$Global_active_power, main="Global Active Power", 
     ylab="Frequency", xlab="Global Active Power", col="Red")

## Saving plot in the current directory and closing the file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()