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
plot(powernew$datetime,powernew$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")