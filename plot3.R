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

# columns classes
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
png(file = 'plot3.png', width = 480, height = 480 )

# plotting an "empty plot" omitting x-axis label and ticks
plot(newdata$Sub_metering_1, xaxt = "n", xlab = '', 
                                ylab = 'Energy sub metering', type='n')
# adding graphs to the plot
lines(newdata$Sub_metering_1, lty = 1)
lines(newdata$Sub_metering_2, lty = 1, col = 'red')
lines(newdata$Sub_metering_3, lty = 1, col = 'blue')
# adding legend to the plot
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_2'), 
       lty=1, col=c('black', 'red', 'blue'))

# specifying ticks for x-axis
ticks = c('Thu', 'Fri', 'Sat')
# specifying positions for ticks
pos <- c(1, 1441, 2880)
# adding x-axis ticks to the plot
axis(side = 1, at = pos, labels = ticks)
dev.off()

