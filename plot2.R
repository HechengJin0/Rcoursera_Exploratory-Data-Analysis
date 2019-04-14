plot2 <- function(){
        ## This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        ## aggregate total emissions from PM2.5 for Baltimore City, Maryland (fips="24510") 
        baltimoreNEI <- NEI[NEI$fips=="24510",]
        aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)
        
        ## use the base plotting system and plot the total PM2.5 Emission in Baltimore City 
        png("plot2.png")
        
        barplot(
                aggTotalsBaltimore$Emissions,
                names.arg=aggTotalsBaltimore$year,
                xlab="Year",
                ylab="PM2.5 Emissions (Tons)",
                main="Total PM2.5 Emissions From All Baltimore City Sources"
        )
        
        dev.off()
}

## As shown in the plot, there is a decreasing trend of total emissions from PM2.5 in Baltimore City, Maryland from 1999 to 2008.