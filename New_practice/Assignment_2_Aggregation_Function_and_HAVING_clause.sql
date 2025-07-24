-- Assignment 4 Aggregation Functions and HAVING clause

SELECT * FROM orders;

-- 1- write a update statement to update city as null for order ids :  'CA-2020-161389' , US-2021-156909
-- 2- write a query to find orders where city is null (2 rows)

-- 3- write a query to get total profit, first order date and latest order date for each category

-- 4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category

-- 5- create the exams table with below script;
-- create table exams (student_id int, subject varchar(20), marks int);

-- insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
-- ,(2,'Chemistry',80),(2,'Physics',90)
-- ,(3,'Chemistry',80),(3,'Maths',80)
-- ,(4,'Chemistry',71),(4,'Physics',54)
-- ,(5,'Chemistry',79);

-- write a query to find students who have got same marks in Physics and Chemistry.

-- 6- write a query to find total number of products in each category.

-- 7- write a query to find top 5 sub categories in west region by total quantity sold

-- 8- write a query to find total sales for each region and ship mode combination for orders in year 2020

-- Q1 

UPDATE orders
SET city = NULL
WHERE order_id IN ('CA-2020-161389', 'US-2021-156909');

-- Q2 

SELECT * FROM orders
WHERE city is null;

-- Q3 

SELECT SUM(profit) as total_Sales, 
MIN(order_date) as first_order,
MAX(order_date) as latest_order
FROM orders
GROUP BY category;

-- Q4

SELECT sub_category
FROM orders
GROUP BY sub_category
HAVING avg(profit) > max(profit) / 2;

-- Q5 
-- Very Very Important , COUNT(1) is a row-counting function — it counts how many rows are returned in the group or result set.
-- So if we do , SELECT COUNT(1) FROM orders; -> This gives 9994 (number of rowns in the orders table)

SELECT COUNT(1) FROM orders; -- 9994

SELECT * FROM exams;

SELECT student_id,marks 
FROM exams
WHERE subject IN ('Physics', 'Chemistry')
GROUP BY student_id, marks
having COUNT(1) = 2;

--Q6

SELECT category, COUNT(DISTINCT product_id)
FROM orders
GROUP BY category;

-- Q7

SELECT sub_category, SUM(quantity) as total_quan
FROM orders
WHERE region = 'West'
GROUP BY sub_category
ORDER BY SUM(quantity) DESC
LIMIT 5;

-- Q8

SELECT region, ship_mode, SUM(sales)
FROM orders
WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY region , ship_mode;

-- ================ Completed ===================

