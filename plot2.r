library(sqldf) #use sqldf package to select the data we need
File=file("household_power_consumption.txt")
data=read.csv.sql("household_power_consumption.txt","select * from File where Date in ('2/1/2007', '2/2/2007')", header=TRUE, sep= ";")

#change the form of the date
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%m/%d/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480) #save the histogram
plot(datetime,data$Global_active_power, type="l", xlab = "", ylab = "Global active power (kilowatts)", ylim = c(0,6))
dev.off()

#have trouble with the language, a part of it is also in Chinese, fail to figure out why