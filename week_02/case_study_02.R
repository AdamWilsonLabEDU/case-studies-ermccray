library(tidyverse)

#load in the data
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS_v4/tmp_USW00014733_14_0_1/station.csv"

#import data as a table
read_table(file = dataurl)

#tell source that you want to access the data 
httr::GET("https://data.giss.nasa.gov/cgi-bin/gistemp/stdata_show_v4.cgi?id=USW00014733&ds=14&dt=1")

#create a temp dataset using our pre-defined "dataurl"
#define "999.90" as NA (missing data)
#skip row one (variable names)
#rename column names (b/c original contains "-")
temp = read_csv(dataurl,
                na = "999.90",
                skip = 1,
                col_names = c("YEAR", "JAN", "FEB", "MAR",
                              "APR", "MAY", "JUN", "JUL",
                              "AUG", "SEP", "OCT", "NOV",
                              "DEC", "DJF", "MAM", "JJA",
                              "SON", "metANN"))

#view our dataset as an interactive table
View(temp)

#summary statistics for our data
summary(temp)

#create line graph using year on the x axis and mean summer temp on the y axis
ggplot(data = temp, aes(x = YEAR, y = JJA)) +
  geom_line() +
  
  #create a smooth line in the data and make it pink :)   
  geom_smooth(col = "deeppink") +
  
  #label the x and y axis
  xlab("Year") +
  ylab("Mean Summer Temperature (C)") +
  
  #title your graph
  ggtitle("Mean Summer Temperatures in Buffalo, NY")

#save your graph as a png; define height, width, and path to save to
ggsave(filename = "cs2_graph",
       device = 'png',
       plot = last_plot(),
       path = "/Users/emilymccray/Desktop/GEO511",
       width = 5.7, 
       height = 4)

#conclusion: grandpa is right, summers have been getting hotter!