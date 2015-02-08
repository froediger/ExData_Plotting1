########## plot3 ##############

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
Sub_metering_1<- as.numeric(data2$Sub_metering_1)
Sub_metering_2<- as.numeric(data2$Sub_metering_2)
Sub_metering_3<- as.numeric(data2$Sub_metering_3)


png("plot3.png", width=480, height=480)

with(data2, {plot(Sub_metering_1~dt, type="l",
ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~dt,col='Red')
lines(Sub_metering_3~dt,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
