# set working directory
setwd("C:/Users/Kleber/Downloads/exdata_data_household_power_consumption")
# load and subset the file
df_data <- subset(read.table("household_power_consumption.txt", sep=";", header=T), Date%in%c("1/2/2007","2/2/2007"))
# convert the columns to numeric
df_data[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")] <- 
  apply(df_data[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")], 2, as.numeric)
# create the png file
png("plot3.png", width = 480, height = 480, units = "px")
# make the plot
matplot(df_data[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")], type="l", xaxt="n", xlab = "",
        col=c("black","red","blue"), ylab="Energy sub metering")
# set the labels of the x axis
axis(1, at=c(1,nrow(df_data)/2,nrow(df_data)), labels=c("Thu","Fri","Sat"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
# close the file
dev.off()

