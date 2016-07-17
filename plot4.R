download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="dataset.zip")
# The zip file is downloaded and stored in the working directory of the user.
#
#
# The file is then Unziped and stored in the working directory of the user.
#the data set.
#
unzip(zipfile="dataset.zip")
#
# The full data set is loaded into data_full
#
data_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
#
# as.Date( ) is used to convert strings to dates in the data_full file
#
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
#
# The closeAllConnections() function is used to close data connections and clear the open data warning.
#
closeAllConnections()
#
# create a subset of the original data_full file called subset_data_full
#
subset_data_full <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#
# The complete data set is deleted and subset_data_full is used for plotting.
#
rm(data_full)
#
# as.Date( ) is used to convert strings to dates 
#
datetime <- paste(as.Date(subset_data_full$Date), subset_data_full$Time)
#
# as.POSIXctis used for Date-time Conversion Functions
#
subset_data_full$Datetime <- as.POSIXct(datetime)
#
# Open the graphics file device to create the required png.
#
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
#
# Plot 2 is generated
#
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(subset_data_full, {
     plot(Global_active_power ~ Datetime, type = "l", 
     ylab = "Global Active Power", xlab = "")
     plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
     plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
          xlab = "")
     lines(Sub_metering_2 ~ Datetime, col = 'Red')
     lines(Sub_metering_3 ~ Datetime, col = 'Blue')
     legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
             bty = "n",
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power ~ Datetime, type = "l", 
          ylab = "Global_rective_power", xlab = "datetime")
})
#
# The graphics device is closed with the dev.off() function
# The output from dev.off() is stored in a garbage file to pevent the screen error message ""Null device 1".
#
garbage <- dev.off()

