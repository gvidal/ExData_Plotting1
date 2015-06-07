data <- read.csv("household_power_consumption.txt", sep=";")

date_start <- as.Date("2007-02-01")
date_end <- as.Date("2007-02-02")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= date_start & data$Date <= date_end,]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
times <-as.POSIXlt(paste(data$Date, data$Time), sep=" ")
plot(times,
      data$Global_active_power, 
      type="l", 
     ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()

