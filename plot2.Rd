# To read data with selected rows between 2007-02-01 and 2007-02-02 due to 
# my limited computer capability after viewing the data thru EXCEL

rawdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings = "?", skip=66636, nrows= 2880, stringsAsFactors=TRUE)

names(rawdata) <- c("Date","Time","Global_active_power" ,"Global_reactive_power","Voltage",
"Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3")

##plot2 new variables are created
rawdata$date_time <- paste(rawdata$Date, rawdata$Time) 

rawdata$day <- strptime(rawdata$date_time, format = "%d/%m/%Y %H:%M:%S")

plot(rawdata[,12], rawdata[,3],type = "l", ylab="Global Active Power", xlab="")