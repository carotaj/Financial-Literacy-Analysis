# Financial-Literacy-Analysis
*Comparative Analysis* of Financial Literacy in Italy with **Stata**

## Introduction
This study examines changes in financial literacy in Italy from 2016 to 2020, using data from two waves of the **Bank of Italy Survey** on Household Income and Wealth (SHIW). The analysis compares financial literacy levels over time across both full and restricted samples, with the restricted sample focusing on households surveyed in both years to ensure consistency.

Financial literacy (FL) is essential for informed financial decision-making, impacting savings, investments, and debt management. This research aims to 
- (1) identify key factors influencing FL, such as gender, income, education, and region, and
- (2) assess changes in FL over time.

An ordered probit with random effect model is used to analyze real and predicted FL levels, offering insights into demographic influences.

Preliminary results indicate a rise in overall FL from 2016 to 2020 in the full sample, with factors like education and geographic location significantly shaping FL levels. However, trends remain stable in the restricted sample, underscoring the persistence of financial literacy patterns among common households.

## Financial literacy definition
To measure financial literacy in Italy, this study employs specific questions from the Survey on Italian Household Income and Wealth (SHIW), focusing on key financial concepts: interest rates, inflation, and risk diversification. Three essential questions assess knowledge in these areas, testing respondents' understanding of compound interest, inflation’s impact on purchasing power, and the advantages of portfolio diversification.

Responses to these questions were scored: each correct answer received 1 point, while incorrect, "don't know," or no responses received 0 points. These were then combined to create a composite financial literacy indicator, named finliteracy, with four levels:

- **No knowledge:** 0 correct answers
- **Low knowledge:** 1 correct answer
- **Medium knowledge:** 2 correct answers
- **High knowledge:** 3 correct answers

The ordered nature of finliteracy makes it ideal for analysis through models like the ordered probit model, which is used to examine the influence of demographic and socioeconomic factors on financial literacy levels across 2016 - and 2020. This categorization underpins the study's subsequent exploration of variables impacting financial literacy.

## EDA
This section provides an overview of the independent variables used to analyze financial literacy differences, focusing on their roles in shaping individuals' financial knowledge. 

The main variables examined are:

- Income (y)
- Education Level (studio)
- Savings (deposit)
- Gender (sex)
- Age (eta)
- Geographical Area (area5)
  
These variables serve as essential factors in identifying the primary drivers of financial literacy in the dataset.

![Summary Table](./images/picture.png)

### 1) Income
Income is analyzed as a key factor influencing financial literacy, using its logarithmic transformation to account for extreme values and capture non-linear effects. Missing income data were replaced with zero, assuming minimal income for non-reporting individuals. Preliminary analysis shows a positive relationship between income and financial literacy, with higher income levels correlating with greater financial knowledge. This trend is consistent across both the 2016 and 2020 datasets, as depicted in Figure 5.

### 2) Education Level
Education is a critical factor in financial literacy. Higher education levels, such as university degrees, correlate with greater financial literacy, where individuals with advanced qualifications tend to perform better on financial knowledge assessments. The variable studio categorizes education levels into eight ordered tiers, from "No title" to "Postgraduate qualification." Observing the distribution, we find that financial literacy levels are higher among those with advanced degrees. While descriptive analysis shows this positive association, the regression model will quantify education's impact on financial literacy.

### 3) Savings
The deposit variable indicates whether a respondent has a savings account, coded as 1 for holders and 0 for non-holders. The majority—93% in 2016 and 97% in 2020—hold savings accounts, suggesting a high engagement with financial products. Financial literacy levels are notably lower among those without savings, highlighting the potential role of financial product engagement in shaping financial knowledge. This association will be further analyzed in the model to assess savings as a predictor of financial literacy.

### 4) Gender
Gender differences in financial literacy are examined using the variable sex, recoded to 0 for males and 1 for females. In the 2020 sample, females make up only 36%, likely due to the predominance of male "householders" in the data, while the 2016 sample is more balanced. Analysis reveals that females exhibit a near-uniform distribution across financial literacy levels, whereas males are more concentrated in higher literacy categories. A Chi-squared test confirmed a strong association between gender and financial literacy at a 0.001 significance level, indicating that males generally demonstrate higher financial literacy levels than females. Figure 8 illustrates this distribution.

### 5) Age
Age is represented by the continuous variable eta, ranging from 17 to 98 years in 2020 and from 18 to 101 years in 2016. The average age across the 2020 sample is about 62 years. For analysis, age has been grouped into five categories through cleta5:

- Up to 34 years
- 35–44 years
- 45–54 years
- 55–64 years
- Over 64 years

Individuals with no financial literacy (finliteracy = 0) tend to be older, with an average age class of 4.18, largely falling into the oldest category. Higher financial literacy levels correspond to slightly younger age groups, with the most financially literate group (finliteracy = 3) averaging 3.91, indicating a younger profile among the financially literate.

### 6) Geographic Area
Geographic location is another important factor influencing financial literacy, categorized into five regions:

- North-East
- North-West
- Centre
- South
- Islands

The analysis shows clear regional differences, with higher financial literacy levels more prevalent in the northern regions, while literacy tends to decrease in the South. Interestingly, the Centre and Islands regions show a more balanced distribution across literacy categories. A Chi-squared test at the 0.001 significance level strongly supports the association between financial literacy and geographic location, confirming that region plays a substantial role in financial literacy, with the North generally leading and the South lagging.


### Model
The interpretation of β coefficients in the context of the random effects ordered probit model is crucial to understanding the relationship between the independent variables and financial literacy levels. In this model, the β coefficients correspond to a latent variable, 
𝑦
𝑖
∗
y 
i
∗
​
 , which underlies the observed ordinal categories of financial literacy. A positive β coefficient indicates that as the associated independent variable increases, the latent variable 
𝑦
𝑖
∗
y 
i
∗
​
  also increases, raising the probability of the individual falling into a higher financial literacy category (e.g., “high knowledge”) and reducing the probability of being in a lower category (e.g., “no knowledge”). However, effects on intermediate categories (like “low” or “medium” knowledge) are more complex and may vary.

Using the random effects ordered probit model accounts for the panel structure of the data, capturing the unobserved heterogeneity between individuals observed over time. This approach better models the intra-individual correlations, leading to more accurate coefficient estimates in our context compared to a standard ordered probit model.

The overall model is statistically significant, as indicated by a p-value close to zero, allowing us to reject the null hypothesis that all coefficients are jointly equal to zero.

Goodness-of-Fit
Goodness-of-fit measures are useful for assessing how well the model aligns with the observed data. A common metric, the McFadden Pseudo-R², is defined as:

Pseudo-R² = 1 - log L1 / log L0
​
where log L_1 is the log-likelihood of a baseline model with only a constant term. McFadden (1977) suggests that values between 0.2 and 0.4 indicate an excellent fit. However, our Pseudo-R² falls short of this range, suggesting that alternative model specifications may improve fit.

This updated approach, using a random effects model, offers a more robust assessment of factors influencing financial literacy, incorporating individual differences over time within the panel structure.
