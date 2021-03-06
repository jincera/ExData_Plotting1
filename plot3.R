#Exploratory Data Analysis
# Course project 1
# Code for Plot 3
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
png(file = "./Plot3.png",width = 480, height = 480, bg = "transparent") 

# Step 5: Start the plot with the first variable and label the axis
with(homePowerC_sub,plot(DateTime,Sub_metering_1,type="l",bg="white",ylab="Energy sub metering",xlab=""))

# Step 6: Annotate (add) the other variables
lines(homePowerC_sub$DateTime,homePowerC_sub$Sub_metering_2,col="red")
lines(homePowerC_sub$DateTime,homePowerC_sub$Sub_metering_3,col="blue")

# Step 7: Add the legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))

# Step 8:  Shut down the graphics device. 
dev.off()