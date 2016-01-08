#initially set the working directory to the location where the data file is present using setwd() command and passing the file path to it as parameter

myFile<- "testfile.txt"
myData<-read.table(myFile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
subData<-myData[myData$Date %in% c("1/2/2007","2/2/2007"),]
dt <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap<-as.numeric(subData$Global_active_power)
#length(gap)
dev.copy(png,"plot2.png",width=480,height=480)
plot(dt,gap,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
