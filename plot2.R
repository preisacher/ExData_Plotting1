#
# I put my file in a subdir called data then used relative pathing so you may use this from any directory structure as long as you put your data under a subdir called data
#
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# I only want to pull the first two days of February 2007 for my graph
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# This sets datetime var to dd/mm/yyyy hh:mi:ss format 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# cast Global_active_power to numeric and assign it...
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Ready to create the graph!
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# always remember to close
dev.off()
