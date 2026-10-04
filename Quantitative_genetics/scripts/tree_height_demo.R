# ============================================================
# QUANTITATIVE GENETICS DEMO
# Estimating the genetic contribution to variation in tree height
# using simulated tree-family data
#
# Made for skill demonstration purposes by HK
# ============================================================

# IMPORTANT:
# This is a deliberately simplified demonstration. In real tree
# breeding data, estimating narrow- or broad-sense heritability
# requires information about the experimental design, genetic
# relationships, mating structure and potentially shared
# environmental effects.

# ------------------------------------------------------------
# SETUP: Load the required package
# ------------------------------------------------------------

# The lme4 package contains the lmer() function, which is used
# to fit linear mixed-effects models.
#
# A mixed model is useful here because tree height contains
# both an overall average and variation among tree families.

# Run this installation command only once:
# install.packages("lme4")

# Load the installed package for the current R session.
library(lme4)


# ------------------------------------------------------------
# STEP 1: Simulate tree-family data
# ------------------------------------------------------------

# Because this is a demonstration, we generate an artificial
# dataset instead of importing measurements from a real trial.

# The simulated dataset represents an experiment with:
# - 10 tree families
# - 20 individual trees in each family
# - 200 trees in total

# Set the random seed.
# R uses random numbers when generating the family effects and
# residual variation. The seed ensures that the same simulated
# values are produced each time the script is run.
# This makes the analysis reproducible: another person using
# this script will obtain the same dataset and results.
set.seed(123)


# Create the family identifier for every tree.
# rep() repeats family numbers 1 to 10.
# The argument each = 20 means that every family number occurs
# 20 times because each family contains 20 individual trees.
family <- rep(1:10, each = 20)


# Store family as a categorical variable.
# Family numbers are identifiers rather than numerical
# measurements. Converting family to a factor tells R that
# families represent separate groups, not a continuous scale.
family <- factor(family)


# Simulate one genetic effect for each family.
# rnorm() draws values from a normal distribution:
# - 10 means that one effect is generated for each family
# - mean = 0 means that family effects are centred around zero
# - sd = 5 controls how strongly families differ from each other
# A positive value represents a family with above-average
# growth potential. A negative value represents a family with
# below-average growth potential.
# In this simplified simulation, every tree belonging to the
# same family shares the same simulated family effect.
genetic_effect <- rnorm(
  n = 10,
  mean = 0,
  sd = 5
)


# Simulate the observed height of each tree.
# The phenotype is generated using the simplified equation:
#_______________________________________________________________
# phenotype = population mean + family effect + residual effect
#_______________________________________________________________
# Here:
# - 100 is the overall population mean height
# - genetic_effect[family] adds the appropriate family effect
# - rnorm(..., sd = 4) adds individual residual variation

# The residual term represents differences among trees that
# are not explained by family in this model. These can be
# thought of as environmental and other unexplained effects.
height <- 100 +
  genetic_effect[family] +
  rnorm(
    n = 200,
    mean = 0,
    sd = 4
  )


# Combine the family identifiers and tree heights into one
# dataframe. Each row now represents one individual tree.
trees <- data.frame(
  family,
  height
)


# Display the first six observations to check that the dataset
# was created correctly.
head(trees)


# Examine the structure of the dataframe.
# This verifies that:
# - family is treated as a factor
# - height is treated as a numerical variable
str(trees)


# ------------------------------------------------------------
# STEP 2: Visualise the distribution of tree heights
# ------------------------------------------------------------

# Increase the lower plot margin so that the explanatory caption
# has enough space below the x-axis label.
# The four values control the bottom, left, top and right margins.
par(mar = c(6, 4, 4, 2))


# Create a histogram of all observed tree heights.
# A histogram shows the phenotypic distribution of the trait.
# At this stage, trees from all families are pooled together.
# The histogram therefore shows total observed variation but
# does not yet separate genetic and residual variation.
hist(
  trees$height,
  main = "Distribution of Simulated Tree Heights",
  xlab = "Tree height",
  ylab = "Number of trees",
  col = "lightgreen",
  border = "white"
)


