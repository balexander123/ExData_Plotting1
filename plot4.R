#setwd("/Users/ba25714/ExData_Plotting1")
setwd("/Users/barryalexander/coursera/ExploratoryDataAnalysis/ExData_Plotting1")


if(!file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,destfile="household_power_consumption.zip",method="curl")
  unzip("household_power_consumption.zip")
}

consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
consumptionSubSet <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot4.png", width = 480, height = 480)

dateTime <- strptime(paste(consumptionSubSet$Date, consumptionSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))
with(consumptionSubSet, {
  plot(dateTime,
       as.numeric(consumptionSubSet$Global_active_power),
       type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(dateTime, as.numeric(consumptionSubSet$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
  lines(dateTime, as.numeric(consumptionSubSet$Sub_metering_2), type="l", col="red")
  lines(dateTime, as.numeric(consumptionSubSet$Sub_metering_3), type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1, lwd=2.5, col=c("black", "red", "blue"))
  plot(dateTime,
       as.numeric(consumptionSubSet$Voltage),
       type="l", xlab="", ylab="Voltage")
  plot(dateTime,
       as.numeric(consumptionSubSet$Global_reactive_power),
       type="l", xlab="", ylab="Global_reactive_power")
})

dev.off()
