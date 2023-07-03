-- Filtering NULL values

SELECT * FROM Orders
WHERE City IS NULL;

SELECT * FROM Orders
WHERE City IS NOT NULL;

--Aggregation Functions

--COUNT

SELECT COUNT(*)
FROM Orders;

--All aggregation functons used

SELECT COUNT(Order_Id) AS Cnt,
SUM(Sales) AS Total_Sales,
MAX(Sales) AS max_Sales,
MIN(Sales) AS min_sales,
AVG(Sales) AS mean_Sales
FROM Orders;

--GROUP BY -> this basically groups data on the basis of the columns which we are defining

SELECT region,
COUNT(Order_Id) AS Cnt,
SUM(Sales) AS Total_Sales,
MAX(Sales) AS max_Sales,
MIN(Sales) AS min_sales,
AVG(Sales) AS mean_Sales
FROM Orders
GROUP BY region;

--group by without agg function

SELECT Region , sales , Customer_name
FROM Orders
GROUP BY Region , sales , Customer_Name; -- wehn using GROUP BY we have inlcude all the columns which we are delcaring in the select clause

--In order by , aggegate function should not be included in the GROUP BY clause , but if there is a column in select statement

--Filtering wiht group by

SELECT region , SUM(Sales) as Total_Sales
FROM Orders
WHERE Profit > 50 -- Grouping only those sales where profit of that transaction is greater than 50
GROUP BY region;

--Sequence of writing the SQL query is following

-- Reason for this logical flow is following

--The logical flow of these clauses ensures that you retrieve the desired columns, filter the data based on specific conditions, perform calculations on grouped data, and finally, present the result set in a sorted order.

SELECT region , SUM(Sales) as Total_Sales
FROM Orders
WHERE Profit > 50
GROUP BY Region
ORDER BY Total_Sales DESC;

-- HAVING Keyword -> Used for Aggregate function

SELECT sub_category , sum(Sales) as total_sales
FROM Orders
GROUP BY Sub_Category
HAVING SUM(Sales) > 100000 --HAVING works before SELECT because if we replace the SUM Agg func here with total_sales ,  it will give an error
ORDER BY total_sales DESC;

--HAVING Works similar to WHERE

--WHERE is more efficient than HAVING becuse WHERE first filters and then executes the Query while in HAVING its vice verse. So WHERE is beter than HAVING

SELECT sub_category , sum(Sales) as total_sales
FROM Orders
GROUP BY Sub_Category --GROUP is executed before HAVING
HAVING Sub_Category = 'Phones' --Only condition that the column should be delared in the SELECT
ORDER BY total_sales DESC;

--Major difference beteen HAVING and WHERE is that for example we have to group sub categories and the AGG func is sum , 
--Then WHERE first filters the data whereas HAVING first let it create the sum and then Filters the data

--Any Aggregate function alwats ignores the NULL values







