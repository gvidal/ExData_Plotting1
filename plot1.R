data <- read.csv("household_power_consumption.txt", sep=";")

date_start <- as.Date("2007-02-01")
date_end <- as.Date("2007-02-02")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= date_start & data$Date <= date_end,]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, 
        main="Global Active Power", 
        col="red", 
        xlab="Global Active Power (kilowatts)",
        breaks=11,
        ylim=c(0,1200))
dev.copy(png,file="plot1.png")
dev.off()

