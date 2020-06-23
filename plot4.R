## Downloading the Data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",'Electric Power Consumption.zip',mode='wb')
unzip('Electric Power Consumption.zip')

## Extracting required Data
data <- read.table('household_power_consumption.txt',skip = 66637,nrows = 2880,sep = ';',header = FALSE)
variables <- read.table('household_power_consumption.txt',nrows = 1,sep = ';',header = FALSE)
names(data) <- variables[1,]

data$Date <- as.Date(data$Date,'%d/%m/%Y')
data$TS <- as.POSIXct(paste(data$Date, data$Time))

## Constructing the plot
par(mfcol=c(2,2))
plot(data$TS,data$Global_active_power,type = 'l',xlab = '',ylab = 'Global Active Power(kilowatts)')
plot(data$TS,data$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
points(data$TS,data$Sub_metering_2,type='l',xlab='',ylab='Energy sub metering',col='red')
points(data$TS,data$Sub_metering_3,type='l',xlab='',ylab='Energy sub metering',col='blue')
legend("topright", col=c("black", "red", "blue"), legend=names(data[,7:9]), lwd=1 , bty = 'n')
plot(data$TS,data$Voltage,type='l',xlab = 'datetime',ylab = 'Voltage')
plot(data$TS,data$Global_reactive_power,type = 'l',xlab = 'datetime',ylab = 'Global_reactive_power')

## Creating png file
png('plot4.png',width = 480,height = 480 , units = 'px')
par(mfcol=c(2,2))
plot(data$TS,data$Global_active_power,type = 'l',xlab = '',ylab = 'Global Active Power(kilowatts)')
plot(data$TS,data$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
points(data$TS,data$Sub_metering_2,type='l',xlab='',ylab='Energy sub metering',col='red')
points(data$TS,data$Sub_metering_3,type='l',xlab='',ylab='Energy sub metering',col='blue')
legend("topright", col=c("black", "red", "blue"), legend=names(data[,7:9]), lwd=1 , bty = 'n')
plot(data$TS,data$Voltage,type='l',xlab = 'datetime',ylab = 'Voltage')
plot(data$TS,data$Global_reactive_power,type = 'l',xlab = 'datetime',ylab = 'Global_reactive_power')
dev.off()