# npanei
# exploratory data analysis - project 1, plot 4

# read data, subset dates of interest
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# read the various measures, convert to numeric
active <- as.vector(power$Global_active_power)
active <- sapply(active,as.numeric)

Voltage <- as.vector(power$Voltage)
Voltage <- sapply(Voltage,as.numeric)

Sub_metering_1 <- as.vector(power$Sub_metering_1)
Sub_metering_2 <- as.vector(power$Sub_metering_2)
Sub_metering_3 <- as.vector(power$Sub_metering_3)
Sub_metering_1 <- sapply(Sub_metering_1,as.numeric)
Sub_metering_2 <- sapply(Sub_metering_2,as.numeric)
Sub_metering_3 <- sapply(Sub_metering_3,as.numeric)

reactive <- as.vector(power$Global_reactive_power)
reactive <- sapply(reactive,as.numeric)

# create the four plots, on a 2x2 arrangement, in a png
png(filename="plot4.png")
par(mfrow=c(2,2))

plot(active,col="white",xaxt="n",xlab="",ylab="Global Active Power")
lines(active)
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"),xlab=NULL)

plot(Voltage,col="white",xaxt="n",xlab="datetime",ylab="Voltage")
lines(Voltage)
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))

plot(Sub_metering_1,col="white",xaxt="n",xlab="",ylab="Energy sub metering")
lines(Sub_metering_1)
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"),xlab=NULL)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")

plot(reactive,col="white",xaxt="n",xlab="datetime",ylab="Global_reactive_power")
lines(reactive)
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))

dev.off()