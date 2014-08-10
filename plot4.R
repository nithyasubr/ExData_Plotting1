plot4 <- function ()
{
  plotData <- getData()  
  plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
  
  png("plot4.png")
  par(mfrow = c(2,2))
  
  ## First plot
  t2 <- ts(plotData$Global_active_power)
  plot(t2, xaxt='n',yaxt='n',ylab="Global Active Power", xlab="")
  axis(1, at=seq(0,4000,by=1450), c("Thu","Fri","Sat"))
  axis(2, at=seq(0,400,by=100), c("0","2","4","6","8"))
  
  ## Second Plot
  t2 <- ts(plotData$Voltage)
  plot(t2, xaxt='n', yaxt='n',ylab="Voltage", xlab="datetime")
  axis(1, at=seq(0,4000,by=1450), c("Thu","Fri","Sat"))
  axis(2, at=seq(800,2800,by=500), c("234","238","242","246","250"))
  
  ## Third Plot
  t1 <- ts(plotData$Sub_metering_1)
  t2 <- ts(plotData$Sub_metering_2)
  t3 <- ts(plotData$Sub_metering_3)
  ts.plot(t1,t2,t3,gpars=list(col=c("black","red","blue"),ylab="Energy sub metering",xlab="",xaxt='n'))
  legend(800,35,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1, bty='n')
  axis(1, at=seq(0,4000,by=1450), c("Thu","Fri","Sat"))
  
  ## Fourth Plot
  t2 <- ts(plotData$Global_reactive_power)
  plot(t2, xaxt='n', yaxt='n', ylab="Global_reactive_power", xlab="datetime")
  axis(1, at=seq(0,4000,by=1450), c("Thu","Fri","Sat"))
  axis(2, at=seq(0,250,by=50), c("0.0","0.1","0.2","0.3","0.4","0.5"))
  
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
