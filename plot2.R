#Already downloaded the file in the working directory(link in README.md)

file<-"household_power_consumption.txt"
dt<-read.table(file,header=TRUE,sep=";",dec=".",na.strings="?")
dates<-c("1/2/2007","2/2/2007")
dt<-dt[dt$Date %in% dates, ]

date<-as.Date(dt[,1],format="%d/%m/%Y")
time<-strptime(dt[,2],format="%H:%M:%S")
x<-as.POSIXct(paste(date,dt[,2]))

plot(x,dt[,3],xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.copy(png,file="plot2.png")
dev.off()