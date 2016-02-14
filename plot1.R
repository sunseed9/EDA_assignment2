## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("d:\\Rdata\\EDA\\summarySCC_PM25.rds")
SCC <- readRDS("d:\\Rdata\\EDA\\Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(plyr)
PM25.tot <- ddply(NEI, "year", summarise, sum = sum(Emissions))

plot(PM25.tot$year, PM25.tot$sum, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ 
                                                                  PM[2.5] ~ "Emissions by Year"), col="Purple")

dev.copy(png, file="d:\\GitHub\\EDA2\\plot1.png")
dev.off()