#This file contains the code for creating plot1 image that is needed as part of Exploratory Data Analysis Course project 1.
# Below step creates a variable which has the download link for source data
fileurlp1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
# Downloading the file
download.file(fileurlp1,destfile="./exdata-data-household_power_consumption.zip",method="libcurl");
# Unzipping the file
t <- unzip(zipfile="./exdata-data-household_power_consumption.zip");
# Reading the data
exgr <- read.table(file = t,header=TRUE,sep=";",quote="",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"));
# Sub-setting the required data.
exgr <- subset(exgr,(as.Date(exgr$Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") | as.Date(exgr$Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y")));
# Opening the device, creating plot and closing the device
png(filename="./plot1.png",width=480,height=480,units="px");
hist(exgr$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power");
dev.off();
