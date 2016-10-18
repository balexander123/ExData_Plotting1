setwd("/Users/barryalexander/coursera/ExploratoryDataAnalysis/ExData_Plotting1")

if(!file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,destfile="household_power_consumption.zip",method="curl")
  unzip("household_power_consumption.zip")
}


consumption <- read.table("household_power_consumption.txt",
                          header = TRUE, sep = ";",
                          na.strings = "?")

consumption[complete.cases(consumption),]

#consumption[,1] <- strptime(consumption[,1], "%d/%m/%Y")


