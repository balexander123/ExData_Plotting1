setwd("/Users/ba25714/ExData_Plotting1")

if(!file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,destfile="household_power_consumption.zip",method="curl")
  unzip("household_power_consumption.zip")
}

consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
consumptionSubSet <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

hist(as.numeric(consumptionSubSet$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


