## Loading Data

data_txt <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")


## Formatting Date 

data_txt$Date <- as.Date(data_txt$Date, format = "%d/%m/%Y")

data  <- subset(data_txt, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(data_txt)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Ploting The Variable And Creating The Plot


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# First Plot
plot(data$Global_active_power ~ data$Datetime, ylab="Global Active Power", type="l", xlab="")

# Second Plot
plot(data$Voltage ~ data$Datetime, ylab="Voltage", type="l", xlab="datetime")

# Third Plot
plot(data$Sub_metering_1~data$Datetime, ylab="Engergy sub metering", xlab="", type="l")
lines(data$Sub_metering_2~data$Datetime, col="Red")
lines(data$Sub_metering_3~data$Datetime, col="Blue")
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7, bty="n")

# Fourth Plot
plot(data$Global_reactive_power~data$Datetime, type="l", ylab="Global Reactive Power", xlab="datetime")

dev.copy(png, file="png4.png", height=480, width=480)
dev.off()
