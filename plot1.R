# set working directory
setwd("C:/Users/Kleber/Downloads/exdata_data_household_power_consumption")
# load and subset the file
df_data <- subset(read.table("household_power_consumption.txt", sep=";", header=T), Date%in%c("1/2/2007","2/2/2007"))
# convert the Global_active_power to numeric
df_data$Global_active_power <- as.numeric(df_data$Global_active_power)
# create the png file
png("plot1.png", width = 480, height = 480, units = "px")
# make the plot
hist(df_data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
# close the file
dev.off()