# Add an explanatory caption underneath the plot.
mtext(
  "Observed variation contains both family and residual effects.",
  side = 1,
  line = 4.5,
  cex = 0.8
)


# ------------------------------------------------------------
# STEP 3: Compare tree heights among families
# ------------------------------------------------------------

# Again, increase the lower margin to make space for the caption.
par(mar = c(6, 4, 4, 2))

# Create a boxplot showing the height distribution separately
# for each family.
# Each box represents the middle 50% of tree heights within one
# family. The horizontal line inside each box is the median.
# Differences in the positions of the boxes show that some
# families tend to have taller or shorter trees than others.
# In this simulation, these differences arise because each
# family was assigned a different genetic effect.
boxplot(
  height ~ family,
  data = trees,
  main = "Tree Height by Family",
  xlab = "Family",
  ylab = "Tree height",
  col = "lightblue"
)

# Add a caption explaining the interpretation.
# The wording says "family-level variation" rather than claiming
# that every observed difference is necessarily genetic. This is
# a more careful interpretation that also works as preparation
# for analysing real experimental data.
mtext(
  "Differences among family means indicate family-level variation.",
  side = 1,
  line = 4.5,
  cex = 0.8
)


# ------------------------------------------------------------
# STEP 4: Fit a linear mixed-effects model
# ------------------------------------------------------------

# Fit a random-intercept model:
# height ~ 1 + (1 | family)
# height:
# The response variable whose variation we want to explain.

# 1:
# The fixed intercept, representing the overall mean height
# across all trees and families.

# (1 | family):
# A random intercept for family. This allows every family to
# have its own expected mean height.

# The model separates the observed variation into:
# 1. variation among family means
# 2. residual variation among trees within families
model <- lmer(
  height ~ 1 + (1 | family),
  data = trees
)


# Display the model summary.
# The summary includes:
# - the estimated overall mean height
# - the estimated family variance
# - the estimated residual variance
# - information about the number of observations and families
summary(model)


# ------------------------------------------------------------
# STEP 5: Extract the variance components
# ------------------------------------------------------------

# VarCorr() extracts the estimated random-effect variances.
# as.data.frame() converts the output into a dataframe so that
# the individual variance estimates can be accessed easily.
vc <- as.data.frame(VarCorr(model))

# Print the variance-component table.
print(vc)

# Extract the variation among families.
# Because family is the only random grouping variable, the first
# row contains the estimated family-level variance.
# In this simplified simulation, the family effect was explicitly
# generated as a genetic effect. We therefore label this estimate
# VG for the purpose of the demonstration.
VG <- vc$vcov[vc$grp == "family"]

# Extract residual variation.
# Residual variance describes differences among individual trees
# that remain after family-level differences have been accounted
# for.
# In this simulation, residual variation was generated as random
# individual variation with a standard deviation of 4.
VE <- vc$vcov[vc$grp == "Residual"]


# ------------------------------------------------------------
# STEP 6: Calculate the genetic variance proportion
# ------------------------------------------------------------

# The total phenotypic variance in this simple model is calculated
# as the sum of family-level and residual variance:
#_______________
# VP = VG + VE
#_______________
VP <- VG + VE

# Calculate the proportion of total phenotypic variance attributed
# to the simulated family-level genetic effect:
#_______________
# H2 = VG / VP
# A value close to zero would mean that most height variation
# occurs within families.
# A value close to one would mean that family differences explain
# most of the observed height variation.
H2 <- VG / VP


# ------------------------------------------------------------
# STEP 7: Print a concise summary
# ------------------------------------------------------------

# round() makes the output easier to read.
# cat() combines labels and calculated values in the console.
cat("\n--- Variance component results ---")
cat("\nFamily-level variance:", round(VG, 2))
cat("\nResidual variance:", round(VE, 2))
cat("\nTotal phenotypic variance:", round(VP, 2))
cat("\nGenetic variance proportion:", round(H2, 3))
cat("\n")