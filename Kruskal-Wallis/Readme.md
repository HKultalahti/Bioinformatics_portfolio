# 📊 ANOVA & Kruskal-Wallis

Here I demonstrate my skills with statistical analysis methods ANOVA and Kruskal-Wallis. This example (including R scripts) is for demonstration purposes only. The theme and variables are from my master's thesis "Muurahaisten RNA-viruskirjon kartoitus" (Mapping of the ant RNA virome).


>[!NOTE]
> **DISCLAIMER:** As my thesis and its results is not publically available, I have randomized my data. The numerical variables in the data are completely randomized to protect the actual results and conclusions of my thesis. To conclude, these results are based on fictional data and hence the results and conclusions presented here should not be considered cientifically accurate.

## 💬 Example

In my example here, we have a data consisting of:
- ant species, we know the size of the colony (small, medium or large) they were collected from
- how many virus species we have found in each ant species trough lazypipe analysis

![portfolio_boxplot](https://github.com/user-attachments/assets/22881944-45fa-49e0-b3dc-2d3849ffce8b)

The visualization can tell us something. As the median line in all different colony sizes seems to be almost the same, this would suggest that the colony size has little effect on the amount of found viruses. But as the boxes have different sizes and the whiskers look different, that would suggest that the distribution within colony sizes differ and hence the colony size does matter. As a picture does not give a simple answer, let's do a statistical analysis via Kruskal-Wallis or ANOVA. 
_____
**Research question = Is there a correlation between colony size and number of virus species found?**

**Hypothesis = The bigger the colony, the more viruses are found**
_____

I came to this hypothesis based on the thought experiment that bigger colony means larger amount of individuals that are scavenging the environment outside the colony. This could lead to more exposure to pathogens and lead to more virues found in the colony.

To decide whether to perform ANVOA or Kruskal-Wallis must we determine whether the data is normally distributed. This has to be done to every categorial variable (small, medium and large colony size).
