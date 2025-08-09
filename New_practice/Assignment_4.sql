-- Assignment_6

-- Run the following command to add and update dob column in employee table
-- ALTER TABLE employee ADD COLUMN dob DATE;
-- UPDATE employee
-- SET dob = CURRENT_DATE - (emp_age * INTERVAL '1 year');

SELECT * FROM orders;

SELECT * FROM returns;

SELECT * FROM employee;

SELECT * FROM dept;

SELECT EXTRACT(YEAR FROM AGE('2024-09-20', '2020-09-20')) AS year_difference;

-- 1- write a query to print emp name , their manager name and diffrence in their age (in days) 
-- for employees whose year of birth is before their managers year of birth
-- 2- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)
-- 3- orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
-- write a query to find order ids where there is only 1 product bought by the customer.
-- 4- write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him.
-- 5- write a query to get number of business days between order_date and ship_date (exclude weekends). 
-- Assume that all order date and ship date are on weekdays only
-- 6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)
-- 7- write a query to print below 3 columns
-- category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)
-- 8- write a query print top 5 cities in west region by average no of days between order date and ship date.
-- 9- write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)

-- Q1

SELECT e.emp_name, m.emp_name as manager_name, (SELECT EXTRACT (YEAR FROM AGE(e.dob , m.dob))) AS age_differnce
FROM employee e
INNER JOIN employee m on e.manager_id = m.emp_id
WHERE DATE_PART('YEAR', m.dob) < DATE_PART('YEAR', e.dob);

-- Q2

SELECT o.sub_category
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE DATE_PART('MONTH', order_date) = 11
GROUP BY sub_category
HAVING COUNT(r.order_id) = 0;

-- Q3

SELECT order_id
FROM orders
GROUP BY order_id
HAVING COUNT(1) = 1;

-- Q4

SELECT m.emp_name as Manager_name , STRING_AGG(e.emp_name , ',' ORDER BY e.salary DESC) -- If e. salary is not given, then we will have "Ambigious error" , where the SQL fails to decide from which table we have to take the salary
FROM employee e
INNER JOIN employee m ON e.manager_id = m.emp_id
GROUP BY m.emp_name;

-- Q5

SELECT order_id,
       order_date,
       ship_date,
       (ship_date - order_date) 
         - 2 * ((ship_date - order_date) / 7)  AS no_of_business_days
FROM orders;

-- Q6

SELECT o.category, SUM(o.sales), SUM(CASE WHEN r.order_id IS NOT NULL then sales END)
FROM Orders o
LEFT JOIN returns r ON o.order_id = r.order_id
GROUP BY o.category;

-- Q7

SELECT category,
SUM(
	CASE WHEN DATE_PART('YEAR', order_date) = 2019 THEN sales END
) as sales_in_2019,
SUM(
	CASE WHEN DATE_PART('YEAR', order_date) = 2020 THEN sales END
) as sales_in_2020
FROM orders
GROUP BY category;