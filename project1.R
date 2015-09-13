data <- read.csv(file = "household_power_consumption.txt",sep = ";", header=TRUE,stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime <- strptime(paste(data$Date,data$Time,sep= " "), format ="%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

#PLOT 1
png("plot1.png")

hist(x = data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()

#PLOT 2
png("plot2.png")

plot(data$DateTime,data$Global_active_power,
     pch = 26,
     ylab  = "Global Active Power (kilowatts)",
     xlab = "")
lines(data$DateTime,data$Global_active_power, type = "l")

dev.off()

#PLOT 3
png("plot3.png")

plot(data$DateTime,data$Sub_metering_1,
     pch = 26,
     ylab  = "Energy sub metering",
     xlab = "")
lines(data$DateTime,data$Sub_metering_1, type = "l")
lines(data$DateTime,data$Sub_metering_2, type = "l",col="red")
lines(data$DateTime,data$Sub_metering_3, type = "l",col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = rep(1, times = 3),
       col = c("black","red","blue"))

dev.off()

#PLOT 4
png("plot4.png")

par(mfrow = c(2,2))

plot(data$DateTime,data$Global_active_power,
     pch = 26,
     ylab  = "Global Active Power (kilowatts)",
     xlab = "")
lines(data$DateTime,data$Global_active_power, type = "l")

plot(data$DateTime,data$Voltage,
     pch = 26,
     ylab  = "Voltage",
     xlab = "datetime")
lines(data$DateTime,data$Voltage, type = "l")

plot(data$DateTime,data$Sub_metering_1,
     pch = 26,
     ylab  = "Energy sub metering",
     xlab = "")
lines(data$DateTime,data$Sub_metering_1, type = "l")
lines(data$DateTime,data$Sub_metering_2, type = "l",col="red")
lines(data$DateTime,data$Sub_metering_3, type = "l",col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = rep(1, times = 3),
       col = c("black","red","blue"),
       bty = "n")

plot(data$DateTime,data$Global_reactive_power,
     pch = 26,
     ylab  = "Global Reactive Power (kilowatts)",
     xlab = "datetime")
lines(data$DateTime,data$Global_reactive_power, type = "l")

dev.off()