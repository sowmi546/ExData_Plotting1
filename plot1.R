#initially set the working directory to the location where the data file is present using setwd() command and passing the file path to it as parameter

myFile<- "testfile.txt"
myData<-read.table(myFile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
subData<-myData[myData$Date %in% c("1/2/2007","2/2/2007"),]
#colnames(subData)
gap<-as.numeric(subData$Global_active_power)
#plotting as a png image
dev.copy(png,"plot1.png",width=480,height=480)
hist(gap,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
