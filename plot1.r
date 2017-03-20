## This function reads in a file specified by the user and plots out a 
## histogram of Global Active Power data from 2/1/17 to 2/2/17. 

## filename:  "household_power_consumption.txt"

plot1 <- function(filename) {

  # Read in data
  powerdata <- read.table(filename, header = TRUE, sep =";")
  powerdata$Date <- as.Date(powerdata$Date, "%d/%m/20%y")

  # Clean data and only include the dates 2/1/07 and 2/2/07
  trim_data <- powerdata[(powerdata$Date == "2007-02-01" | 
  	powerdata$Date == "2007-02-02"),]
  trim_data$Global_active_power <- as.numeric(as.character(trim_data$Global_active_power))

  # Create plot and save off as a .png
  png("plot1.png", width=480, height=480, units="px")
  hist(trim_data$Global_active_power, main = paste("Global Active Power"), 
  	col="red", xlab="Global Active Power (kilowatts)")
  dev.off()
  
}
