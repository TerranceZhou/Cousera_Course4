
setwd("C:/Users/TerranceZhou/Documents/Coursera/course4")
filename <- file.path(getwd(), "exdata%2Fdata%2Fhousehold_power_consumption")

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("exdata%2Fdata%2Fhousehold_power_consumption")) { 
  unzip(filename) }

setwd("C:/Users/TerranceZhou/Documents/Coursera/course4/exdata%2Fdata%2Fhousehold_power_consumption")
# Load Data
powerConsumption <- read.table(file="household_power_consumption.txt",sep = ";",header=TRUE,as.is = TRUE)

dataSelected <-powerConsumption[powerConsumption$Date=="1/2/2007"|powerConsumption$Date=="2/2/2007",]
dataSelected<-dataSelected[complete.cases(dataSelected),]
dataSelected$DateTime<-strptime(paste(dataSelected$Date,dataSelected$Time),
format="%d/%m/%Y %H:%M")
dataSelected$Global_active_power<-as.numeric(dataSelected$Global_active_power)

plot(dataSelected$DateTime,
     dataSelected$Sub_metering_1,  
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

lines(dataSelected$DateTime,
     dataSelected$Sub_metering_2,  
     col="red")

lines(dataSelected$DateTime,
      dataSelected$Sub_metering_3,  
      col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),     
lty=c(1,1,1), lwd=c(2,2,2),col=c("black","red","blue"))

dev.copy(png,file="plot3.png")
dev.off()

