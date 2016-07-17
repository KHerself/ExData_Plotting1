#Plot 1

#Input the data
powercon <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Subset the dates I need (Feb 1-2, 2007)
powerconfeb12 <- subset(powercon, powercon$Date == "1/2/2007" | powercon$Date == "2/2/2007")

#Make the dates into real dates
powerconfeb12$Date <- strptime(powerconfeb12$Date, format="%d/%m/%Y")

#Make a histogram with the proper color (red) and labels (defined within the main hist function), size (480x480), and output (png)
png(filename="plot1.png", width=480, height=480, units="px", pointsize=12, bg="white")
hist(powerconfeb12$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
