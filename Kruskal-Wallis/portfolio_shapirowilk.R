# Shapiro-Wilk test to determine normal distribution
# This script is for skill demonstration purposes only
# Made by Henna Kultalahti

# library
library(readxl)

#bringing in the data
colony_all <- read_excel("C:/Users/Sam/Desktop/GRADU/R_kuvaaja_data JA KAIKKI TAULUKOT/portfolio_boxplot.xlsx")

#let's separate the different categories
colony_small <- subset(colony_all, koloniakoko == "Small")
colony_medium <- subset(colony_all, koloniakoko == "Medium")
colony_large <- subset(colony_all, koloniakoko == "Large")

#let's check our separated subset of the data
view(colony_small)
view(colony_medium)
view(colony_large)

#let's do normality testing for all different datas
shapiro.test(colony_small$virusmaara)
shapiro.test(colony_medium$virusmaara)
shapiro.test(colony_large$virusmaara)

#let's do histograms to visualize the normality

hist(colony_small$virusmaara,
     main = "Histogram: Viruses in small colony size",
     xlab = "Number of virus species",
     col = "lightpink",
     breaks = 10,
     border = "red")

hist(colony_medium$virusmaara,
     main = "Histogram: Viruses in medium colony size",
     xlab = "Number of virus species",
     col = "lightyellow",
     breaks = 10,
     border = "orange")

hist(colony_large$virusmaara,
     main = "Histogram: Viruses in large colony size",
     xlab = "Number of virus species",
     col = "lightblue",
     breaks = 10,
     border = "blue")


#let's make qq plots too
qqnorm(colony_small$virusmaara,
       main = "Q-Q plot: small colony size")
qqline(colony_small$virusmaara, col= "red")

qqnorm(colony_medium$virusmaara,
       main = "Q-Q plot: medium colony size")
qqline(colony_medium$virusmaara, col= "orange")

qqnorm(colony_large$virusmaara,
       main = "Q-Q plot: small large size")
qqline(colony_large$virusmaara, col= "blue")
