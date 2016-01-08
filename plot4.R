#initially set the working directory to the location where the data file is present using setwd() command and passing the file path to it as parameter

myFile<- "testfile.txt"
myData<-read.table(myFile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
subData<-myData[myData$Date %in% c("1/2/2007","2/2/2007"),]

dt<- strptime(paste(subData$Date,subData$Time,sep=""),"%d/%m/%Y %H:%M:%S")
gap<- as.numeric(subData$Global_active_power)
grp<- as.numeric(subData$Global_reactive_power)
voltage<-as.numeric(subData$Voltage)
sm1 <- as.numeric(subData$Sub_metering_1)
sm2 <- as.numeric(subData$Sub_metering_2)
sm3 <- as.numeric(subData$Sub_metering_3)
dev.copy(png,"plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(dt,gap,type="l",xlab="",ylab="Global Active Power")
plot(dt,voltage,type="l",xlab="datetime",ylab="Voltage")
plot(dt,sm1,type="l",ylab="Energy Submetering",xlab="")
lines(dt,sm2,type = "l",col="red")
lines(dt,sm3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=,lwd=2.5,cex=0.75,col=c("black","red","blue"),bty="o")
plot(dt,grp,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
