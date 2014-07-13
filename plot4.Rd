#PLOT 4
# To read data with selected rows between 2007-02-01 and 2007-02-02 due to 
# my limited computer capability after viewing the data thru EXCEL

rawdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings = "?", skip=66636, nrows= 2880, stringsAsFactors=TRUE)

names(rawdata) <-c("Date","Time","Global_active_power" ,"Global_reactive_power","Voltage",
"Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3")

rawdata$date_time <- paste(rawdata$Date, rawdata$Time) 

rawdata$day <- strptime(rawdata$date_time, format = "%d/%m/%Y %H:%M:%S")

# to set a multichart
par(mfrow = c(2,2))

#plot4.1 Global Active Power on left top
plot(rawdata[,12], rawdata[,3],type = "l", ylab="Global Active Power", xlab="")

##plot4.2 voltage on right top 
plot(rawdata[,12], rawdata[,5],type = "l", ylab="Voltage", xlab="day/time")

##plot4.3 "Energy sub metering" on left bottom
plot(rawdata[,12], rawdata[,7],type = "l", ylab="Energy sub metering", xlab="", ylim = c(0,40))
par(new =T)
plot(rawdata[,12], rawdata[,8],type = "l", ylab="Energy sub metering", xlab="", col="red", ylim = c(0,40))
par(new =T)
plot(rawdata[,12], rawdata[,9],type = "l", ylab="Energy sub metering", xlab="", col="blue", ylim = c(0,40))
legend("topright", names(rawdata[,7:9]), lty=1, col=c('black', 'red', 'blue'))
par(new = F)

##plot4.4 "Global_reactive_power" on right bottom
plot(rawdata[,12], rawdata[,4],type = "l",ylab="Global_reactive_power", xlab="day/time")