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

