## basic data import and subsetting 
ds<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?")
library(dplyr)
ds<-tbl_df(ds)
library(lubridate)
ds<-mutate(ds, Date=dmy(Date))
sdata<-filter(ds, Date=="2007-02-01"|Date=="2007-02-02")

## Plot 1
png("plot1.png", width=480, height=480)
hist(sdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts", ylab="Frequency")
dev.off()







