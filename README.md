#  Retail Sales Analysis — SQL Project

##  Project Overview

This beginner-level SQL project focuses on analyzing retail transaction data using fundamental SQL techniques. The project walks through database setup, data cleaning, exploratory analysis, and business problem-solving — all done using structured SQL queries. It’s a great starting point for aspiring data analysts looking to build confidence with SQL in a real-world context.

---

##  Objectives

1. **Database Setup** – Create a clean retail sales table from scratch.
2. **Data Cleaning** – Remove incomplete or null entries.
3. **Exploratory Data Analysis (EDA)** – Understand sales distribution and customer metrics.
4. **Business Analysis** – Solve targeted business questions using SQL.

---

##  Project Structure

###  1. Database Setup

- Created a database: `p1_retail_db`
- Created a table: `retail_sales`  
  Includes columns for transaction ID, date/time, customer demographics, product category, quantity, pricing, and sales metrics.

###  2. Data Cleaning

- Checked for and removed null/missing values across key columns.
- Fixed column name typos (e.g., `quantiy` → `quantity`).

###  3. Data Exploration

Performed basic EDA tasks:

- Total number of sales records
- Count of unique customers
- Number of product categories

###  4. Business Queries & Analysis

SQL queries were written to answer:

- Sales on a specific date
- High-quantity purchases in November 2022
- Total and average sales by category
- Average customer age for Beauty category
- High-value transactions (total sales > 1000)
- Transaction count by gender and category
- Top 5 highest-spending customers
- Unique customer count by category
- Sales by time-of-day shift (Morning, Afternoon, Evening)

---

## 📊 Key Business Questions Solved

-  What were the sales on a specific date (`2022-11-05`)?
-  How many large Clothing category transactions occurred in November 2022?
-  Which categories generate the highest total sales?
-  What’s the average age of customers purchasing Beauty products?
-  Which transactions exceeded 1000 in total value?
-  How does transaction volume vary across genders and product categories?
-  Who are the top 5 customers based on lifetime spending?
-  How many unique customers shop by category?
-  Which shifts (Morning/Afternoon/Evening) see the most activity?
-  Which months perform best in terms of average sales?

---

##  Example Analysis Snippet – Shift Classification

```sql
SELECT *,
  CASE
    WHEN DATEPART(hour, sale_time) < 12 THEN 'Morning'
    WHEN DATEPART(hour, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift
FROM sales_data;
```

##  Author – Aditya Kafle

This project is part of my data portfolio. I'm passionate about solving real-world problems using SQL and analytics.  
Feel free to connect, collaborate, or share feedback!

-  **LinkedIn**: (https://www.linkedin.com/in/najirr)  

---

## 🛠 Tools Used

- **SQL Server / T-SQL**
- **SQL Server Management Studio (SSMS)**
- **Markdown** for documentation and reporting
- **Git & GitHub** for version control and collaboration

---




