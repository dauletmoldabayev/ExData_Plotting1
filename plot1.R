##      
##      Exploratory Data Analysis Course
##      Course Project 1
##      Plotting Individual Household Electric Power Consumption
##      prepared by: Daulet Moldabayev (July, 2015)
##      

# setting the working directory
if( getwd() != "/Users/admin/Desktop/ExData_Plotting1" ){
        setwd("/Users/admin/Desktop/ExData_Plotting1")
}
# the name of the data file
dataFile <- "household_power_consumption.txt"

# specifying new format for Date class, so as to read 'Date' colunm correctly
setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

# columns' classes
cls <- c('myDate', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 
                                        'numeric', 'numeric', 'numeric')

# reading data from file; '?' is converted to 'NA' 
mydata <- read.table(dataFile, sep = ';', header = TRUE, na.strings = '?', 
                                                             colClasses = cls)
# subsetting 'mydata' 
sub1 <- subset(mydata, Date == '2007-02-01')
sub2 <- subset(mydata, Date == '2007-02-02')

# the required data set is now ready
newdata <- rbind(sub1, sub2)

# remove unnecessary variables 
remove(mydata, sub1, sub2, dataFile)

# plotting to a png file with specific width and height
png(file = 'plot1.png', width = 480, height = 480)

        hist(newdata$Global_active_power, main = 'Global Active Power', 
                        xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()