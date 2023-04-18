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

