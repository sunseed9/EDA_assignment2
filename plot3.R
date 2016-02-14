## Read Data
NEI <- readRDS("d:\\Rdata\\EDA\\summarySCC_PM25.rds")
SCC <- readRDS("d:\\Rdata\\EDA\\Source_Classification_Code.rds")

# No.3 
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI.Baltimore <- subset(NEI, fips == "24510")
Baltimore.type <- ddply(NEI.Baltimore, c("type", "year"), summarize, N = length(Emissions), sum = sum(Emissions), mean =mean(Emissions))

library(ggplot2)   
qplot(year, sum, data=Baltimore.type, color=type, geom ="line", xlab = "Year", ylab = expression
      ("Total" ~ PM[2.5] ~"Emissions (tons)"))

dev.copy(png, file="d:\\GitHub\\EDA2\\plot3.png")
dev.off()