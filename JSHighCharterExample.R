setwd("~/Documents/R")

require(highcharter)

df1 <- read.csv("TempData.csv")

names(df1)<- c("Year", "Annual_Mean", "Mean_5Y")


#define colors
colors <- c("#0044b2","#91bbff","#ffc170","#ff5900")


#set tooltip mapping – constructs using X "labels", and Y "data references"
x <- c("Year", "Delta (°C)")
y <- sprintf("{point.%s}",c("Year","Annual_Mean"))
#print
# "{point.Year}"        "{point.Annual_Mean}"

#construct the table to pass to hc_tooltip
tltip <- tooltip_table(x, y)

#use colorize to apply colors to Data
df1$Color <- colorize(df1$Annual_Mean,colors)

#define the chart 
#(data,shape, hc AES(x,y,color, etc.))

h1 <- hchart(df1,"column", hcaes(x=Year,y= Annual_Mean, color =Color), pointWidth=20) %>%
  hc_yAxis(title = list(text = "Annual Delta from Mean (°C)")) %>%
  hc_title(text = "Global Temperature Data (1870-2016) <br/> Delta From 1951-1980 Avg") %>%
  hc_tooltip(useHTML = TRUE, headerFormat = "", pointFormat = tltip) %>%
  #caption
  hc_credits(enabled = TRUE, text = "Source: http://climate.nasa.gov/vital-signs/global-temperature/",
             href = "https://climate.nasa.gov/vital-signs/global-temperature/") %>% 
  hc_exporting(enabled = TRUE)  %>%
  hc_size(height = 600)