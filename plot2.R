#Exploratory Data Analysis
# Course project 1
# Code for Plot 2
# The code assumes that the file "household_power_consumption.txt" is 
# already in the working directory.  As stated in the instructions, this
# data file can be downloaded from_: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Step 1: Let us read the data file. Fields are separated with ";", missing values are labeled as "?"
homePowerC<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Step 2: We are only interested in the readings from Feb 1st and Feb 2nd 2007
homePowerC_sub<-homePowerC[(homePowerC$Date=="1/2/2007" | homePowerC$Date=="2/2/2007" ),]

# Step 3: Let us add a column with POSIX format for interpreting date and time
homePowerC_sub$DateTime<-strptime(paste(homePowerC_sub$Date,homePowerC_sub$Time),"%d/%m/%Y %H:%M:%S")

# Step 4: Open the png graphics device with the required dimensions. 
png(file = "./Plot2.png",width = 480, height = 480, bg = "transparent") 

# Step 5: Plot with "lines" and modify axis labels 
with(homePowerC_sub, plot(DateTime,Global_active_power,type="l",bg="white",xlab="",ylab="Global Active Power (kilowatts)"))

# Step 6:  Shut down the graphics device. 
dev.off()