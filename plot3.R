#initially set the working directory to the location where the data file is present using setwd() command and passing the file path to it as parameter
myFile<- "testfile.txt"
myData<-read.table(myFile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
subData<-myData[myData$Date %in% c("1/2/2007","2/2/2007"),]

dt <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subData$Global_active_power)
sm1 <- as.numeric(subData$Sub_metering_1)
sm2 <- as.numeric(subData$Sub_metering_2)
sm3 <- as.numeric(subData$Sub_metering_3)

dev.copy(png,"plot3.png",width=480,height=480)
plot(dt, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
