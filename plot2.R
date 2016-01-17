plot_data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

plot_data$Date <- as.Date(plot_data$Date, format = "%d/%m/%Y")
plot_data <- plot_data[plot_data$Date == as.Date("2007-02-01") | plot_data$Date == as.Date("2007-02-02"),]

plot_data$Timestamp <- as.POSIXct(strptime(
    paste(
      plot_data$Date
      ,plot_data$Time
      ,sep=" "
    )
  ,format="%Y-%m-%d %H:%M:%S"
  ))

plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

png("plot2.png",width=480,height=480)

par(mfrow=c(1,1),oma=c(2,2,1,1))

plot(
  plot_data[["Timestamp"]]
  ,plot_data[["Global_active_power"]]
  ,type="l"
  ,xlab="Date"
  ,ylab="Global Active Power (kilowatts)"
  )

dev.off()