-- Database Setup


CREATE TABLE retail_sales(
			transactions_id int PRIMARY KEY,
			sale_date DATE,
			sale_time TIME,
			customer_id	INT,
			gender	VARCHAR(10),
			age INT,
			category VARCHAR(30),	
			quantiy	INT,
			price_per_unit FLOAT,
			cogs	FLOAT,
			total_sale FLOAT
)

-- Data Exploration & Cleaning

DELETE FROM retail_sales
		WHERE 
		 transactions_id IS NULL
		OR
		 sale_date IS NULL
		OR
		 sale_time IS NULL
		OR
		 customer_id IS NULL
		OR
		 gender IS NULL
		OR
		 age IS NULL
		OR
		 category IS NULL
		OR
		 quantiy IS NULL
		OR
		 price_per_unit IS NULL
		OR
		 cogs IS NULL
		OR
		 total_sale IS NULL

-- Data Analysis & Findings

SELECT * FROM retail_sales

SELECT MAX(LENGTH(category))
from retail_sales

SELECT COUNT(DISTINCT customer_id) FROM retail_sales

SELECT DISTINCT CATEGORY FROM RETAIL_SALES

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT * FROM RETAIL_SALES
WHERE SALE_DATE = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT * FROM RETAIL_SALES
WHERE CATEGORY = 'Clothing' AND QUANTIY>=4 AND SALE_DATE BETWEEN '2022-11-01' AND '2022-11-30'

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT CATEGORY, SUM(TOTAL_SALE) AS CAT_WISE_TOTAL_SALE
FROM RETAIL_SALES
GROUP BY CATEGORY

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT ROUND(AVG(AGE),2) AS AVG_AGE
FROM RETAIL_SALES
WHERE CATEGORY='Beauty'


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM RETAIL_SALES
WHERE TOTAL_SALE>1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT gender, category, COUNT(transactions_id)
FROM RETAIL_SALES
GROUP BY gender, category

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

SELECT year,
		month,
		avg_sale
FROM(
SELECT EXTRACT(YEAR FROM SALE_DATE) AS year,
		EXTRACT(MONTH FROM SALE_DATE) AS month,
		AVG(TOTAL_SALE) AS avg_sale,
		RANK() OVER (PARTITION BY EXTRACT(YEAR FROM SALE_DATE) ORDER BY AVG(TOTAL_SALE) DESC) AS rnk
FROM RETAIL_SALES
GROUP BY year, month
) AS T1
WHERE rnk=1


-- Q8. Write a SQL query to find the top 5 customers based on the highest total sales. 

SELECT customer_id, SUM(Total_sale) AS ts from retail_sales
GROUP BY customer_id
ORDER BY ts DESC
LIMIT 5


-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT category, COUNT(DISTINCT CUSTOMER_ID) AS NO_0F_CX
FROM RETAIL_SALES
GROUP BY category


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sales AS(
SELECT *,
CASE
	WHEN EXTRACT(HOUR FROM SALE_TIME)<12 THEN 'Morning'
	WHEN EXTRACT(HOUR FROM SALE_TIME) BETWEEN 12 AND 17 THEN 'Afternoon'
	ELSE 'Evening' END AS shifts
FROM RETAIL_SALES
)
SELECT shifts, COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shifts

-- End of Project1



