plot2 <- function ()
{
  ## Read data from file
  plotData <- getData()  
  
  ## Plotting Data
  plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
  t2 <- ts(plotData$Global_active_power)
  
  ## Open graphic device and write the plot to the PNG file
  png("plot2.png",width=480,height=480)
  plot(t2, xaxt='n',yaxt ='n',ylab="Global Active Power (kilowatts)", xlab="")
  axis(1, at=seq(0,4000,by=1450), c("Thu","Fri","Sat"))
  axis(2, at=seq(0,400,by=100), c("0","2","4","6","8"))
  dev.off()
  
}
getData <- function (){
  d <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
  d$Date <- strptime(d$Date, format = "%d/%m/%Y")
  d2 <- subset(d, as.Date(Date) > "2007-01-31" & as.Date(Date) < "2007-02-03")
  d2$Global_active_power <- as.numeric(d2$Global_active_power) / 10
  
  rm(d)
  d2
}
