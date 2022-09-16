#Already downloaded the file in the working directory(link in README.md)

file<-"household_power_consumption.txt"
dt<-read.table(file,header=TRUE,sep=";",dec=".",na.strings="?")
dates<-c("1/2/2007","2/2/2007")
dt<-dt[dt$Date%in%dates,]

date<-as.Date(dt[,1],format="%d/%m/%Y")
time<-strptime(dt[,2],format="%H:%M:%S")
x<-as.POSIXct(paste(date,dt[,2]))

plot(x,dt[,7],xlab="",ylab="Energy sub metering",type="l")
lines(x,dt[,8],col="red")
lines(x,dt[,9],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
col=c("black","red","blue"),lty=1)
dev.copy(png,file="plot3.png")
dev.off()