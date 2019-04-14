plot1 <- function(){
        ## This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        ## aggregate the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
        aggTotals <- aggregate(Emissions ~ year,NEI, sum)
        
        ## use the base plotting system and plot the total PM2.5 Emission from all sources
        png("plot1.png")
        
        barplot(
                                   (aggTotals$Emissions)/10^6,
                                   names.arg=aggTotals$year,
                                   xlab="Year",
                                   ylab="PM2.5 Emissions (10^6 Tons)",
                                   main="Total PM2.5 Emissions From All US Sources"
                               )
        
        dev.off()

}

## As shown in the plot, total emissions have decreased in the US from 1999 to 2008.