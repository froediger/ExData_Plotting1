########## plot2 ##############

## read data - data table

data<- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?")

## transforms date 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## data dates between 2007-02-01 and 2007-02-02
data2 <-subset(data, data$Date >="2007-02-01" &  data$Date <="2007-02-02")

##datetime
dt <- paste(as.Date(data2$Date), data2$Time)
data2$dt <- as.POSIXct(dt)


### Plot2
GAP<-  as.numeric(data2$Global_active_power)

png("plot2.png", width=480, height=480)

plot(GAP~data2$dt, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

dev.off()

