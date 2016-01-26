#
# plot1.R
# get the data file from subdir called data.  Makes re-use easier
#
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# I only want Feb 1 and 2 of 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# set to a numeric from the data
globalActivePower <- as.numeric(subSetData$Global_active_power)

# create the graphic
png("plot1.png", width=480, height=480)

# Plot a histogram color red wit labels
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Always make sure to close it.
dev.off()
