plot5 <- function(){
        ## This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        ## subset the motor vehicles, assumption: anything like Motor Vehicle in SCC.Level.Two.
        vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
        vehiclesSCC <- SCC[vehicles,]$SCC
        vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
        
        ## subset motor vehicles in Baltimore
        baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]
        
        ## plot using ggplot2
        png("plot5.png")
        library(ggplot2)
        ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
                geom_bar(stat="identity",fill="grey",width=0.75) +
                theme_bw() +  guides(fill=FALSE) +
                labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
                labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
        
        print(ggp)
        
        dev.off()
        
}
## Emissions from motor vehicle sources have decreased from 1999-2008 in Baltimore City. Especially, 1999 to 2002

