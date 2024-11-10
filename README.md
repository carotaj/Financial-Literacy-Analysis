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

- Income (y): A continuous variable, logarithmically transformed to handle outliers and capture a non-linear relationship with financial literacy. Missing values were assigned a zero, assuming minimal income for non-reporting individuals. Higher income correlates with greater financial literacy across both survey years.
- Education Level (studio): Used to evaluate how formal education impacts financial knowledge.
- Savings (deposit): Assesses the influence of savings ownership on financial literacy.
- Gender (sex): Explores potential gender-based disparities in financial literacy.
- Age (eta): Considers the effect of age on financial literacy levels.
- Geographical Area (area5): Examines regional variations in financial knowledge.
  
These variables serve as essential factors in identifying the primary drivers of financial literacy in the dataset.
