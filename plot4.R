setwd("~/Documents/my classes/Coursera/exploratory data analysis/project 1")
powerdata <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
power1 <- subset(powerdata,powerdata$Date=="1/2/2007")
power2 <- subset(powerdata,powerdata$Date=="2/2/2007")
power <- rbind(power1,power2)
power[,1]<-as.Date(power[,1],format="%d/%m/%Y")
dates <- power[,1]
times <- power[,2]
datetime <- strptime(paste(dates,times),format="%Y-%m-%d %H:%M:%S")
powernew <- cbind(datetime,power)
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(powernew,{
  plot(powernew$datetime,powernew$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(powernew$datetime,powernew$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(powernew$datetime,powernew$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
  lines(powernew$datetime,powernew$Sub_metering_2,type="l",col="red")
  lines(powernew$datetime,powernew$Sub_metering_3,type="l",col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(powernew$datetime,powernew$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  })
dev.off()

