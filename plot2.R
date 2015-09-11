library(data.table)
#only read lines starting from the first "1/2/2007" string, until 2(day)*24(hours)*60(mins) of rows are read
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", skip = "1/2/2007", nrows = 2*24*60)
#convert column 1 + column 2 to Time format as a new column "datetime"
data$datetime <- with(data, as.POSIXct(paste(V1, V2), format = "%d/%m/%Y %H:%M:%S"))
#plot 2 to plot2.png
png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(datetime,V3, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()