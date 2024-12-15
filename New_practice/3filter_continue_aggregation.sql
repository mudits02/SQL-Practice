-- Filters, Continue and Aggregation

SELECT * FROM orders

-- Handling Null values in SQL
-- In SQL , null is considered like a value which is unknown or is an uncertain value(it is not blank)
-- So, we use 'is null' or 'is not null' for comparing for null values

SELECT * FROM orders
WHERE city is not null;

-- Aggregation functions -> In SQL they are used to perform calculations on a set of rows and return a single summary value. 
SELECT count(*) as total_count, SUM(sales) as total_sale, max(sales) as max_sales, min(profit) as min_profit,avg (cast(profit as FLOAT)) as avg_profit
FROM orders

--GROUP BY

SELECT region, ship_mode, -- If we are taking a value in SELECT statement, then we have to mention it in group by also
count(*) as total_count, 
SUM(sales) as total_sale, 
max(sales) as max_sales, 
min(profit) as min_profit,
avg (cast(profit as FLOAT)) as avg_profit
FROM orders
GROUP BY region, ship_mode;

SELECT region, SUM(sales) as total_sales
FROM orders
WHERE cast(profit as FLOAT) > 50.
GROUP BY region

-- Order of statements in SQL
SELECT region , SUM(sales) as total_sales
FROM orders
WHERE cast(profit as FLOAT) > 50.
GROUP BY region
ORDER BY total_sales DESC

-- HAVING keyword -> this is used as the WHERE clause or conditional on aggregated functions
-- Example find the sun categories where the aggregated sales is greater than 100000 and individual profit > 50
-- In this order, it seems that SELECT is running first but its not the case, first the HAVING works and then the SELECT works
-- This can be seen when 
SELECT sub_category, SUM(sales) as total_sales
FROM orders
WHERE cast(profit as FLOAT) > 50. 
GROUP BY sub_category
HAVING SUM(sales) > 100000
ORDER BY total_sales DESC --Order By can use Aggregated temp aliases

-- So basically how we think in HAVING clause is that first we GROUP BY the data as per the rows and then we apply thr HAVING
-- clause on it , first GROUP BY and then HAVING condition is seen


-- COUNT function
-- COUNT doesnt count NULL values
-- Same with AVG function
-- 'east' , 100
-- 'east' , null
-- 'east' , 200
-- Answer for group by will be -> 'east', 150 and not 'east' , 100 because it doesnt consider null values
--Basically any AGGREGATE function will ignore null values(unless mentioned explicitly)

SELECT COUNT(distinct region),
COUNT(*),
COUNT(1),
COUNT(distinct city)
FROM orders




