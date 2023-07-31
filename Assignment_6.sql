ALTER TABLE employee add dob date;

UPDATE employee set dob = dateadd(year , -1*emp_age ,getdate());

--Assignment_06
--Q1

SELECT e1.emp_name , e2.emp_name as manager_name , DATEDIFF(day , e1.dob , e2.dob) as age_difference
FROM employee e1
INNER JOIN employee e2 on e1.emp_id = e2.emp_id
WHERE DATEPART(year , e1.dob) > DATEPART(year , e2.dob);

--Q2

SELECT Sub_Category
FROM Orders o
LEFT JOIN returns r on o.Order_ID = r.Order_ID
WHERE DATEPART(month , o.Order_Date) = 11
GROUP BY Sub_Category
HAVING COUNT(r.Order_ID) = 0;

--Q3

SELECT order_id
FROM Orders
GROUP BY order_id
HAVING COUNT(1) = 1;

--Q4

SELECT e2.emp_name as manager_name , STRING_AGG(e1.emp_name , ',') as emp_list
FROM employee e1
INNER JOIN employee e2 on e2.emp_id = e1.manager_id
GROUP BY e2.emp_name;

--Q5

SELECT order_date , ship_date , DATEDIFF(day , order_date , ship_date) - 2 * DATEDIFF(week , order_date , ship_date) as date_differece
FROM Orders;


--Q6

SELECT category , SUM(sales) , 
FROM Orders o
LEFT JOIN returns r ON o.order_id = r.Order_ID



