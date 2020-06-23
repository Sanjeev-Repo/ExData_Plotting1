## Downloading the Data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",'Electric Power Consumption.zip',mode='wb')
unzip('Electric Power Consumption.zip')

## Extracting required Data
data <- read.table('household_power_consumption.txt',skip = 66637,nrows = 2880,sep = ';',header = FALSE)
variables <- read.table('household_power_consumption.txt',nrows = 1,sep = ';',header = FALSE)
names(data) <- variables[1,]

## Constructing the plot
hist(data$Global_active_power,col = 'red',xlab = 'Global Active Power(kilowatts)',ylab = 'Frequency',main = "Global Active Power")

## Creating png file
png('plot1.png',width = 480,height = 480 , units = 'px')
hist(data$Global_active_power,col = 'red',xlab = 'Global Active Power(kilowatts)',ylab = 'Frequency',main = "Global Active Power")
dev.off()
