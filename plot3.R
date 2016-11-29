## basic data import and subsetting 
ds<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?")
library(dplyr)
ds<-tbl_df(ds)
library(lubridate)
ds<-mutate(ds, Date=dmy(Date))
sdata<-filter(ds, Date=="2007-02-01"|Date=="2007-02-02")


## Plot 3
png("plot3.png", width=480, height=480)
plot(x=date_time_2, y=sdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(date_time_2, sdata$Sub_metering_1, type="l", col="black")
lines(date_time_2, sdata$Sub_metering_2, type="l", col="red")
lines(date_time_2, sdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), col=c("black", "red", "blue"))
dev.off()
