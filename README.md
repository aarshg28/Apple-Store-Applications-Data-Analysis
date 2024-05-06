# Apple-Store-Applications-Data-Analysis

## Project Overview
This project aims to provide insights into the Apple Store's app ecosystem by analyzing a dataset that includes details about various apps available on the platform. Key questions addressed include identifying the most popular app categories, determining the ideal pricing for apps, and strategies for maximizing user ratings.

## Table of Contents
- [Introduction](#introduction)
- [Dataset](#dataset)
- [Technologies Used](#technologies-used)
- [Analysis and Insights](#analysis-and-insights)
- [Usage](#usage)

## Introduction
The objective of this project is to extract actionable insights from the Apple Store app data to help stakeholders make informed decisions. The analysis covers various aspects such as popularity of app categories, app pricing strategies, and factors influencing user ratings.

## Dataset
The dataset used in this project is sourced from the Apple Store and includes the following two key tables:
- AppleStore
- applestore_description_combined 

*Please note that the data is used for educational purposes and may have limitations regarding its completeness and accuracy.*

## Technologies Used
- SQL Lite
- MS SQL Server

## Analysis and Insights
The analysis consists of several steps including data cleaning, exploratory data analysis (EDA), and specific analysis answering the stakeholder questions. The main insights derived from the project are:

1. **Most Popular App Categories:** Identification of categories with the highest number of downloads and active users.
2. **Pricing Strategies:** Analysis on how app pricing correlates with popularity and revenue generation.
3. **Maximizing User Ratings:** Factors that influence user ratings and recommendations to improve them.

 **Exploratory Data Analysis (EDA):** 
1. **Checking the Unique Apps in both the Tables** 
2. **Checking for any missing values in main key fields**
3. **Finding the number of apps per genre**
4. **Find the overview of the apps ratings**

 **Data Analysis:** 
 1. **Understaning whether paid apps have higher rating than free apps:** CASE Statement
 2. **Check if apps supporting more languages have higher ratings:** CASE Statement
 3. **Check genre with low ratings:** CASE Statement
 4. **Check if there is a correlation between the length of the app desc and user ratings:** CASE Statement
 5. **Check the top-rated apps for each genre:** WINDOW Function

## Insights useful for the Stakeholders

1. Paid Apps have better ratings than Free Apps due to various reasons
2. Apps that support more languagues i.e between 10-30 languages have better ratings
3. Finance and Books applications have the lowest ratings; can be improved for better ratigs
4. Applications that have longer descriptions have better ratings than others
5. If a new app is getting launched on the app store, aiming the app to get ratings above 3.5
6. Games and Entertainment applications have more competition on the app store

## Usage

1. Download the CSV File (Dataset taken from Kaggle)
2. Combine all the 4 description files into one table using UNION ALL
3. Perform EDA using SQL Queries - Basic SQL, Aggregate Functions
4. Perform Data Analysis using SQL Queries - CASE Statements and WINDOW Functions
