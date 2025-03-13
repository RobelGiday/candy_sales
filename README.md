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
* Top Performers:
    * Lot's O' Nuts is the largest contributors, responsible for 53.85% of total sales.
    * The Wonka Bar - Triple Dazzel Caramel from Wicked Choccy's generated the highest revenue $27.25K, followed closely by Lot's O' Nuts Wonka Bar - Scrumdidlyumptious with $26.42k in sales.
* Under Performers:
    * Sugar Shack contribute is only responsible for 0.16% of the total sales which is $220.98 in sales.
    * Sugar Shack's Fun Dip is lowest selling candies only $12 in sales.
* Yearly Growth: From 2023 sales grew by an average of 27% per year, driven by increased demand for popular candies.
* Profitability: Gross profit reached $30K in 2024

### Factory Sales Insight for 2024
* Factory Performance
    * Year to year Lot's O' Nut's has always led total sales however in 2024 it generated $24k in sales, netting $16.5k profits with 1.79k sale transcations.
    *  Followed by Wicked Choccy's with $17K in sales, $11.4k in gross profits and 1.3k in sale transcations.
    *  In contrast, Secret Factory generated only $3k in sales while The Other Factory and Sugar Shack were non-contributors with less than $500 in sales and $50 in profits.
* Divisional Targets
     * The Chocolate division accounted for 91% of total sales and exceeded its target by 152%.
     * Similar Other achieved exceeded its target by 112% whereas the sugar division missed its target entirely.
* Shipping preferences
    * Standard class was the most utilised shipping method making up 60% of transactions, indicating its cost-effectiveness and customer preference.
 
### Candy Sales Insight for 2024


## Recommendations
*	Strengthen partnerships with high-performing factories like Lot’s O’ Nuts and Wicked Choccy’s to sustain their momentum and meet demand.
*	Explore growth potential for underperforming but unique candies such as Fun Dip, Nerds etc.
*	Monitor cost efficiency to sustain profitability as the sales increase.
*	Expand Divisional Performance 
    *	Focus on sustaining the growth of chocolate products while exploring the opportunities to diversify sales across other categories.
    *	Launch targeted campaigns for Sugar and Other divisions to diversify revenue streams and meet divisional goals.
* Enhance Logistics
    *	Focus on improving Standard Class shipping while reassessing the relevance and efficiency of Same Day shipping.
* Leverage Seasonal Trends
    * Strengthen marketing efforts in August to boost pre holiday sales.
    * Scale inventory for peak demand periods between September to December.
    * Analyse underperforming periods between January to March for improvement opportunities i.e. generate demandad for Valentine's Day and Easter.
*	Strengthen operation and marketing efforts in states like California, New York and Texas to maximise returns.


