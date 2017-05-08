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

## Plot 2 as a line graph for Global Active Power over time
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save the histogram as plot2.png 480x480
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()