###Plot 4###

##Downloading and extracting data

if (!file.exists("data")){  #Checking if data folder doesnt exist
  dir.create("data")  #creating data folder
  fileurl1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  #specifying the download link
  download.file(fileurl1,destfile="data1.zip")  #downloading file
  unzip("data1.zip",exdir="./data")  #unzipping file to data folder
  
}

##Reading the dataset
file_list <- list.files("./data") #getting data filename
data <- read.table(paste0(getwd(),"/data/",file_list),header=TRUE,sep = ";",na.strings = "?")  #reading in the data
data$Date <- strptime(paste(as.character(data$Date),as.character(data$Time)),format="%d/%m/%Y %H:%M:%S",tz="") #converting Date to proper date format  #converting Date to proper date format
subset_indices <- grep("2007-02-01|2007-02-02",data$Date)   #The indices for "2007-02-01" and "2007-02-02 data"
data <- data[subset_indices,] ##subset of data needed  #subsetting the data to just the dates needed



##Creating Plot 4 and saving to png file
par(mar=c(4,4,2,2),mfrow=c(2,2)) #setting margins and number of plots
plot(data$Date,data$Global_active_power,xlab="",ylab="Global Active Power",type="l",col="black") #plotting Global_active_power
plot(data$Date,data$Voltage,xlab="datetime",ylab="Voltage",type="l",col="black") #plotting Voltage

plot(data$Date,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l") #plotting Sub_metering_1
lines(data$Date,data$Sub_metering_2, col = "red") #adding Sub_metering_2
lines(data$Date,data$Sub_metering_3, col = "blue") # adding Sub_metering_3
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.55,bty="n")  #adding legend

plot(data$Date,data$Global_reactive_power,xlab="datetime",ylab="Global_reative_power",type="l",col="black") #plotting Global_reactive_power
dev.copy(png,file="plot4.png")  #saving histogram
dev.off()  #closing png device



