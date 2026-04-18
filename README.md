E-Commerce Product Analytics Dashboard
### Project Overview

This project demonstrates an end-to-end data analytics pipeline by extracting bulk product data from an API, transforming and cleaning it using Python, storing it in SQL Server, and visualizing insights using Power BI.

The goal of this project is to analyze product data, uncover business insights, and build an interactive dashboard for decision-making.

## Problem Statement
E-commerce platforms generate large amounts of product data, but raw data alone does not provide meaningful insights.
This project focuses on transforming raw API data into structured, analyzable information and deriving insights such as pricing trends, product performance, and category distribution.

## Project Workflow
# Data Extraction
  ->Extracted product data from an API using Python
  ->Converted JSON data into a structured format (Pandas DataFrame)
# Data Cleaning & Transformation
  ->Handled nested JSON fields (ratings)
  ->Standardized column names (camelCase)
  ->Cleaned text data
  ->Rounded price values
  ->Created new features:
  ->priceCategory
  ->popularityScore
  ->titleLength
# Data Storage (SQL Server)
  ->Designed relational table schema
  ->Inserted cleaned data into SQL Server using Python (pyodbc)
  ->Ensured data consistency and handled real-world errors
# Data Analysis (SQL)
  ->Performed aggregations and grouping
  ->Used window functions (RANK, ROW_NUMBER, NTILE)
  ->Identified:
    ->Top-performing products
    ->Category-wise trends
    ->High-price low-rating products
    ->Market share and contribution
# Data Visualization (Power BI)
  ->Built interactive dashboard
  ->Added slicers for dynamic filtering
  ->Implemented KPIs and Top N analysis
  ->Created charts for:
   ->Category distribution
   ->Price analysis
   ->Product performance
# Dashboard Features
  ->Category-wise product distribution
  ->Average price & rating analysis
  ->Top performing products
  ->Price segmentation (Low / Medium / High)
  ->Interactive slicers for filtering
  ->Dynamic Top N filtering
# Tech Stack
  ->Python (Pandas, Requests)
  ->SQL Server (SSMS)
  ->Power BI
  ->REST API
  
## Project Structure
# E-Commerce-Analytics
│── data/
│── notebooks/
│── sql/
│── dashboard/
│── Business Development Document/
│── README.md

## Key Insights
  ->Certain categories dominate product distribution
  ->Mid-range priced products form the majority
  ->Some high-priced products have lower ratings (low value perception)
  ->Popularity score helps identify high-performing products
  
## Challenges Faced
  ->Handling nested JSON data from API
  ->Data type mismatches between Python and SQL Server
  ->Column size limitations (string truncation errors)
  ->Schema alignment between DataFrame and SQL table
  
## Conclusion
This project showcases the complete data analytics lifecycle — from data extraction to visualization. It highlights the importance of data cleaning, structured storage, and analytical thinking in deriving meaningful insights from raw data.
