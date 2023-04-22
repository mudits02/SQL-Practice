SELECT * FROM Orders
SELECT * FROM returns

SELECT * FROM employee
SELECT * FROM dept

SELECT region , count(distinct o.Order_ID) as no_of_return_reason
FROM Orders as o
INNER JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY o.region;

SELECT o.Category , COUNT(Sales) as total_sales
FROM Orders AS o
LEFT JOIN returns r on o.Order_ID = r.Order_ID
WHERE r.Order_ID IS NULL
GROUP BY o.Category

SELECT d.dept_name , AVG(e.Salary) as avg_salary
FROM dept as d
LEFT JOIN employee e on d.dept_id = e.dept_id
WHERE e.salary IS NOT NULL
GROUP BY d.dept_name;

SELECT d.dept_name
FROM dept as d
INNER JOIN employee e on d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) = COUNT(distinct e.salary)

SELECT e.emp_name
FROM employee AS e
FULL OUTER JOIN dept d on e.dept_id = d.dept_id
WHERE d.dept_name IS NULL

SELECT d.dept_name
FROM dept AS d
FULL OUTER JOIN employee e on d.dept_id = e.dept_id
WHERE emp_name IS NULL

