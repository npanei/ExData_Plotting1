# npanei
# exploratory data analysis - project 1, plot 3

# read data, subset dates of interest
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# convert sub-metering data to numeric
Sub_metering_1 <- as.vector(power$Sub_metering_1)
Sub_metering_2 <- as.vector(power$Sub_metering_2)
Sub_metering_3 <- as.vector(power$Sub_metering_3)
Sub_metering_1 <- sapply(Sub_metering_1,as.numeric)
Sub_metering_2 <- sapply(Sub_metering_2,as.numeric)
Sub_metering_3 <- sapply(Sub_metering_3,as.numeric)

# plot sub-metering data to png
png(filename="plot3.png")
plot(Sub_metering_1,col="white",xaxt="n",xlab="",ylab="Energy sub metering")
lines(Sub_metering_1)
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"),xlab=NULL)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()