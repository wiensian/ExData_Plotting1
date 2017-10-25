library(plyr)

# create plot 3
png("./plot3.png")

# read data, subset and add datetime column
powerData<-read.csv2("./household_power_consumption.txt",na.strings="?",as.is=TRUE)
feb2007<-subset(powerData,powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007")
datetime<-strptime(mapply(paste,feb2007$Date,feb2007$Time),"%d/%m/%Y %H:%M:%S")
feb2007date<-mutate(feb2007,datetime=datetime)

# plot
with(feb2007date,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(feb2007date,lines(datetime,Sub_metering_2,col="red"))
with(feb2007date,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

dev.off()
