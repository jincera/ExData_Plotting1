#Exploratory Data Analysis
# Course project 1
# Code for Plot 1
# The code assumes that the file "household_power_consumption.txt" is 
# already in the working directory.  As stated in the instructions, this
# data file can be downloaded from_: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Step 1: Let us read the data file. Fields are separated with ";", missing values are labeled as "?"
homePowerC<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Step 2: We are only interested in the readings from Feb 1st and Feb 2nd 2007
homePowerC_sub<-homePowerC[(homePowerC$Date=="1/2/2007" | homePowerC$Date=="2/2/2007" ),]

# Step 3: Open the png graphics device with the required dimensions. The graph goes to the
# "plot1.png" file
png(file = "./Plot1.png",width = 480, height = 480, bg = "transparent") 

# Step 4: Let's plot the histogram with the proper labels and colors
hist(homePowerC_sub$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Step 5:  Shut down the graphics device. 
dev.off()