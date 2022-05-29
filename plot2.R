# set working directory
setwd("C:/Users/Kleber/Downloads/exdata_data_household_power_consumption")
# load and subset the file
df_data <- subset(read.table("household_power_consumption.txt", sep=";", header=T), Date%in%c("1/2/2007","2/2/2007"))
# convert the Global_active_power to numeric
df_data$Global_active_power <- as.numeric(df_data$Global_active_power)
# create the png file
png("plot2.png", width = 480, height = 480, units = "px")
# make the plot
plot(df_data$Global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab = "")
# set the labels of the x axis
axis(1, at=c(1,nrow(df_data)/2,nrow(df_data)), labels=c("Thu","Fri","Sat"))
# close the file
dev.off()

