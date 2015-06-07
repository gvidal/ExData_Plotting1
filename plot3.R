data <- read.csv("household_power_consumption.txt", sep=";")

#Subset the data to the dates that we want
date_start <- as.Date("2007-02-01")
date_end <- as.Date("2007-02-02")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= date_start & data$Date <= date_end,]
# Mutate the data frame by adding a new column with the datetimes
data$times <-as.POSIXlt(paste(data$Date, data$Time), sep=" ")
# Change the class of those variables (they are factors)
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Create the plot
dev.new()
plot.new()
plot(data$times,
     data$Sub_metering_1, 
        type="n", 
        ylab="Energy sub metering",
        xlab="",
        color="")

# Add the different lines
lines(times,data$Sub_metering_1, col="black")
lines(times,data$Sub_metering_2, col="red")
lines(times,data$Sub_metering_3, col="blue")
## Add the legend
legend('topright',
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), 
       lty=1)

# With this width we should see the whole legend
dev.copy(png,file="plot3.png",width=700,height=700)
dev.off()
