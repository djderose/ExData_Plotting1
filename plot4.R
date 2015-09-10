##plot4

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
png(file="C:/Users/Raven1/Documents/plot3.png", width=480, height=480)

##chart4
##set for 2x2
par(mfrow = c(2,2))

##chart1
plot(data[,3], type = "l", xaxt= "n", xlab = " ", ylab = "Global Active Power" )
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

##chart2
plot(data[,5], type="l", xaxt="n", xlab="datetime", ylab="Voltage")
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

##chart3
plot(data[,7], type = "l", xaxt = "n", xlab= " ", ylab= "Energy sub metering", col = "black")
lines(data[,8], col="red")
lines(data[,9], col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col=c("black","red","blue"),bty = "n")
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

##chart4
plot(data[,4], type = "l", xaxt= "n", xlab="datetime",ylab="Globa_reactive_power")
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))


##turn off png
dev.off()