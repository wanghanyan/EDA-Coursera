library(sqldf) #use sqldf package to select the data we need
File=file("household_power_consumption.txt")
data=read.csv.sql("household_power_consumption.txt","select * from File where Date in ('2/1/2007', '2/2/2007')", header=TRUE, sep= ";")

dev.new()
png(filename = "plot1.png", width = 480, height = 480) #save the histogram
hist(data$Global_active_power, xlab="Global active power (kilowatts)", ylim=c(0,1200), col="red", main = "Global Active Power")
dev.off()
