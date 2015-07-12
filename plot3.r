library(sqldf) #use sqldf package to select the data we need
File=file("household_power_consumption.txt")
data=read.csv.sql("household_power_consumption.txt","select * from File where Date in ('2/1/2007', '2/2/2007')", header=TRUE, sep= ";")

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%m/%d/%Y %H:%M:%S")
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480) #save the histogram
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()