rm(list=ls(all=T))
#We first read from the unzipped file the top 100,000 rows
readdata <- read.table("household_power_consumption.txt",header=T,nrows=100000,sep=";")

#Within these rows, we search for data from 1-2/2/2007 only
d1 <- subset(readdata,readdata$Date=="1/2/2007" | readdata$Date=="2/2/2007")

Data <- cbind(as.numeric(as.character(d1$Sub_metering_1)),
              as.numeric(as.character(d1$Sub_metering_2)),
              as.numeric(as.character(d1$Sub_metering_3)))
m <- paste(as.character(d1$Date),as.character(d1$Time))

DataDate <- strptime(m,"%d/%m/%Y %T")

#Plot PNG file
png(filename = "plot3.png",height=480,width=480)
plot(DataDate, Data[,1],
     type="n",
     ylab = "Energy sub metering",
     xlab = "",
     main = "")
points(DataDate, Data[,1], type = "l")
points(DataDate, Data[,2], col = "red", type = "l")
points(DataDate, Data[,3], col = "blue", type = "l")
legend("topright", lwd = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
