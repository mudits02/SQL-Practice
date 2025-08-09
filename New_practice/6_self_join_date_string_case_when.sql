-- Self Join -> When u join a table within itself , then it is self join ( it is a technique and not a syntax )

SELECT * FROM employee;

SELECT * FROM dept;

-- Joining Employee table with itself to see the manager name of the employee

SELECT e1.emp_id , e1.emp_name, e1.manager_id, e2.emp_name as Manager_Name -- for the 3rd col ,we can also use e2.emp_id or e1.manager_id
FROM employee e1
INNER JOIN employee e2 ON e1.manager_id = e2.emp_id;

-- Print employee names , whos salary is more than manager's salary

SELECT e1.emp_name 
FROM employee e1
INNER JOIN employee e2 ON e1.manager_id = e2.emp_id
WHERE e1.salary > e2.salary;


-- String Aggregate function
-- 1. STRING_AGG -> Aggregates the string value in col , used exactly like Normal aggregation function but for strings

SELECT dept_id , STRING_AGG(emp_name, ',' ORDER BY salary DESC) -- first is the expression , then we have the delimiter , so tha first is like , separated values and also we can give an expression , in this we want the , separated to be ordered in terms of salary
FROM employee
GROUP BY dept_id;

-- 2. DATEPART -> DATEPART(YEAR/MONTH/DATE , col_name)

SELECT order_id, order_date, DATE_PART('MONTH', order_date)
FROM orders;

-- In postgres , we dont have function like DATEADD or DATENAME
-- For DATENAME , refer -> TO_CHAR , For DATEADD , directly use arthemetic operation , +, - , /
-- For DATEDIFF -> SELECT '2025-08-01'::date - '2025-07-20'::date AS days_difference;

-- CASE , WHEN, ELSE, END
-- CASE statements are always Top to Bottom , so 300 satisfies both condition 1 and 2 , so 300 goes for Medium Profit

SELECT order_id, profit,
CASE
	WHEN profit < 100 THEN 'Low Profit'
	WHEN profit < 250 THEN 'Medium Profit'
	WHEN profit < 400 THEN 'High Profit'
ELSE
	'Very High Profit'
END
FROM orders;

-- Group By used in CASE, WHEN , we kind of treat the CASE WHEN as a col.

SELECT 
    CASE
        WHEN profit < 100 THEN 'Low Profit'
        WHEN profit < 250 THEN 'Medium Profit'
        WHEN profit < 400 THEN 'High Profit'
        ELSE 'Very High Profit'
    END AS profit_category,
    COUNT(*) AS order_count
FROM orders
GROUP BY 
    CASE
        WHEN profit < 100 THEN 'Low Profit'
        WHEN profit < 250 THEN 'Medium Profit'
        WHEN profit < 400 THEN 'High Profit'
        ELSE 'Very High Profit'
    END;