
plot1 <- function() 

{
    
## setwd("~/R/working directory course")

fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "household.zip")

unzip("household.zip")

## NB. We only need to read the first 70k rows because 
## these include both days under review

household=read.csv("household_power_consumption.txt", sep = ";", 
                   na.strings="?", nrows=70000)




## You may find it useful to convert the Date and Time variables to 
## Date/Time classes in R using the strptime() and as.Date() functions.

household$Date <- as.Date(household$Date, format = "%d/%m/%Y")

household$Time <- strptime(household$Time, format = "%H:%M:%S")

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 

househ <- subset(household, Date == "2007-02-01" | Date == "2007-02-02")

hist(househ$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="Red")

dev.copy(png, file = "plot1.png")
dev.off()


}