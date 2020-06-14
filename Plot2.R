# Set working directory.

Setwd("C:/Users/pruebas/Documents/Exporatory_data")

# Load the data and str() to see class of the variables.

consumption <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
str(consumption)

'data.frame':	2075259 obs. of  9 variables:
  $ Date                 : Factor w/ 1442 levels "1/1/2007","1/1/2008",..: 342 342 342 342 342 342 342 342 342 342 ...
$ Time                 : Factor w/ 1440 levels "00:00:00","00:01:00",..: 1045 1046 1047 1048 1049 1050 1051 1052 1053 1054 ...
$ Global_active_power  : num  4.22 5.36 5.37 5.39 3.67 ...
$ Global_reactive_power: num  0.418 0.436 0.498 0.502 0.528 0.522 0.52 0.52 0.51 0.51 ...
$ Voltage              : num  235 234 233 234 236 ...
$ Global_intensity     : num  18.4 23 23 23 15.8 15 15.8 15.8 15.8 15.8 ...
$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
$ Sub_metering_2       : num  1 1 2 1 1 2 1 1 1 2 ...
$ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

# Subset the data, i only need the data of 2 days of the variable Date

data <- subset(consumption, Date == "1/2/2007" | Date == "2/2/2007")

# convert Date and Time that are factors to date-time classes

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
> class(datetime)
[1] "POSIXlt" "POSIXt" 

# Make the plot

plot(datetime,data$Global_active_power, ylab="Global Active Power (kilowatts)",xlab= " ", type = "l")

# Anotate the plot

title(main="Global Active Power Vs Time")

# Copy the plot from screen device to a png file device and close the device.

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()





