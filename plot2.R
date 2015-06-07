data <- read.csv("household_power_consumption.txt", sep=";")

date_start <- as.Date("2007-02-01")
date_end <- as.Date("2007-02-02")

#Subset the data
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= date_start & data$Date <= date_end,]

# Creating the new column with the computed dates with POSIXLt 
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$times <-as.POSIXlt(paste(data$Date, data$Time), sep=" ")

#Creating the plot!
dev.new()
plot.new()
plot(data$times,
      data$Global_active_power, 
      type="l", 
     ylab="Global Active Power (kilowatts)")

# copy the plot into a file
dev.copy(png,file="plot2.png")
dev.off()

