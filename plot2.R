#Plot 2

#Input the data
powercon <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Subset the dates I need (Feb 1-2, 2007)
powerconfeb12 <- subset(powercon, powercon$Date == "1/2/2007" | powercon$Date == "2/2/2007")

#Make the dates into real dates
powerconfeb12$Date <- strptime(powerconfeb12$Date, format="%d/%m/%Y")

#Make a png plot
png(filename="plot2.png", width=480, height=480, units="px", pointsize=12, bg="white")
with(powerconfeb12, plot(Global_active_power, type="l", ann=FALSE, xaxt="n"))
title(ylab="Global Active Power (kilowatts)")
axis(side=1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()
