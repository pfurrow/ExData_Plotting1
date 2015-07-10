##
## Read the complete power consumption file, then subset to select only 
## the 2 days to be plotted (01Feb2007 - 02Feb2007)
##

power <- read.table("data/household_power_consumption.txt", na.strings = "?",
                    stringsAsFactors = FALSE, sep = ";", header = TRUE, 
                    colClasses = c("character","character","numeric",
                                   "numeric","numeric","numeric","numeric",
                                   "numeric","numeric"), comment.char = "")

power <- power[(power$Date == "1/2/2007" | power$Date == "2/2/2007"),]

power$DateTime <- strptime(paste(power$Date, power$Time), 
                           "%d/%m/%Y %H:%M:%S", tz="GMT")

##
## Generate 4 separate charts to the PNG graphics device file as required
##

png(filename = "../datasciencecoursera/ExData_Plotting1/plot4.png")

par(mfcol = c(2,2), mar = c(4, 4, 2, 2))

plot(power$DateTime, power$Global_active_power, type="l", xlab = "", 
     ylab = "Global Active Power")

plot(power$DateTime, power$Sub_metering_1, type="l", xlab = "", 
     ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, type="l", col = "red")
lines(power$DateTime, power$Sub_metering_3, type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2, col=c("black","red","blue"), lty=c(1,1,1), bty="n")

plot(power$DateTime, power$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(power$DateTime, power$Global_reactive_power, type="l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()