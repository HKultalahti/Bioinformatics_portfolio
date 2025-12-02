# 📊 ANOVA & Kruskal-Wallis

Here I demonstrate my skills with statistical analysis methods ANOVA and Kruskal-Wallis. This example (including R scripts) is for demonstration purposes only. The theme and variables are from my master's thesis "Muurahaisten RNA-viruskirjon kartoitus" (Mapping of the ant RNA virome).


>[!NOTE]
> **DISCLAIMER:** As my thesis and its results is not publically available, I have randomized my data. The numerical variables in the data are completely randomized to protect the actual results and conclusions of my thesis. To conclude, these results are based on fictional data and hence the results and conclusions presented here should not be considered cientifically accurate.

## 💬 Example 1: correlation between colony size and found viruses?

In my example here, we have a data consisting of:
- ant species, we know the size of the colony (small, medium or large) they were collected from
- how many virus species we have found in each ant species trough lazypipe analysis

![portfolio_boxplot_final](https://github.com/user-attachments/assets/bab888c0-17b0-4c08-8ca2-5e310154d71b)

The visualization can tell us something. As the median line in all different colony sizes seems to be almost the same, this would suggest that the colony size has little effect on the amount of found viruses. But as the boxes have different sizes and the whiskers look different, that would suggest that the distribution within colony sizes differ and hence the colony size does matter. As a picture does not give a simple answer, let's do a statistical analysis via Kruskal-Wallis or ANOVA. 

>[!IMPORTANT]
> **Research question = Is there a correlation between colony size and number of virus species found?**\
> **Hypothesis = The bigger the colony, the more viruses are found**

I came to this hypothesis based on the thought experiment that bigger colony means larger amount of individuals that are scavenging the environment outside the colony. This could lead to more exposure to pathogens and lead to more virues found in the colony.

To decide whether to perform ANVOA or Kruskal-Wallis must we determine whether the data is normally distributed. This has to be done to every categorial variable (small, medium and large colony size).

### ANOVA or Kruskal-Wallis?

To figure out the method to use, must we first

- [ ] Check if the data is distributed normally\
  if yes = ANOVA\
  if no = Kruskal-Wallis

### Checking distribution with Shapiro-Wilk

🖇️ R scripts for this stage found in this folder

> [!IMPORTANT]
> H₀ = data is normally distributed\
> H₁ = data is not normally distibuted

Shapiro-Wilk test will give two valus we use to make our analysis=\
W-value = The closer to 1, the better data obeys the normal distribution\
p-value = Used to decide whether to abandon null-hypothesis\
  if p-value > 0.05 we can't abandon null-hypothesis meaning the data is normally distributed
  if p-value < 0.05 we can abandon null-hypothesis meaning the data is not normally distributed

As in this example we have categorical variables (small, medium and large) we have to check if our numerical variables (amount of viruses) is normally distributed in each category separately.

#### Small colony 

Shapiro-Wilk test results:\
W = 0.93893, p-value = 0.5412\

![portfolio_shapiro_hist_small](https://github.com/user-attachments/assets/7cd3e42d-f874-4345-af93-4137457e4e83)
![portfolio_shapiro_qq_small](https://github.com/user-attachments/assets/7268e60e-264c-459e-9962-01f56857fa4e)


**Conclusion:** Since the W-value is close to 1 and we can not abandon null-hypothesis, we can conclude that the the amount of viruses in the small -category **is normally distributed** 
-> Suggesting we use ANOVA

#### Medium colony

Shapiro-Wilk test results:\
W = 0.88768, p-value = 0.09068\

![portfolio_shapiro_hist_medium](https://github.com/user-attachments/assets/10240ac1-82b2-4bac-a356-4c9d262b0e00)
![portfolio_shapiro_qq_medium](https://github.com/user-attachments/assets/6f5c92ac-7280-4466-9a06-38d7de5386aa)


**Conclusion:** w-value suggest quite close to normal distribution and we can't abandon null-hypothesis, this suggests that data **is normally distributed** although not very nicely, there might be serious skewness


#### Large colony

Shapiro-Wilk test results:\
W = 0.92905, p-value = 0.02621\

![portfolio_shapiro_hist_large](https://github.com/user-attachments/assets/36cac2ce-24d8-4179-9327-4c68f9e9e88d)
![portfolio_shapiro_qq_large](https://github.com/user-attachments/assets/36775a69-ebc7-4bfe-938a-c39fd880fb94)


**Conclusion:** w-value suggests close to normal distribution but because of low e-value, we have to abandon null hypothesis meaning data **is not normally distributed**

## Kruskal-Wallis

Kruskal-Wallis is used to determine if the medians of 3 or more groups are statstically different from each other. The test does not require normal distribution.\
Explaining the results:\
**Chi squared χ²** : how much do the groups differ from each other, the bigger number, the bigger possibility that the differences are real\
**Degrees of freedom df** : number of groups -1 (in this case df=2)\
**p-value** : p<0.5 means there is a statistically significant difference between groups and p>0.5 no statistiaclly meaningful differences 


As our categories (small, medium and large) are not all normally distributed, let's use Kruskal-Wallis to answer our original quetion, which was:\
**Research question = Is there a correlation between colony size and number of virus species found?**\

As reults we got:
```
Kruskal-Wallis rank sum test

data:  virusmaara by koloniakoko
Kruskal-Wallis chi-squared = 0.0016882, df = 2, p-value = 0.9992

```
Meaning:

**χ²** = is very close to 0, meaning no significant differences detected between groups\
**p-value** is very close to 1 meaning the probability of differences between groups is very small

## Conclusion

The colony size categories in our data are not all normally distributed and hence we chose to move on with Kruskal-Wallis.\
As Kruskal-Wallis results above show, the differences between the groups are not caused by colony size meaning that colony size has no effect on how many viruses are found.



