library(data.table)
#only read lines starting from the first "1/2/2007" string, until 2(day)*24(hours)*60(mins) of rows are read
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", skip = "1/2/2007", nrows = 2*24*60)
#plot 1 to plot1.png
png(filename = "plot1.png", width = 480, height = 480)
hist(data$V3, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()