data <- read.csv("household_power_consumption.txt", sep=";")

date_start <- as.Date("2007-02-01")
date_end <- as.Date("2007-02-02")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= date_start & data$Date <= date_end,]
data$times <-as.POSIXlt(paste(data$Date, data$Time), sep=" ")
data$Global_active_power  <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
par(mfrow=c(2,2))
plot(data$times,
     data$Global_active_power, 
     type="l", 
     ylab="Global Active Power",
     xlab="")
plot(data$times,
     data$Voltage, 
     type="l", 
     ylab="Voltage",
     xlab="datetime")
plot(times,
     data$Sub_metering_1, 
     type="n", 
     ylab="Energy sub metering",
     xlab="",
     color="")
lines(times,data$Sub_metering_1, col="black")
lines(times,data$Sub_metering_2, col="red")
lines(times,data$Sub_metering_3, col="blue")
legend('topright',
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), 
       lty=1)
plot(data$times,
     data$Global_reactive_power, 
     type="l", 
     ylab="Global_reactive_power",
     xlab="datetime")
dev.copy(png,file="plot4.png",width=700,height=700)
dev.off()

