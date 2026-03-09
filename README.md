# The Study of Wine Quality
This project explores the relationship between chemical properties of wine and overall wine quality using statistical analysis in **R**. The analysis uses the Wine Quality dataset to examine how factors such as acidity, residual sugar, density, and alcohol content influence expert quality ratings.

The goal of this project is to apply **exploratory data analysis, statistical inference, and hypothesis testing** to understand which chemical characteristics are most associated with higher wine quality scores.

---

## Dataset
The dataset contains physicochemical measurements of Portuguese red and white wines along with a quality score assigned by wine experts.

The repository includes the following data files:
- `winequality-red.csv` – red wine dataset
- `winequality-white.csv` – white wine dataset
- `winequality.names` – dataset documentation and variable descriptions

---

## Analysis Methods
The analysis applies several statistical techniques to investigate patterns in the dataset.

### Exploratory Data Analysis (EDA)
Exploratory analysis was conducted to understand variable distributions and relationships between wine characteristics and quality scores. This included:
- Summary statistics
- Distribution analysis
- Scatterplots and correlation analysis

### Statistical Inference
Statistical inference techniques were used to estimate population characteristics and quantify uncertainty in the dataset. Methods included:
- Confidence intervals
- Sampling distributions
- Bootstrapping techniques

### Hypothesis Testing
Hypothesis testing was used to determine whether observed differences between variables were statistically significant. Techniques included:
- Two-sample t-tests
- Analysis of variance (ANOVA)
- Chi-square test
- Permutation test

---

## Key Insights
Several patterns emerged from the analysis:
- **Alcohol content** tends to have a positive relationship with wine quality scores.
- **Volatile acidity** often shows a negative relationship with wine quality.
- **Density and residual sugar** demonstrate statistically significant associations with quality but show weaker predictive strength.
- Chemical composition plays an important role in how wines are evaluated by experts.

---

## Repository Contents
This repository contains:

R Scripts:
- `wine_quality_eda.R` – exploratory data analysis
- `wine_quality_inference_hypothesis.R` – statistical inference and hypothesis testing

Reports:
- `wine_quality_eda_report.pdf`
- `wine_quality_inference_report.pdf`
- `wine_quality_hypothesis_report.pdf`

Datasets:
- `winequality-red.csv`
- `winequality-white.csv`
- `winequality.names`

---

## Tools Used
- **R** — primary language for all analysis
- **tidyverse** — data manipulation and visualization (includes ggplot2, dplyr, readr)
- **e1071** — skewness calculations and distribution fitting
- **MASS** — maximum likelihood estimation via `fitdistr()`
- **boot** — bootstrapping methods

---

## Project Context
This project was completed as part of coursework in **statistical computing** and demonstrates how statistical methods and exploratory data analysis can be applied to real-world datasets to uncover meaningful insights.
