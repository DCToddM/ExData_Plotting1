<<<<<<< HEAD
plot3 <- function() {
  
  power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  home_power <- subset(power, subset = Date %in% c("1/2/2007", "2/2/2007"))
  
  home_power <- mutate(home_power, Date2 = as.Date(Date, format="%d/%m/%Y"))
  
  home_power <- mutate(home_power, Time2 = as.POSIXct(Time, format="%H:%M:%S"))
  
  home_power <- mutate(home_power, Date4 = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
  
  if(!file.exists("homepower.csv"))
  {
    write.csv(home_power, file="homepower.csv")
  }
  else
  {
    file.remove("homepower.csv")
    write.csv(home_power, file="homepower.csv") 
  }
  
  png(filename="plot3.png", width=480, height=480)
  
  plot(home_power$Date4, home_power$Sub_metering_1, ylab="Energy sub metering", type="n")
 
  lines(home_power$Date4, home_power$Sub_metering_1, col="black")
  
  lines(home_power$Date4, home_power$Sub_metering_2, col="red")
  
  lines(home_power$Date4, home_power$Sub_metering_3, col="blue")
  
  legend("topright", pch="_____", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
=======
plot3 <- function() {
  
  power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  home_power <- subset(power, subset = Date %in% c("1/2/2007", "2/2/2007"))
  
  home_power <- mutate(home_power, Date2 = as.Date(Date, format="%d/%m/%Y"))
  
  home_power <- mutate(home_power, Time2 = as.POSIXct(Time, format="%H:%M:%S"))
  
  home_power <- mutate(home_power, Date4 = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
  
  if(!file.exists("homepower.csv"))
  {
    write.csv(home_power, file="homepower.csv")
  }
  else
  {
    file.remove("homepower.csv")
    write.csv(home_power, file="homepower.csv") 
  }
  
  png(filename="plot3.pgn", width=480, height=480)
  
  plot(home_power$Date4, home_power$Sub_metering_1, ylab="Energy sub metering", type="n")
 
  lines(home_power$Date4, home_power$Sub_metering_1, col="black")
  
  lines(home_power$Date4, home_power$Sub_metering_2, col="red")
  
  lines(home_power$Date4, home_power$Sub_metering_3, col="blue")
  
  legend("topright", pch="_____", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
>>>>>>> 2bc96db7006ab14c1c1f904b9375db8bc9d2c93d
}