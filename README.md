# US Candy Distributor 

# Table of Contents

- [Background and Overview](#background-and-overview)
    - [Introduction](#introduction)
    - [Objective](#objective)
      - [Scope](#scope)
- [Data Structure](#data-structure)
    - [Figure 1: Entity Relationship Diagram](#figure-1-:-entity-relationship-diagram)
- [Executive Summary](#executive-summary)
- [Insights Deep Dive](#insights-deep-dive)
- [Recommendations](#recommendations)


# Background and Overview
## Introduction
The US candy industry is a multi-billion dollar market consisting of a diverse range of products. This project aims to analyse a dataset of US Candy Distributor obtained from Maven Analytics to uncover the key trends, consumer preferences and opportunities for market growth in the US. The US Candy Distributor has a partnership with five candy factories to distribute 15 different types of candies to customers.

## Objective
The primary objective of this analysis is to provide a detailed understanding of sales dynamics within the US candy market. This includes identifying the most popular candy types and sales trends from 2021 to 2024. By achieving these objectives, we aim to offer the distributor actionable information to enhance their market position and priorities on candies customers love. 

### Scope
This analysis will encompass the following key areas:
1.	Factory analysis: evaluating the sales data across different factories to uncover each factory's profitability.
2.	Sales trends: examination of monthly, seasonal, and annual sales patterns to figure out peak periods and potential growth opportunities.
3.	Product performance: determine the best-selling candies.

The raw data can be found here.

The SQL queries utilised to clean, organise, and prepare raw data for the dashboard can be found here.

An interactive Power BI dashboard can be downloaded here.

# Data Structure
The US Candy Distributor database structure, as seen in Figure 1 consists of six tables: date, location, candy_sales, candy_products, candy_targets and candy_factories with a total row count of 13 993 records. This analysis does not include the candies sales to Canada.

## Figure 1: Entity Relationship Diagram
![ERD](candy_sales_ERD.png)

## Executive Summary
### Overview of Findings
From 2021 to 2024, the total sales increased steadily, with the highest revenue in 2024 of $45K. Key findings include:
•	Sales increased from $27 in 2021 to $45k in 2024.
•	Gross profit exhibited steady growth, reaching $30K in 2024
•	The number of sales grew consistently, peaking at 3210 in 2024, indicating expanded market reach. 


## Recommendation
•	Strengthen partnerships with high-performing factories like “Wicked Choccy’s and Lot’s O’ Nuts.
•	Explore growth potential for underperforming but unique candies such as Fun Dip, Nerds etc.
•	Monitor cost efficiency to sustain profitability as the sales increase.
•	Focus on sustaining the growth of chocolate products while exploring the opportunities to diversify sales across other categories. 
•	Evaluate the performance of underutilised factories and shipping modes for potential optimisation. 
•	Leverage seasonal trends by scaling inventory and promotions for peak sales season between September to December. 
•	Analyse underperforming periods between January to March for improvement opportunities.
•	Strengthen operation and marketing efforts in states like California, New York and Texas to maximise returns.


