# npanei
# exploratory data analysis - project 1, plot 2

# read data, subset dates of interest
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# convert global active power data to numeric
wattage <- as.vector(power$Global_active_power)
wattage <- sapply(wattage,as.numeric)

# plot time series to png
png(filename="plot2.png")
plot(wattage,col="white",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(wattage)
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"),xlab=NULL)
dev.off()