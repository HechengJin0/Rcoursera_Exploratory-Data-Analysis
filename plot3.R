plot3 <- function(){
        ## This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        ## total emissions from PM2.5 in the Baltimore City,fips=="24510"
        baltimoreNEI <- NEI[NEI$fips=="24510",]
        ## Use the ggplot2 plotting system
        png("plot3.png")
        library(ggplot2)
        ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
                geom_bar(stat="identity") +
                theme_bw() + guides(fill=FALSE)+
                facet_grid(.~type,scales = "free",space="free") + 
                labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
                labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
        
        print(ggp)
        
        dev.off()
}

## As shown in the result, non-road, nonpoint, on-road source types have all seen decreased emissions overall from 1999-2008 in Baltimore City.

## There is a increasing trend in point source, especially 1999 to 2005.

