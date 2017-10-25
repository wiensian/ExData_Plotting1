library(plyr)

#create plot 2
png("./plot2.png")

# read data, subset and add datetime column
powerData<-read.csv2("./household_power_consumption.txt",na.strings="?",as.is=TRUE)
feb2007<-subset(powerData,powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007")
datetime<-strptime(mapply(paste,feb2007$Date,feb2007$Time),"%d/%m/%Y %H:%M:%S")
feb2007date<-mutate(feb2007,datetime=datetime)

# plot
plot(feb2007date$datetime,feb2007date$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()
