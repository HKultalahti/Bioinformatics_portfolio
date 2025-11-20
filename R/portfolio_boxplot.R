#Colony size and amount of found viruses boxplot
#Disclaimer: numbers are randomised between 0 and 43
#For skill demonstration purposes only, do not take results as true science
#Made by Henna Kultalahti 

#libraries

library(tidyverse)
library(ggplot2)
library(readxl)

#bringing data, replace with your own file paths
KUUSI_koloniakoko_virusmaara <- read_excel("C:/Users/Sam/Desktop/GRADU/R_kuvaaja_data JA KAIKKI TAULUKOT/portfolio_boxplot.xlsx")

#making categoric variables aka colony sizes to show in order
KUUSI_koloniakoko_virusmaara$koloniakoko <- factor(KUUSI_koloniakoko_virusmaara$koloniakoko, 
                                                   levels = c("Small", "Medium", "Large"))

#making boxplot with ggplot, you can play with colors if you want
KUUSI_koloniakoko_virusmaara %>%
  ggplot(aes(koloniakoko, virusmaara))+
  geom_boxplot() +
  theme_bw() +
  labs(x = "Colony size", y = "Virus species found", title = "The relationship between colony size and found virues" )
