elec <- readLines("household_power_consumption.txt")

library(stringr)
library(chron)
library(lubridate)

col1 <- elec[1]
col1 <- str_split_fixed(col1, ";", 9)
elec <- elec[2:length(elec)]
elec <- str_split_fixed(elec, ";", 9)
elec <- as.data.frame(elec)

elec[,1] = as.Date(as.character(elec[,1]), tryFormats = c("%d/%m/%Y"))
elec[,2] = chron(times = as.character(elec[,2]))
elec[,3] = as.numeric(as.character(elec[,3]))
elec[,4] = as.numeric(as.character(elec[,4]))
elec[,5] = as.numeric(as.character(elec[,5]))
elec[,6] = as.numeric(as.character(elec[,6]))
elec[,7] = as.numeric(as.character(elec[,7]))
elec[,8] = as.numeric(as.character(elec[,8]))
elec[,9] = as.numeric(as.character(elec[,9]))
names(elec) <- col1

elec2 <- subset(elec, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))

#Plot 2

#opening file
png(file = "Plot2.png", width = 480, height = 480)

#Plotting the graph
datetime <- with(elec2, ymd(Date) + hms(Time))
plot(datetime, elec2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (killowatts)")
lines(datetime, elec2$Global_active_power)

#Saving and closing file        
dev.off()
