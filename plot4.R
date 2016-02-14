## Read Data
NEI <- readRDS("d:\\Rdata\\EDA\\summarySCC_PM25.rds")
SCC <- readRDS("d:\\Rdata\\EDA\\Source_Classification_Code.rds")

# No.4 
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

SCC.Comb_Coal <- subset(SCC, EI.Sector %in% unique(grep("- Coal" , EI.Sector,  ignore.case = TRUE, value = TRUE)))

SCC.Comb_Coal <- mutate(SCC.Comb_Coal, SCC= as.character(SCC), Data.Category = as.character(Data.Category) )

NEI.Comb_Coal <- subset(NEI, c(SCC, type) %in% c(SCC.Comb_Coal$SCC, SCC.Comb_Coal$Data.Category))

PM25.Comb_Coal <- ddply(NEI.Comb_Coal, "year", summarise, sum = sum(Emissions))

plot(PM25.Comb_Coal$year, PM25.Comb_Coal$sum, type="l", xlab = "Year", ylab = expression
     (PM[2.5] ~"Emissions (tons)"), main = expression(" coal combustion-related sources'" ~ 
                                                                  PM[2.5] ~ "Emissions by Year"), col="Purple")
dev.copy(png, file="d:\\GitHub\\EDA2\\plot4.png")
dev.off()