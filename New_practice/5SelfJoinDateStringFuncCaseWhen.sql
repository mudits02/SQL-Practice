-- Self Join , Date and String function, Case/When statement

SELECT * FROM orders;
SELECT * FROM returns;
SELECT * FROM employee;
SELECT * FROM dept;

-- Self Join

SELECT e1.emp_id, e1.emp_name, e2.emp_name as manager_name  FROM
employee e1
INNER JOIN employee e2 ON e1.manager_id = e2.emp_id

-- Print those employee whose salary is greater than their managers salary

SELECT e1.emp_id, e1.emp_name as manager_name  FROM
employee e1
INNER JOIN employee e2 ON e1.manager_id = e2.emp_id
WHERE e1.salary >= e2.salary

-- String Functions in SQL

SELECT dept_id , AVG(salary) as avg_salary
FROM employee
group by dept_id;

-- Now in above we are aggregating the dept_id with avg salary basis using the AVG function
-- Now if we want to print employee names to be printed




