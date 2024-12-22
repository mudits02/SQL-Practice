-- Assignment 5

select * from dept;
SELECT * FROM employee;
SELECT * FROM orders;
SELECT * FROM returns;
--Q1 

SELECT o.region , COUNT(distinct r.order_id)
FROM orders o
INNER JOIN returns r ON o.order_id = r.order_id
GROUP BY o.region;

--Q2

SELECT o.category , SUM(o.sales)
FROM orders o 
LEFT join returns r ON o.order_id = r.order_id
WHERE r.order_id IS NULL
GROUP BY o.category;

--Q3

SELECT d.dep_name , AVG(e.salary)
FROM employee e
INNER JOIN dept d ON e.dept_id = d.dep_id
GROUP BY d.dep_name

--Q4

SELECT d.dep_name 
FROM employee e
INNER JOIN dept d ON e.dept_id = d.dep_id
GROUP BY d.dep_name
HAVING COUNT(e.emp_id) = COUNT(DISTINCT e.salary)

--Q5

select o.sub_category
from orders o
inner join returns r on o.order_id=r.order_id
group by o.sub_category
having count(distinct r.return_reason)=3

--Q6

SELECT o.city 
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id
GROUP BY o.city
HAVING COUNT(r.order_id) = 0

--Q7

SELECT o.sub_category, SUM(o.sales) as return_sales
FROM orders o
INNER JOIN returns r ON o.order_id = r.order_id
WHERE o.region = 'East'
GROUP BY o.sub_category
ORDER BY return_sales DESC
LIMIT 3;

--Q8

SELECT d.dep_name
FROM employee e
RIGHT JOIN dept d ON e.dept_id = d.dep_id
GROUP BY d.dep_name
HAVING COUNT(e.emp_id) = 0

--Q9

SELECT e.*
FROM employee e
LEFT JOIN dept d ON e.dept_id = d.dep_id
WHERE d.dep_id IS NULL;





