plot2 <- function() {
  
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
  
  png(filename="plot2.pgn", width=480, height=480)
  
  plot(home_power$Date4, home_power$Global_active_power, type="n", ylab="Global Active Power (kilowatts)")
  
  lines(home_power$Date4, home_power$Global_active_power)

  dev.off()
}