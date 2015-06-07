data <- read.csv("household_power_consumption.txt", sep=";")

date_start <- as.Date("2007-02-01")
date_end <- as.Date("2007-02-02")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= date_start & data$Date <= date_end,]
times <-as.POSIXlt(paste(data$Date, data$Time), sep=" ")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
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
dev.copy(png,file="plot3.png",width=700,height=700)
dev.off()
