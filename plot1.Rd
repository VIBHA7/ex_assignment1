# To read data with selected rows between 2007-02-01 and 2007-02-02 due to 
# my limited computer capability after viewing the data thru EXCEL

rawdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings = "?", skip=66636, nrows= 2880, stringsAsFactors=TRUE)

names(rawdata) <- c("Date","Time","Global_active_power" ,"Global_reactive_power","Voltage",
"Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3")

#plot1 thru my directory and R on desktop
hist(rawdata[,3],main="Global Active Power",xlab="Global Active Power (kilowats)", col = "red")