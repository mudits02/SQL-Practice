SELECT * FROM orders
--Q1

SELECT order_date, order_id, customer_name
FROM orders
WHERE customer_name LIKE '_a_d%';

--Q2

SELECT order_date, order_id , customer_name
FROM orders
WHERE cast(order_date as varchar) LIKE '2020-12-%'

--Q3
SELECT order_date, ship_mode, ship_date
FROM orders
WHERE ship_mode NOT IN ('Standard Class', 'First Class') and cast(order_date as DATE) > '2020-11-30';

