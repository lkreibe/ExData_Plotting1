## This function reads in a file specified by the user and plots out a 
## line graph of Sub_metering_1, Sub_metering_2, and Sub_metering_3
## data from 2/1/17 to 2/2/17. 

## filename:  "household_power_consumption.txt"

plot4 <- function(filename) {

  # Read in data
  powerdata <- read.table(filename, header = TRUE, na.string="?", sep =";")

  # Clean data and only include the dates 2/1/07 and 2/2/07
  trim_data <- powerdata[(powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007"),]

  # Provide a var that concatinates date & time
  trim_data$Date_and_Time <- strptime(paste(trim_data$Date, trim_data$Time, sep=" "),
    format="%d/%m/%Y %H:%M:%S")

  # Create plot and save off as a .png
  png("plot4.png", width=480, height=480, units="px")
  par(mfcol = c(2,2))
  
  # Upper Left Plot
  plot(trim_data$Date_and_Time, trim_data$Global_active_power, type = "l",
    xlab="", ylab="Global Active Power")
  
  # Lower Left Plot
  plot(trim_data$Date_and_Time, trim_data$Sub_metering_1, type = "l", xlab="", 
    ylab="Global Active Power (kilowatts)")
  lines(trim_data$Date_and_Time, trim_data$Sub_metering_2, col="red")
  lines(trim_data$Date_and_Time, trim_data$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1",
    "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
  
  # Upper Right Plot
  plot(trim_data$Date_and_Time, trim_data$Voltage, type = "l", ylab="Voltage",
    xlab="datetime")

  # Lower Right Plot
  plot(trim_data$Date_and_Time, trim_data$Global_reactive_power, type = "l",
    xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  
}
