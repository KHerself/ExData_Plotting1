#Plot 3

#Input the data
powercon <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Subset the dates I need (Feb 1-2, 2007)
powerconfeb12 <- subset(powercon, powercon$Date == "1/2/2007" | powercon$Date == "2/2/2007")

#Make the dates into real dates
powerconfeb12$Date <- strptime(powerconfeb12$Date, format="%d/%m/%Y")

#Make a png plot
png(filename="plot3.png", width=480, height=480, units="px", pointsize=12, bg="white")
with(powerconfeb12, plot(Sub_metering_1, type="l", col="black", ylim=c(0,max(Sub_metering_1)), ann=FALSE, xaxt="n"))
par(new=TRUE)
with(powerconfeb12, plot(Sub_metering_2, type="l", col="red", ylim=c(0, max(Sub_metering_1)), ann=FALSE, xaxt="n"))
par(new=TRUE)
with(powerconfeb12, plot(Sub_metering_3, type="l", col="blue", ylim=c(0, max(Sub_metering_1)), ann=FALSE, xaxt="n"))

title(ylab="Energy sub metering")
axis(side=1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()
