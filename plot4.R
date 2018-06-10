plot4 <- function() {
  
  power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  home_power <- subset(power, subset = Date %in% c("1/2/2007", "2/2/2007"))
  
  home_power <- mutate(home_power, Date2 = as.Date(Date, format="%d/%m/%Y"))
  
  home_power <- mutate(home_power, Time2 = as.POSIXct(Time, format="%H:%M:%S"))
  
  home_power <- mutate(home_power, Date4 = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
  
  if(!file.exists("homepower.csv"))
  {
    write.csv(home_power, file="homepower.csv")
  }
  
  png(filename="plot4.pgn", width=480, height=480)
  
  par(mfrow=c(2,2))
  
  plot(home_power$Date4, home_power$Global_active_power, type="n", xlab="", ylab="Global Active Power")
  lines(home_power$Date4, home_power$Global_active_power)
  
  plot(home_power$Date4, home_power$Voltage, type="n", xlab="datetime", ylab="Voltage")
  lines(home_power$Date4, home_power$Voltage)
  
  plot(home_power$Date4, home_power$Sub_metering_1,xlab="", ylab="Energy sub metering", type="n")
  lines(home_power$Date4, home_power$Sub_metering_1, col="black")
  lines(home_power$Date4, home_power$Sub_metering_2, col="red")
  lines(home_power$Date4, home_power$Sub_metering_3, col="blue")
  legend("topright", pch="_____", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
  plot(home_power$Date4, home_power$Global_reactive_power, type="n", ylab="Global_reactive_power")
  lines(home_power$Date4, home_power$Global_reactive_power)
  
  dev.off()
}