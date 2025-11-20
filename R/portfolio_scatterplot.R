#Scatterplot for ant species, how many individuals in sample and how many viruses found in sample
#Ant species names are changed for ant 1 and so on. Numerical values are randomised.
#Disclaimer: all the values are randomised thus this is not real data so DO NOT take plot or results as true science
#For skill demonstration purposes only
#Made by Henna Kultalahti


#installing package to prevent ant names from showing on top of each other
install.packages("ggrepel")

#other libraries
library(datasets)
library(tidyverse)
library(ggrepel)
#library for bringing data
library(readxl)

#bringing data, replace with your own file path
myksilomaara_naytteessa_vs_virusmaara <- read_excel("C:/Users/Sam/Desktop/GRADU/R_kuvaaja_data JA KAIKKI TAULUKOT/portfolio_scatterplot.xlsx")


#line1 which data, whats's on the axis
#line2 draws the spots
#line3 creates regression line
#line4 adds nametags to spots, pushes them a bit above the spot. if you have many spots you might have to play with this
#line5 gives color theme
#line6 gives labels
#line7 stops x axis at 22 to make it look nicer
ggplot(myksilomaara_naytteessa_vs_virusmaara, aes(x = mnayttesssakpl, y = Virusmaara)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "lightblue") +  
  geom_text_repel(aes(label = Muurahaislaji), size = 3, nudge_y = 1.5) +  
  theme_bw() +
  labs(x = "Individuals in sample", y = "Virus species found", title = "The amount of virus species found in sample") +
  scale_x_continuous(limits = c(0, 22)) 
