###Plot 2###

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


##Creating Plot 2 and saving to png file
par(mar=c(4,4,2,2)) #setting margins
plot(data$Date,data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.copy(png,file="plot2.png")  #saving histogram
dev.off()  #closing png device
