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
     
       ## Plot 1 as a historgram for Global Active Power and Frequency, using red color
       hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
     
       ## Save the histogram as plot1.png 480x480
       dev.copy(png, file="plot1.png", height=480, width=480)
     dev.off()