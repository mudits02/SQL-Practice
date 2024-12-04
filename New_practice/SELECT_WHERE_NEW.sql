SELECT order_date, order_id FROM orders
ORDER BY order_date desc
LIMIT 5

SELECT DISTINCT ship_mode FROM orders

SELECT * FROM orders
WHERE ship_mode='First Class';

SELECT order_date, quantity 
FROM orders
WHERE quantity >= 5
ORDER BY quantity
LIMIT 5

SELECT * FROM orders
WHERE order_date BETWEEN '2020-12-08' AND '2020-12-10'
ORDER BY order_date DESC

SELECT * from orders
WHERE quantity in (3,5)
ORDER BY order_date desc

SELECT * FROM orders
WHERE ship_mode IN ('First Class' , 'Same Day') --'not in' for exclusion
ORDER BY quantity DESC;

--Same as above query , no performance difference
SELECT order_date, ship_mode , segment FROM orders
WHERE ship_mode = 'First Class' or ship_mode = 'Same Day'

SELECT DISTINCT ship_mode from orders
WHERE ship_mode >= 'Second Class'

SELECT order_date, ship_mode , segment FROM orders
WHERE ship_mode = 'First Class' and segment = 'Consumer'

SELECT order_date, ship_mode , segment FROM orders
WHERE ship_mode = 'First Class' or segment = 'Consumer'











