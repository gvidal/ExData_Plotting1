data <- read.csv("household_power_consumption.txt", sep=";")

#Subset the data that we want
date_start <- as.Date("2007-02-01")
date_end <- as.Date("2007-02-02")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date >= date_start & data$Date <= date_end,]

# convert the data to the class that we want (it is a factor)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))


#Create the plot
dev.new()
plot.new()
hist(data$Global_active_power, 
        main="Global Active Power", 
        col="red", 
        xlab="Global Active Power (kilowatts)",
        breaks=11,
        ylim=c(0,1200))

# copy the plot into a file
dev.copy(png,file="plot1.png")
dev.off()

