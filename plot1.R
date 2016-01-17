plot_data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

plot_data$Date <- as.Date(plot_data$Date, format = "%d/%m/%Y")
plot_data <- plot_data[plot_data$Date == as.Date("2007-02-01") | plot_data$Date == as.Date("2007-02-02"),]

plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

png("plot1.png",width=480,height=480)

par(mfrow=c(1,1),oma=c(2,2,1,1))

hist(
  plot_data$Global_active_power
  ,col="red"
  ,main="Global Active Power"
  ,xlab="Global Active Power (kilowatts)"
  ,ylab="Frequency"
  ,ylim=c(0,1200)
  )

dev.off()