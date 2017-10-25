# create plot 1
png("./plot1.png")

# read data and subset
powerData<-read.csv2("./household_power_consumption.txt",na.strings="?",as.is=TRUE)
feb2007<-subset(powerData,powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007")

# plot histogram
hist(as.numeric(feb2007new$Global_active_power),xlab="Global active power (kilowatts)",main="Global Active Power",col="red")

dev.off()
