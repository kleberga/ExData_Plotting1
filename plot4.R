# set working directory
setwd("C:/Users/Kleber/Downloads/exdata_data_household_power_consumption")
# load and subset the file
df_data <- subset(read.table("household_power_consumption.txt", sep=";", header=T), Date%in%c("1/2/2007","2/2/2007"))
# convert the columns to numeric
df_data[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3","Global_active_power","Voltage",
           "Global_reactive_power")] <- apply(df_data[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3",
                                                         "Global_active_power","Voltage","Global_reactive_power")], 2, 
                                              as.numeric)
# create the png file
png("plot4.png", width = 480, height = 480, units = "px")
# divide the device in 2 rows and 2 columns
par(mfcol=c(2,2))
# make the first plot
plot(df_data$Global_active_power, type="l", xaxt="n", ylab="Global Active Power", xlab = "")
# set the labels of the x axis
axis(1, at=c(1,nrow(df_data)/2,nrow(df_data)), labels=c("Thu","Fri","Sat"))
# make the second plot
matplot(df_data[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")], type="l", xaxt="n", xlab = "",
        col=c("black","red","blue"), ylab="Energy sub metering")
# set the labels of the x axis
axis(1, at=c(1,nrow(df_data)/2,nrow(df_data)), labels=c("Thu","Fri","Sat"))
# set legend
legend(x=1300,y=39, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, box.lwd = 0, box.col = "white", cex=0.8)
# make the third plot
plot(df_data$Voltage, type="l", xaxt="n", ylab="Voltage", xlab = "datetime")
# set the labels of the x axis
axis(1, at=c(1,nrow(df_data)/2,nrow(df_data)), labels=c("Thu","Fri","Sat"))
# make the fourth plot
plot(df_data$Global_reactive_power, type="l", xaxt="n", ylab="Global_reactive_power", xlab = "datetime")
# set the labels of the x axis
axis(1, at=c(1,nrow(df_data)/2,nrow(df_data)), labels=c("Thu","Fri","Sat"))
# close the file
dev.off()



