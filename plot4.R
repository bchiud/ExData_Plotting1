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

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2),oma=c(0,1,0,1))

plot(
  plot_data[["Timestamp"]]
  ,plot_data[["Global_active_power"]]
  ,type="l"
  ,xlab=""
  ,ylab="Global Active Power (kilowatts)"
  )

plot(
  plot_data[["Timestamp"]]
  ,plot_data[["Voltage"]]
  ,type="l"
  ,xlab=""
  ,ylab="Voltage"
  )

plot(
  plot_data[["Timestamp"]]
  ,plot_data[["Sub_metering_1"]]
  ,type="l"
  ,xlab=""
  ,ylab="Energy Sub Metering"
  )
lines(
  plot_data[["Timestamp"]]
  ,plot_data[["Sub_metering_2"]]
  ,col="red"
  )
lines(
  plot_data[["Timestamp"]]
  ,plot_data[["Sub_metering_3"]]
  ,col="blue"
  )
legend(
  "topright"
  ,col=c("black","red","blue")
  ,legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3")
  ,lty=1
  ,bty="n"
  ,lwd=c(2.5,2.5,2.5)
  )

plot(
  plot_data[["Timestamp"]]
  ,plot_data[["Global_reactive_power"]]
  ,type="l"
  ,xlab=""
  ,ylab="Global Reactive Power"
  )

dev.off()