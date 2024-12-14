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

--Q4
SELECT order_id, customer_name 
FROM orders
WHERE customer_name NOT LIKE 'A%' AND customer_name NOT LIKE '%n';

--Q5
select * from orders where cast(profit as FLOAT) < 0.0

--Q6
SELECT quantity, profit 
FROM orders
WHERE quantity < 3 OR cast(profit as float) = 0.0

--Q9
SELECT order_id, order_date, category
FROM orders
WHERE category IN('Technology', 'Furniture') AND cast(order_date as VARCHAR) LIKE '2020%';

--Q10
SELECT order_id, order_date, ship_date
FROM orders
WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31' AND ship_date BETWEEN '2021-01-01' AND '2021-12-31'

--Q10 (Alternative)
SELECT order_id, order_date, ship_date
FROM orders
WHERE cast(order_date as VARCHAR) LIKE '2020%' AND cast(ship_date as VARCHAR) LIKE '2021%';




