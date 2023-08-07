--Sub Query
--So Sub Queries are basically when we make an intermediate table , so basically we are liasing a table to extract an intermediate result
-- For example ,  if we want to get average order value , it will not be directly AVG(Sales) but a grouping of all the orders
--And then averaging it
--Folllowing is the query or sub query of this

SELECT AVG(order_sales)FROM
(SELECT order_id , SUM(Sales) as order_sales
FROM Orders
GROUP BY order_id) as Order_Aggregator;

--So basically what we did is we made an intermediate table of grouping the sum of sales in the terms og order_sales
--we just take the average of the grouped order_id sales.

--finding the order IDs whos sales is greater than that of the average order_id value

SELECT Order_ID 
FROM Orders
GROUP BY Order_ID
HAVING SUM(Sales) > 
(SELECT AVG(order_sales)FROM
(SELECT order_id , SUM(Sales) as order_sales
FROM Orders
GROUP BY order_id) as Order_Aggregator);

SELECT * FROM employee
SELECT * FROM dept 
WHERE dept_id = 500;

UPDATE employee set dept_id = 700 WHERE dept_id = 500

--Using su query directly an a result (Not using Alias)

SELECT * FROM employee
WHERE dept_id NOT IN (SELECT dept_id FROM dept)

--Now one usecase to see how are sub queries implemented
--For example if we have to add a new column of average salary and we are doing it through a sub query
--Then we will create a filter where we will not let the dept_id = 700 person adn the average turns out to be 9200 instead of 9000 with all employees included
-- But we will see that even after 

SELECT * , (SELECT AVG(Salary) FROM employee) as Avg_Salary
FROM employee
WHERE dept_id IN (SELECT dept_id FROM Dept)-- Avg salary 9100
--The above one happend because the first sub query got implemented the first time and then the second one did so,
--even when we removed the dept_id =700 ,  the average remaied the same with all the employees included

SELECT AVG(Salary) FROM employee
WHERE dept_id != 700 -- avg salary 9333


--Sub Query in Joins

SELECT A.* , B.*
FROM
(SELECT Order_ID , SUM(Sales) as order_Sales
FROM Orders
GROUP BY Order_ID) as A
INNER JOIN
(SELECT AVG(order_agg.order_sales) as avg_order_sales FROM
(SELECT order_id , SUM(Sales) as order_sales
FROM Orders
GROUP BY order_id) as order_agg) as B
ON 1 = 1 -- This entire reuslt prints the number of distinct order ids and thats what we needed


SELECT COUNT(DISTINCT Order_ID) from Orders;

--find the average department Salary
--Intutuion to sove this is first average is the salary in the dept table and then join the table to the main table

SELECT * FROM employee

SELECT dept_id , AVG(Salary)
FROM employee
GROUP BY dept_id;

--Now the above 2 tables have to be joined to get the resultant result

SELECT e.* , d.average_dept_salary
FROM Employee e
INNER JOIN
(SELECT dept_id, AVG(Salary) as average_dept_salary
FROM employee
GROUP BY dept_id) as d
on e.dept_id = d.dept_id;

--ICC World cup question , mke a points table

SELECT * FROM icc_world_cup


SELECT team_name , COUNT(1) as matches_played , SUM(win_flag) as matches_won , COUNT(1) - SUM(win_flag) as lost_match -- COUNT(1) is also COUNT(*)
FROM
(SELECT team_1 as team_name , case when team_1 = winner then 1 else 0 end as win_flag
FROM icc_world_cup
UNION ALL
SELECT team_2 as team_name , case when team_2 = winner then 1 else 0  end as win_flag
FROM icc_world_cup) as A
GROUP BY team_name;