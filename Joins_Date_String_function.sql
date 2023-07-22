-- One table has 5 records and another has 0 recors , find the max and min number of records when tables are joned using 
-- left , right and full outer j

SELECT e.dept_id , d.dept_name FROM
employee e
LEFT JOIN dept d on e.dept_id = d.dept_id
GROUP BY e.dept_id , d.dept_name
HAVING COUNT(DISTINCT Salary) = COUNT(1);

--SELF JOIN , Its not a specifc join but can be said a type of setting while joining table with itself

SELECT e1.emp_id , e1.emp_name as Employee_Name , e2.emp_name as Manager_Name
FROM employee e1
INNER JOIN employee e2 on e1.manager_id = e2.emp_id
WHERE e1.salary > e2.salary;

-- String Aggregate functiob
-- For example in the employee table we want -> 1 , emp_name1 , emp_name2
--for that we use -> STRING_AGG(column_nme)

SELECT dept_id , STRING_AGG(emp_name  , ',')
FROM employee
GROUP BY dept_id;

--Sort the group of string_agg alphabetically(descending order)

SELECT dept_id  , STRING_AGG(emp_name , ',') WITHIN GROUP(ORDER BY emp_name DESC) as list_of_employees
FROM employee
GROUP BY dept_id;

SELECT dept_id  , STRING_AGG(emp_name , ',') WITHIN GROUP(ORDER BY salary DESC) as list_of_employees
FROM employee
GROUP BY dept_id;

--Date function
--1. DatePart -> extracts year or month or whatever date u want to extract
--2. DATENAME -> returns the name of the date part if it exists otherwise same result as datepart

SELECT order_id , order_date , 
DATEPART(year , order_date) as Year_of_order_Date,
DATEPART(MONTH , order_date) as month_of_order_Date,
DATEPART(WEEK , order_date) as week_of_order_date,
DATENAME(MONTH , Order_date) as name_of_month,
DATENAME(DAY , Order_date) as day_of_month,--  if its nmeric , it returns the same result as that of DATEPART
DATENAME(WEEKDAY , Order_date) as weekday_of_date
FROM Orders
WHERE DATEPART(year , order_date) = 2020;

--3. DATEADD -> adds the amount of the date in whichevr format u require
--4 DATEDIFF -> Subtratcs 2 dates from each other

SELECT order_id , order_date,
DATEADD(DAY , 5 , order_date) as order_date_day_5,
DATEADD(WEEK , 5 , order_date) as order_date_week_5,
DATEDIFF(DAY, order_date , Ship_Date) as Difference_of_dates
FROM Orders;

-- if else in SQL

SELECT order_id , profit,
CASE
WHEN profit < 100 THEN 'Low Profits'
WHEN profit < 250 THEN 'Medium Profits'
WHEN profit < 400 THEN 'High Profits'
ELSE 'Very High Profits'
END as profit_category
FROM Orders;













