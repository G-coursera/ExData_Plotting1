###Plot 1###

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
data$Date <- strptime(as.character(data$Date),format="%d/%m/%Y",tz="")  #converting Date to proper date format
subset_indices <- grep("2007-02-01|2007-02-02",data$Date)   #The indices for "2007-02-01" and "2007-02-02 data"
data <- data[subset_indices,] ##subset of data needed  #subsetting the data to just the dates needed


##Creating Plot 1 and saving to png file
par(mar=c(4,4,2,2)) #setting margins
hist(data$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power",bg = 'white')  #drawing histogram
dev.copy(png,file="plot1.png")  #saving histogram
dev.off()  #closing png device
