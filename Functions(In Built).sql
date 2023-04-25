--String aggregation
SELECT dept_id , STRING_AGG(emp_name , ',' ) WITHIN GROUP(ORDER BY salary) as list_of_employee
FROM employee
GROUP BY dept_id;

--WITIHIN GROUP.. means we are sorting it in the form of salary

SELECT * FROM Orders

--DATE FUNCTIONS

SELECT order_id , order_date , 
DATEPART(YEAR , order_date) as year_of_date,
DATEPART(MONTH , order_date) as month_of_the_date,
DATEPART(DAY , Order_Date) as day_of_the_date,
DATEPART(WEEK , Order_Date) as week_of_the_date
FROM Orders
WHERE DATEPART(YEAR , order_date) = 2020

--DATENAME function , for year , week and day it return in the form of string

SELECT order_id , order_date , 
DATENAME(YEAR , order_date) as year_of_date,
DATENAME(MONTH , order_date) as month_of_the_date,
DATENAME(DAY , Order_Date) as day_of_the_date,
DATENAME(WEEK , Order_Date) as week_of_the_date
FROM Orders
WHERE DATENAME(YEAR , order_date) = 2020

-- DATEADD function -> adding date , day , week to the given date and getting the resultant date

SELECT order_id , order_Date,
DATEADD(DAY , 5 , order_date) as day_add_5,
DATEADD(WEEK , 5 , order_date) as week_add_5,
DATEADD(MONTH , 5 , order_date) as month_add_5,
DATEADD(YEAR , 5 , order_date) as year_add_5
FROM Orders

--DATEDIFF -> subtracts dates
--Example that how many days it took for the product to reach the destination

SELECT order_id , order_date , ship_date,
DATEDIFF(DAY , order_date , ship_date) as days_to_deliver
FROM Orders