## This function reads in a file specified by the user and plots out a 
## line graph of Global Active Power data from 2/1/17 to 2/2/17. 

## filename:  "household_power_consumption.txt"

plot2 <- function(filename) {

  # Read in data
  powerdata <- read.table(filename, header = TRUE, sep =";")

  # Clean data and only include the dates 2/1/07 and 2/2/07
  trim_data <- powerdata[(powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007"),]
  trim_data$Date_and_Time <- strptime(paste(trim_data$Date, trim_data$Time, sep=" "),
                                 format="%d/%m/%Y %H:%M:%S")

  # Create plot and save off as a .png
  png("plot2.png", width=480, height=480, units="px")
  plot(trim_data$Date_and_Time, trim_data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
  
}
