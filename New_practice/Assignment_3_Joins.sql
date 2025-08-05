-- Assignment_5_Joins

SELECT * FROM orders;

SELECT * FROM returns;

SELECT * FROM employee;

SELECT * FROM dept;
-- 100	"Analytics"
-- 200	"IT"
-- 300	"HR"
-- 400	"Text Analytics"

-- 1- write a query to get region wise count of return orders
-- 2- write a query to get category wise sales of orders that were not returned
-- 3- write a query to print dep name and average salary of employees in that dep .
-- 4- write a query to print dep names where none of the emplyees have same salary.
-- 5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
-- 6- write a query to find cities where not even a single order was returned.
-- 7- write a query to find top 3 subcategories by sales of returned orders in east region
-- 8- write a query to print dep name for which there is no employee
-- 9- write a query to print employees name for dep id is not avaiable in dept table

-- Q1

SELECT o.region , COUNT(DISTINCT r.order_id)
FROM orders o
INNER JOIN returns r ON o.order_id = r.order_id
GROUP BY o.region;

-- Q2

SELECT o.category , SUM(o.sales)
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.order_id IS NULL
GROUP BY o.category;

--Q3

SELECT d.dep_name, AVG(e.salary)
FROM employee e
RIGHT JOIN dept d ON e.dept_id = d.dep_id --ALthough in the solution it is given INNER JOIN , I find this as a better solution to the question
GROUP BY d.dep_name;

-- Q4

SELECT d.dep_name
FROM employee e
INNER JOIN dept d ON e.dept_id = d.dep_id
GROUP BY d.dep_name
HAVING COUNT(e.emp_id) = COUNT(DISTINCT e.salary);

-- Q5

SELECT o.sub_category
FROM orders o
INNER JOIN returns r ON o.order_id = r.order_id
WHERE r.return_reason IN ('Bad Quality', 'Wrong Items', 'Others')
GROUP BY o.sub_category; -- My answer (wrong)

select o.sub_category
from orders o
inner join returns r on o.order_id=r.order_id
group by o.sub_category
having count(distinct r.return_reason)=3 -- Correct answer

-- Q6

SELECT o.city
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.return_reason IS NULL
GROUP BY o.city -- My answer (Wrong)

SELECT o.city
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id
GROUP BY o.city
HAVING COUNT(r.order_id) = 0; -- Correct Answer