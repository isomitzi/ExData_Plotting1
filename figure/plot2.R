##this script assumes that the file was downloaded to your working directory.
## there is also a way to directly download the zip file into R and extract it.
##the code for that would like this: "temp <- tempfile()
##download.file("file_url_here",temp)
##data <- read.table(unz(temp, "A.dat"))
##unlink(temp)"
##however, since this may nor work on all OS as well, i decided to start the script after the
##file was downloaded.


##reading the file into an initial dataset (DTi)
DTi <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=70000)

##the following lines deal with combining the first two rows into a single "Date" variable
DTi$Date <- as.Date(DTi$Date, format="%d/%m/%Y")
DTi$Date <- paste(DTi$Date, DTi$Time)
DTi$Date <- strptime(DTi$Date, format="%Y-%m-%d %H:%M:%S")

##subsetting the desired dates to the working dataset(DT)
DT<- DTi[66637:69516,-2]

##setting the local so that days will appear in english
Sys.setlocale("LC_TIME", "C")

##plotting the graph to a png file
png(filename="plot2.png")
plot(DT$Date, DT$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()