########## plot4 ##############


## read data - data table

data<- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?")

## transforms date 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## data dates between 2007-02-01 and 2007-02-02
data2 <-subset(data, data$Date >="2007-02-01" &  data$Date <="2007-02-02")

##datetime
dt <- paste(as.Date(data2$Date), data2$Time)
data2$dt <- as.POSIXct(dt)


### Plot4
GAP<-  as.numeric(data2$Global_active_power)
GRP <- as.numeric(data2$Global_reactive_power)
VOL <- as.numeric(data2$Voltage)
Sub_metering_1<- as.numeric(data2$Sub_metering_1)
Sub_metering_2<- as.numeric(data2$Sub_metering_2)
Sub_metering_3<- as.numeric(data2$Sub_metering_3)



png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data2, { plot(GAP~dt, type="l",
ylab="Global Active Power", xlab="")
plot(VOL~dt, type="l",
ylab="Voltage", xlab="datetime")
plot(Sub_metering_1~dt, type="l",
ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~dt,col='Red')
lines(Sub_metering_3~dt,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(GRP~dt, type="l",
ylab="Global_rective_power ",xlab="datetime") })

dev.off()