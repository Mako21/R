# Challenge

I was exploring different R packages, and came across one called `highcharter`. `highcharter` is a R wrapper for the Java library Highcharts, and it provides some impressive capabilities to render interative charts.

# Set Up

The original inspiration for this graph seeing a Tableau rendering of the same data created by reddit user /u/... I first decided to recreate the graph in R using `ggplot2`.

# GGPLOT

Image

```
require(ggplot2)
df1 <- read.csv("TempData.csv")

#rename headers
names(df1)<- c("Year", "Annual_Mean", "Mean_5Y")

g1 <- ggplot(df1, aes(x=Year, y=Annual_Mean, fill=Annual_Mean))+
  	geom_bar(stat="identity",position="identity",size=.2,colour="#cccccc",width=3)+
  	scale_y_continuous(breaks=c(-.5,-.25,0,.25,.5,.75,1))+	
  	scale_fill_gradientn(colours=c("#0044b2","#91bbff","#ff8c00","#e55609"),space="Lab", guide=F)+
  	scale_x_continuous(breaks=seq(1870,2020,10))+
  	labs(title="Climate Change Data", x="Year",y="Annual Delta from Mean (°C)",caption="Source: http://climate.nasa.gov/vital-signs/global-temperature/")+
	theme_bw()+
	theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())
  
ggsave("TempGraph1.png", height=5, width=8,dpi=300)

```

# Highcarter Example

