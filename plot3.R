## read data
pow<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
## subset data
pow2days=pow[pow[,"Date"]=="1/2/2007" | pow[,"Date"]=="2/2/2007",]
## change data type of date and time
pow2days[,"Date"]=as.Date(pow2days[,"Date"],format="%d/%m/%Y")
pow2days[,"Time"]=as.POSIXct(paste(pow2days[,"Date"],pow2days[,"Time"]))
## change value to numeric from factor
for(i in 3:9){
  pow2days[,i]=as.numeric(as.character(pow2days[,i]))
}
## plot the graph using plot()
png(file="plot3.png",width=480,height=480)
plot(pow2days[,"Time"],pow2days[,"Sub_metering_1"], type="l", main="", xlab="", ylab="",col="black")
lines(pow2days[,"Time"],pow2days[,"Sub_metering_2"],col="red")
lines(pow2days[,"Time"],pow2days[,"Sub_metering_3"],col="blue")
title(ylab="Energy sub metering")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-", col=c("Black","Red","Blue"))
dev.off()