d <- read.csv('epiSEIHCRD_combAge.csv') # get covid data 
data <- read.csv('epiSEIHCRD_combAge.csv') # get covid data 
library(ggplot2) # load ggplot
d$t = as.Date(d$t,origin = '2020-03-01') # convert the t col to date and set the origin to 2020-03-01
filter_d = d[d$t >= as.Date('2020-07-01') & d$t <= as.Date('2020-12-01'),c('t','H')]

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                "#0072B2", "#D55E00", "#CC79A7")
palette(cbbPalette)


g = ggplot(filter_d, aes(x = t , y = H)) +
  geom_line() + 
  xlab('Date') +
  ylab('Numer of Hospital Beds Needed') +
  ggtitle('Hospital Beds Needed: July to December 2020')

print(g)
