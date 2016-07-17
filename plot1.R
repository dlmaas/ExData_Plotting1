download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="dataset.zip")
#
# The zip file will be downloaded and store in the working directory of the user.
# The file is then Unziped and stored in the working directory of the user.
#
unzip(zipfile="dataset.zip")
#
# Read in entire data set from text file.
#
full_file<- file("household_power_consumption.txt")
#
# Create a subset of the file based on the specified date intervals
#
sub_set_full_file <- read.table(text = grep("^[1,2]/2/2007", readLines(full_file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#
# Open the graphics file device to create the required png.
#
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
#
# Plot 1 is generated using the hist()
#
hist(sub_set_full_file$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
#
# The graphics device is closed with the dev.off() function
# The output from dev.off() is stored in a garbage file to pevent the screen error message "Null device 1"..
#
garbage <- dev.off()