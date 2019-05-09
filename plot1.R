# npanei
# exploratory data analysis - project 1, plot 1

# read data, subset dates of interest
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# convert global active power data to numeric
wattage <- as.vector(power$Global_active_power)
wattage <- sapply(wattage,as.numeric)

# plot histogram to png
png(filename="plot1.png")
hist(wattage,col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()