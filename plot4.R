library(plyr)

# create plot 4
png("./plot4.png")
par(mfrow=c(2,2))

# read data, subset, create column with datetime
powerData<-read.csv2("./household_power_consumption.txt",na.strings="?",as.is=TRUE)
feb2007<-subset(powerData,powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007")
datetime<-strptime(mapply(paste,feb2007$Date,feb2007$Time),"%d/%m/%Y %H:%M:%S")
feb2007date<-mutate(feb2007,datetime=datetime)

# plot
with(feb2007date,{
plot(datetime,feb2007date$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(datetime,Voltage,type="l")

plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

plot(datetime,Global_reactive_power,type="l")
})

dev.off()
