elec <- readLines("household_power_consumption.txt")

library(stringr)
library(chron)
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


#Plot 1 

#opening file
png(file = "Plot1.png")

#Plotting the graph
with(elec2, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

#Saving and closing file
dev.off()