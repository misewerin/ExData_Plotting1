data <- read.csv("data/household_power_consumption.txt", sep = ";")
data = read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$formatted_date <- strptime(paste(data$Date, data$Time, sep = "/"), "%d/%m/%Y/%H:%M:%S")
##subset to specified dates
dat <- subset(data, formatted_date >= "2007-02-01" & formatted_date < "2007-02-03")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dat$formatted_date, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dat$formatted_date, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dat$formatted_date, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(dat$formatted_date, dat$Sub_metering_2, col = "red")
lines(dat$formatted_date, dat$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")
plot(dat$formatted_date, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()