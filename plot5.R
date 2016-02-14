## Read Data
NEI <- readRDS("d:\\Rdata\\EDA\\summarySCC_PM25.rds")
SCC <- readRDS("d:\\Rdata\\EDA\\Source_Classification_Code.rds")

# No.5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI.Baltimore <- subset(NEI, fips == "24510")

Vehicles.Souces <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))

SCC.Vehicles <- as.character(SCC[SCC$EI.Sector %in% Vehicles.Souces,]$SCC)

NEI.Baltimore_Vehicles <- subset(NEI.Baltimore, SCC %in% SCC.Vehicles)

PM25.NEI.Baltimore_Vehicles <-  ddply(NEI.Baltimore_Vehicles, "year", summarize, sum = sum(Emissions))

plot(PM25.NEI.Baltimore_Vehicles$year, PM25.NEI.Baltimore_Vehicles$sum, type="l", xlab = "Year", ylab = expression
     (PM[2.5] ~"Emissions (tons)"), main = expression(" coal combustion-related sources'" ~ 
                                                        PM[2.5] ~ "Emissions in Baltimore City"), col="Purple")

dev.copy(png, file="d:\\GitHub\\EDA2\\plot5.png")
dev.off()