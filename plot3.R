plot3 <- function ()
{
  ## Read data from gile
  plotData <- getData() 
  
  # Generate time series for plotting
  plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
  
  t1 <- ts(plotData$Sub_metering_1)
  t2 <- ts(plotData$Sub_metering_2)
  t3 <- ts(plotData$Sub_metering_3)
  
  # Plot data by opening a graphics device and writing to PNG file
  png("plot3.png", width = 480, height = 480)
  ts.plot(t1,t2,t3,gpars=list(col=c("black","red","blue"),ylab="Energy sub metering",xlab="",xaxt='n'))
  legend(1600,35,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)
  axis(1, at=seq(0,4000,by=1450), c("Thu","Fri","Sat"))
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
