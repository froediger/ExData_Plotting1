########## plot1 ##############

## read data - data table
data<- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?")

## transforms date 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## data dates between 2007-02-01 and 2007-02-02
data2 <-subset(data, data$Date >="2007-02-01" &  data$Date <="2007-02-02")

### Plot1
GAP<-  as.numeric(data2$Global_active_power)

png("plot1.png", width=480, height=480)

hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

