##plot1

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
png(file="C:/Users/Raven1/Documents/plot1.png", width=480, height=480)

##chart1
hist(data[,3], breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##turn off png
dev.off()

