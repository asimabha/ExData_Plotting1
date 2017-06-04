## Exploratory Data Analysis: Project-1
## Getting full dataset
power_data <- read.csv("G:/Exploratory Data Analysis/Assignment-1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data between "2007-02-01" and "2007-02-02"
##
data <- subset(power_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()