setwd("~/Documents/my classes/Coursera/exploratory data analysis/project 1")
powerdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power1 <- subset(powerdata,powerdata$Date=="1/2/2007")
power2 <- subset(powerdata,powerdata$Date=="2/2/2007")
power <- rbind(power1,power2)
hist(as.numeric(power[,3]),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")