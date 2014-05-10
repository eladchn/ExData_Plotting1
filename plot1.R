rm(list=ls())
#We first read from the unzipped file the top 100,000 rows
data = read.table("household_power_consumption.txt",header=T,nrows=100000,sep=";")

#Within these rows, we search for data from 1-2/2/2007 only
d1 = subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

DPlot = as.numeric(as.character(d1$Global_active_power))

#Plot PNG file
png(filename = "plot1.png",height=480,width=480)
hist(DPlot,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col="red")
dev.off()
