# Welcome to view my demos in quantitative genetics

## Tree Height Heritability Analysis in R

This project demonstrates basic concepts of quantitative genetics using simulated forest tree data. The analysis estimates variance components and broad-sense heritability for tree height.

### Basics to understand before starting 

P = phenotype, in this case tree height
G = genotype
  VG = genetic variance 
E = environment 
  VE = environmental variance
H² = VG / (VG + VE) = heritability 

### Simulated data

DISCLAIMER! This data is fictional. It is simulated and randomized. This is why results from this demo should not be considered as actual scintific information.

We have 10 families of trees. In each family there are 20 trees.


### The analysis 

We have our simulated data that consists of 10 tree families. 
In this demo family = group of trees that more genetically more similar to each other than trees in other families.
In each family we have 20 trees. Alltoger we have   2oo trees in our data.

Assumptions: 
- Families are not genetically similar.
    In some families there are genes that lead to better growth.

in our demo R script

genetic_effect <- rnorm(10, mean = 0, sd = 5)

randomises this genetic effect for each family (+ 1cm, -3cm, +5cm etc.) This makes it so that there are differences between the families in our data.
This is important to know about our simulated data, because the first quesiton in quantitative genetics is:
Is there genetic variation in the population?
Quantitative genetics aims to determine how much of the observed variation in a trait is caused by such genetic differences.



Quantitative_genetics/figures/treeheight_histogram.png

Now looking at our trees you see different phenotypes, some are taller, some are shorter. The question we want to ask here is 
Is this because they belong to a certain family or because there is a lot of variation within family? 

Also because our study data consists of just a satunnaisotos of tree families, we are not interedted in specific families, instead what we are askin is:
How much do different families differ from each other? 

Heritability comes from 
H2 = VG / (VG + VE)
= 0.58
-> in this simulated data about 58 % of variance in tree height can be explained by differences between familes while about 42% can be explained by variance within the family.

