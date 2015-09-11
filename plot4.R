library(data.table)
#only read lines starting from the first "1/2/2007" string, until 2(day)*24(hours)*60(mins) of rows are read
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", skip = "1/2/2007", nrows = 2*24*60)
#convert column 1 + column 2 to Time format as a new column "datetime"
data$datetime <- with(data, as.POSIXct(paste(V1, V2), format = "%d/%m/%Y %H:%M:%S"))
#plot 4 to plot4.png
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data,{
    plot(datetime,V3, type = "l", xlab = "", ylab = "Global Active Power")
    plot(datetime,V5, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(datetime,V7, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(datetime,V8, type = "l", col = "red")
    lines(datetime,V9, type = "l", col = "blue")
    legend("topright", lwd =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(datetime,V4, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()