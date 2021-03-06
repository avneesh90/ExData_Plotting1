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
## plot the graph using hist()
png(file="plot1.png",width=480,height=480)
hist(pow2days[,"Global_active_power"], main="", xlab="",col="red")
title(main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()