## basic data import and subsetting 
ds<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?")
library(dplyr)
ds<-tbl_df(ds)
library(lubridate)
ds<-mutate(ds, Date=dmy(Date))
sdata<-filter(ds, Date=="2007-02-01"|Date=="2007-02-02")

## Plot 2
png("plot2.png", width=480, height=480)
date_time_2=ymd_hms(paste(sdata$Date,sdata$Time))
plot(date_time_2, sdata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(date_time_2, sdata$Global_active_power, type="l")
dev.off()