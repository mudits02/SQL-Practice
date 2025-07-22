-- SQL Filters (Advanced) and Aggregation Functions

SELECT * FROM orders;
-- =============== Prerequisite =====================
ALTER TABLE orders
ALTER COLUMN city DROP NOT NULL;

UPDATE orders
SET city = null
where order_id IN ('CA-2020-161389', 'US-2021-156909');

-- =============== Prerequisite =====================

-- How to find a NULL value
SELECT * FROM orders
WHERE city IS NULL; -- we cant do = because SQL doesnt know what is NULL

-- How to find which are not null
SELECT * FROM orders
WHERE city is NOT NULL;

-- Null is even not comparable to NULL , so we cannot even do , HWERE NULL = NULL

-- Aggregation
-- COUNT ->. counts the number of records in the table
SELECT COUNT(*)
from orders;

-- SUM -> Gives the sum of the numeri value columns

SELECT SUM(sales),
max(sales) as max_sales, --ALiases
min(sales),
avg(sales)
FROM orders;


-- GROUP BY -> Grouping the data on a specific conditon

SELECT region, 
SUM(sales) as sum_sales,
max(sales) as max_sales,
min(sales) as min_sales,
avg(sales) as avg_sales
FROM orders
GROUP BY region;

-- writing distinct using group by

SELECT region
FROM orders
GROUP BY region;

-- While doing GROUP BY, we have to mention a column in the select statement , if we are doing a order by of it or it should be an aggregated function

-- ANother query , using where clause

SELECT region, SUM(sales) as total_sale 
FROM orders
WHERE profit > 50
GROUP BY region
ORDER BY total_sale DESC
LIMIT 2;

-- HAVING keyword
-- So when the SQL query is running , then we will have WHERE clause running first before the aggregation function is run
-- So we cannot directly use filter WHERE on aggregated functions
-- For that we use HAVING keyword

SELECT sub_category, SUM(sales) AS total_sales
FROM orders
WHERE profit > 50
GROUP BY sub_category
HAVING SUM(sales) > 10000 -- total_sales > 10000 wont work as it is generated after compariosn
ORDER BY total_sales DESC;

