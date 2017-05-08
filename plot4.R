if(!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="rawData.zip", method="curl")
  unzip ("rawData.zip", exdir = "./")}

## Read in raw data
rawData <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- rawData[(rawData$Date=="1/2/2007" | rawData$Date=="2/2/2007" ), ]

## Converting dates in object 'data'
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

## Plot 4 as a matrix of four sets of graphs looking at Global Active Power
par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="", cex = 0.5)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub Meetering", xlab="", cex = 0.5)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power",xlab="datetime", cex = 0.5)
})

## Save the histogram as plot4.png 480x480
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()