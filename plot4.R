#Already downloaded the file in the working directory(link in README.md)

file<-"household_power_consumption.txt"
dt<-read.table(file,header=TRUE,sep=";",dec=".",na.strings="?")
dates<-c("1/2/2007","2/2/2007")
dt<-dt[dt$Date%in%dates,]

date<-as.Date(dt[,1],format="%d/%m/%Y")
time<-strptime(dt[,2],format="%H:%M:%S")
x<-as.POSIXct(paste(date,dt[,2]))

par(mfrow=c(2,2))
#1
plot(x,dt[,3],xlab="",ylab="Global Active Power",type="l")
#2
plot(x,dt[,5],xlab="datetime",ylab="Voltage",type="l")
#3
plot(x,dt[,7],xlab="",ylab="Energy sub metering",type="l")
lines(x,dt[,8],col="red")
lines(x,dt[,9],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
col=c("black","red","blue"),cex=0.8,lty=1,bty="n")
#4
plot(x,dt[,4],xlab="datetime",ylab="Global_reactive_power",type="l")

dev.copy(png,file="plot4.png")
dev.off()