plot6 <- function(){
        ## This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        ## Comparing emissions from motor vehicle sources in Baltimore City (fips == "24510") with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037")
        vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
        vehiclesBaltimoreNEI$city <- "Baltimore City"
        vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
        vehiclesLANEI$city <- "Los Angeles County"
        bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)
        
        ## plot using ggplot2
        png("plot6.png")
        library(ggplot2)
        
        ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
                geom_bar(aes(fill=year),stat="identity") +
                facet_grid(scales="free", space="free", .~city) +
                guides(fill=FALSE) + theme_bw() +
                labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
                labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
        
        print(ggp)
        
        dev.off()
        
}
## LA has seen greater changes over time in motor vehicle emissions.

        