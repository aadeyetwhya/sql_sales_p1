DROP IF EXISTS sales_project
CREATE TABLE sales_data 
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(10),
		age INT,
		category VARCHAR(60),
		quantiy INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT
	)

	SELECT * from sales_data

--CORRECTING COLUMN NAME QUANTIY TO QUANTITY
EXEC sp_rename 'sales_data.quantiy', 'quantity', 'COLUMN';
 


--DATA CLEANING-- checking the data for null


SELECT * FROM 
	sales_data
WHERE	
	transactionS_id IS NULL
	or
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	CUSTOMER_ID IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL

--deleting null
DELETE FROM sales_data
WHERE
	transactionS_id IS NULL
	or
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	CUSTOMER_ID IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL

--DATA EXPLORATION

--How many sales we have?
SELECT 
	Count(*) as Total_sales
FROM 
	sales_data 

--how many customers we have?
SELECT 
	Count(DISTINCT CUSTOMER_id) as total_customers
FROM 
	sales_data

--HOW MANY CATEGORIES WE HAVE?
SELECT 
	COUNT(DISTINCT category) as total_category
FROM 
	sales_data
	

--DATA ANALYSIS AND BUSINESS PROBLEMS

-- 1. list of sales made on '2022-11-05'
SELECT * FROM 
	sales_data
WHERE 
	sale_date='2022-11-05'


--2. retrieve all transaction where teh category is clothing and the wuantity is more than 3 in the month of nov-2022
SELECT * 
FROM 
	sales_data 
WHERE 
	LOWER(category)='clothing'
	AND
	YEAR(sale_date)=2022 
	AND MONTH(sale_date)=11 
	AND quantity>=3;


--3. CALCULATE TOTAL Sales of each category
SELECT 
	category 
	SUM(total_sale) as Total_sales,
FROM 
	sales_data 
GROUP BY 
	category 


-- 4. what is the average age of customers who purchased items from the 'BEAUTY'category
SELECT 
	category,
	(AVG(age) AS Average_age
FROM 
	sales_data
WHERE 
	LOWER(category) = 'beauty'
GROUP BY 
	category;


--5. transactions having total sales more than 1000.
SELECT 
	* 
FROM
	sales_data 
WHERE 
	total_sale>1000


--6 total number of transaction made by each gender in each category

select 
	COUNT(*),
	category,
	gender 
FROM sales_data 
GROUP BY 
	category,
	gender 
ORDER BY 
	category ASC


--7. find the top 5 customers based on the highest total sales
SELECT TOP 5 SUM(total_sale) as Total_sale,customer_id FROM sales_data GROUP BY customer_id ORDER BY Total_sale DESC


--8 FIND NUMBER of UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY
SELECT 
	category,
	count(DISTINCT customer_id) TOTAL_CUSTOMER 
FROM 
	sales_data  
group by 
	category


--9. create shift based on the time morning afternoon and evening 


SELECT *,
    CASE
        WHEN DATEPART(hour, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(hour, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shifts
FROM sales_data

--END OF PROJECT


