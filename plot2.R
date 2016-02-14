## Read Data
NEI <- readRDS("d:\\Rdata\\EDA\\summarySCC_PM25.rds")
SCC <- readRDS("d:\\Rdata\\EDA\\Source_Classification_Code.rds")

# No.2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# No.2
NEI.Baltimore <- subset(NEI, fips == "24510")

PM25.Baltimore <- ddply(NEI.Baltimore, "year", summarize, sum = sum(Emissions))

plot(PM25.Baltimore$year, PM25.Baltimore$sum, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Baltimore City" ~ 
                                                                  PM[2.5] ~ "Emissions by Year"), col="Purple")

dev.copy(png, file="d:\\GitHub\\EDA2\\plot2.png")
dev.off()