##plot2

##pull data

data <- read.table("household_power_consumption.txt", header = FALSE, sep= ";", skip = 66637, 
                   nrows = 2880)

##convert to character
data[,1] <- as.character(data[,1])
data[,2] <- as.character(data[,2])

##combine
datetime <- paste(data[,1], data[,2], sep= " ")

##convert w strptime
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

##save as png
png(file="C:/Users/Raven1/Documents/plot2.png", width=480, height=480)

##chart2
plot(data[,3], type = "l", xaxt = "n", xlab = " ", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

##turn off png
dev.off()