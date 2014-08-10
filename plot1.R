plot1 <- function ()
{
  ## Read data from file
  plotData <- getData() 
  
  ## Plotting Data by opening a graphic device and writing to PNG file
  plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
  png("plot1.png",width=480,height=480)
  hist(plotData$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
  
}
getData <- function (){
  d <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
  d$Date <- strptime(d$Date, format = "%d/%m/%Y")
  d2 <- subset(d, as.Date(Date) > "2007-01-31" & as.Date(Date) < "2007-02-03")
  rm(d)
  d2
}