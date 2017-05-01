data <- read.csv("data/household_power_consumption.txt", sep = ";")
data = read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$formatted_date <- strptime(paste(data$Date, data$Time, sep = "/"), "%d/%m/%Y/%H:%M:%S")
##subset to specified dates
dat <- subset(data, formatted_date >= "2007-02-01" & formatted_date < "2007-02-03")

png("plot2.png", width = 480, height = 480)
plot(dat$formatted_date, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()