#Collin Kennedy- UC Davis
#import data:
library(readr)
ps2_data <- read_csv("ps2_data.csv")
View(ps2_data)

#
library(dplyr)
library(ggplot2)


#1====================================================================================================
ps2_data %>%
  summary()
#There are 560 observations

#The minimum price is $20, and the maximum price is $75. The average price is $47.50

#Business Customers
# - The minimum quantity purchased by business customers is 320 units
# - The maximum quantity purchased by business customers is 1751 units
# - The average quantity purchased by business customers is 1049 units.

#Leisure Customers
# - The minimum quantity purchased by leisure customers is 29 units.
# - The max quantity purchased by leisure customers is 1926 units.
# - The avg quantity purchased by leisure customers is 973.9 units.


 #2 Estimate demand===================================================================================
dBusiness = lm(Q_business ~ price, data  = ps2_data)
summary(dBusiness)

dLeisure = lm(Q_leisure ~ price, data = ps2_data)
summary(dLeisure)

ggplot(data = ps2_data,mapping = aes(x = Q_business, y = price))+
  geom_point(mapping = aes(x = Q_business, y = price))+
  geom_smooth(method = "lm",se=FALSE)+
  ggtitle(label = "Inverse Demand: Business Customers")

ggplot(data = ps2_data,mapping = aes(x = Q_leisure, y = price))+
  geom_point(mapping = aes(x = Q_leisure, y = price))+
  geom_smooth(method = "lm",se=FALSE)+
  ggtitle(label = "Inverse Demand: Leisure Customers")
