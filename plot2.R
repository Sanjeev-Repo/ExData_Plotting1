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
plot(data$TS,data$Global_active_power,type = 'l',xlab = '',ylab = 'Global Active Power(kilowatts)')

## Creating png file
png('plot2.png',width = 480,height = 480 , units = 'px')
plot(data$TS,data$Global_active_power,type = 'l',xlab = '',ylab = 'Global Active Power(kilowatts)')
dev.off()
