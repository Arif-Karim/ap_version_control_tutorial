d <- read.csv('epiSEIHCRD_combAge.csv') # get covid data 
data <- read.csv('epiSEIHCRD_combAge.csv') # get covid data 
library(ggplot2) # load ggplot
d$t = as.Date(d$t,origin = '2020-03-01') # convert the t col to date and set the origin to 2020-03-01
filter_d = d[d$t >= as.Date('2020-07-01') & d$t <= as.Date('2020-12-01'),]

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                "#0072B2", "#D55E00", "#CC79A7")
palette(cbbPalette)

g = ggplot(filter_d) +
  geom_line(mapping = aes(x = t , y = H, color = "Hospitalised")) + 
  geom_line(mapping = aes(x = t , y = C, color = "Critical")) + 
  geom_line(mapping = aes(x = t , y = D, color = "Dead")) + 
  xlab('Date') +
  xlab('Date') +
  ylab('Numer of Patients') +
  ggtitle('Covid Patients: July to December 2020') +
  scale_x_date(date_breaks = "1 month", date_minor_breaks = "1 week", date_labels = "%B")
  
print(g)
