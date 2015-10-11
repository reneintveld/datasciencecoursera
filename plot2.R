
plot2 <- function() 

{
    
## setwd("~/R/working directory course")

fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "household.zip")

unzip("household.zip")

## NB. We only need to read the first 70k rows because 
## these include both days under review

household=read.csv("household_power_consumption.txt", sep = ";", 
                   na.strings="?", nrows=70000)

## Combine Date and Time to one single time class


household$time <- paste(household$Date, household$Time) 
household$time <- strptime(household$time, format =  "%d/%m/%Y %H:%M:%S")

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 

househ <- subset(household, time >= "2007-02-01" & time < "2007-02-03")

plot(househ$time, househ$Global_active_power, type ="l", 
     ylab ="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png")
dev.off()


}

