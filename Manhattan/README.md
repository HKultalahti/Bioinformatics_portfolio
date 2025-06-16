# 🏙️ Manhattan plots 🏙️
by Henna Kultalahti made by instructions from [alfonsosaera](https://github.com/alfonsosaera/myManhattan/blob/master/README.md)
In this file I aim to explain the idea of a Manhattan plot very clearly and demostrate a way of doing it

## ❔ What is a Manhattan plot? 
Manhattan plot is a scatter plot that shows *visually* chromosomes on X axis and dots on the Y axis. These dots represent SNPs that have a p -value (in negative log10). 
*Biologically* Manhattan plot shines light on the connection between SNPs and a phenotype. Meaning is it an important tool in analysing if a SNP has a connection with a disease.

## 🅿️ P -value and hypothesis and what in means for GWAS
It is crucial to understand, what is the question behind the p -value and what does the actual number mean. 
So the question when calculating p -value could be put into simple words as follows: 
_________
*"How likely is it that as strong or even stronger association between the SNP and the phenotype could arise just by chance, if the SNP actually has no real effect?"*
________

The p -value is tied to the hypotheses like so:

H0 (null hypothesis) = SNP has no connection to phenotype
H1 (alternative hypothesis) =  SNP has a connection to phenotype

In other words:
*p -value = the probability of observing this statistical difference (or a more extreme one), if the null hypothesis is true*
And to put the p -value and the null hypothesis into even more plainly: 
*p -value shows how well our finding fits with null hypothesis (= there is no connection)*

So,
**a lower p -value suggests a statistically significant connection between a SNP and a phenotype** while a higher p -value suggests that the connection between a SNP and a phenotype is not statistically significant.

All is clear and we understand the p -value, right? Let's stop yapping and get into creating a plot!


## Let's build a skyscraper beam by beam

aka this is how to do it-

The script is from Alfonso's repository.
The data is from Alfonso's repository.

Let's get our material

``` git clone https://github.com/alfonsosaera/myManhattan.git ```

Let's decide to name our data hmanhattan inspired by Henna's Manhattan and look at it


``` hmanhattan <- read.table("example.txt") ```
head(hmanhattan)





**more coming on 18th of June**
