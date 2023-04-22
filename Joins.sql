-- DATABASE JOINS

SELECT o.Order_ID ,o.product_ID, o.order_date , r.return_reason
FROM Orders AS o
INNER JOIN returns AS r on o.Order_ID = r.order_id;

--IT IS BETTER TO USE ALIAS WHILE DOING JOINS BECAUSE DATABASE GETS CONFUSED THAT WHICH DB'S PRIMARY WE ARE USING


--LEFT JOIN

SELECT o.Order_ID ,o.product_ID, o.order_date , r.return_reason
FROM Orders AS o
LEFT JOIN returns AS r on o.Order_ID = r.order_id
WHERE r.return_reason is NULL;

SELECT r.return_reason , SUM(sales) as total_sum
From Orders AS o
LEFT JOIN returns as r on o.Order_ID = r.order_id
GROUP BY r.return_reason;

-- CASE OR IF ELSE IN MS SQL

SELECT order_ID , profit ,
CASE
WHEN profit BETWEEN 0 AND 100 THEN 'Low Profit'
WHEN profit BETWEEN 101 AND 250  THEN 'Mid Profit'
WHEN profit > 250 THEN 'High Profit'
ELSE 'Loss making'
END AS Profit_category
FROM Orders



SELECT o.order_id , o.Order_Date ,  r.order_id , r.return_reason
FROM Orders AS o
INNER JOIN returns AS r ON o.Order_ID = r.Order_ID;

SELECT o.Order_ID , o.order_date , r.order_id , r.return_reason
FROM Orders AS o
LEFT JOIN  returns r ON o.Order_ID = r.Order_ID
WHERE r.Order_ID IS NOT NULL -- SAME RESULT AS INNER JOIN(ONLY IN THIS CASE)

SELECT COUNT(o.order_id) -- , o.order_date , r.order_id , r.return_reason
FROM Orders AS o
RIGHT JOIN  returns r ON o.Order_ID = r.Order_ID

SELECT COUNT(o.order_id) --, o.order_date , r.order_id , r.return_reason
FROM Orders AS o
FULL OUTER JOIN  returns r ON o.Order_ID = r.Order_ID


SELECT * FROM Orders

SELECT r.return_reason , SUM(Sales) as total_sales , MAX(Sales) as Top_Sale
FROM Orders AS o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY r.return_reason;


CREATE TABLE employee(
emp_id INT,
emp_name VARCHAR(100),
dept_id INT,
salary INT,
manager_id INT,
emp_age INT
);

INSERT INTO employee VALUES(1 , 'Ankit' , 100 , 10000 , 4 , 39);
INSERT INTO employee VALUES(2 , 'Mohit' , 100 , 15000 , 5 , 48);
INSERT INTO employee VALUES(3 , 'Vikas' , 100 , 10000 , 4 , 37);
INSERT INTO employee VALUES(4 , 'Rohit' , 100 , 5000 , 2 , 16);
INSERT INTO employee VALUES(5 , 'Mudit' , 200 , 12000 , 6 , 55);
INSERT INTO employee VALUES(6 , 'Agam' , 200 , 12000 , 2 , 14);
INSERT INTO employee VALUES(7 , 'Sanjay' , 200 , 9000 , 2 , 13);
INSERT INTO employee VALUES(8 , 'Ashish' , 200 , 5000 , 2 ,12);
INSERT INTO employee VALUES(9 , 'Mukesh' , 300 , 6000 , 6 , 51);
INSERT INTO employee VALUES(10 , 'Rakesh' , 500 , 7000 , 6 , 50);

CREATE TABLE dept(
dep_id INT,
dept_name VARCHAR(110)
);

--ALTER TABLE dept RENAME COLUMN oldcolumn_name to newcolumn_name;

INSERT INTO dept VALUES(1 , 'Analytics')
INSERT INTO dept VALUES(2 , 'IT')
INSERT INTO dept VALUES(3 , 'HR')
INSERT INTO dept VALUES(4 , 'tax Analyst')

SELECT * FROM employee;
SELECT * FROM dept;

UPDATE dept
SET dept_id = 100
WHERE dept_id = 1;

UPDATE dept
SET dept_id = 200
WHERE dept_id = 2;

UPDATE dept
SET dept_id = 300
WHERE dept_id = 3;

UPDATE dept
SET dept_id = 400
WHERE dept_id = 4;



SELECT e.emp_id , e.emp_name , e.dept_id , d.dept_name
FROM employee AS e
INNER JOIN dept d ON e.dept_id = d.dept_id;


SELECT *
FROM employee AS e
INNER JOIN dept d ON e.dept_id = d.dept_id;

SELECT *
FROM employee AS e
LEFT JOIN dept d ON e.dept_id = d.dept_id;

SELECT *
FROM employee AS e
RIGHT JOIN dept d ON e.dept_id = d.dept_id;

SELECT *
FROM employee AS e
FULL OUTER JOIN dept d ON e.dept_id = d.dept_id;


