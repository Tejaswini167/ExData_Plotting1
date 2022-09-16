#Already downloaded the file in the working directory(link in README.md)

file<-"household_power_consumption.txt"
dt<-read.table(file,header=TRUE,sep=";",dec=".",na.strings="?")
dates<-c("1/2/2007","2/2/2007")
dt<-dt[dt$Date %in% dates, ]

hist(dt[,3],col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()