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

##
## Generate the histogram plot to the PNG graphics device file as required
##

png(filename = "../datasciencecoursera/ExData_Plotting1/plot1.png")

hist(power$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()