-- Assignment_4 Exercise

SELECT * FROM orders;

-- Q1
ALTER TABLE orders
ALTER COLUMN city DROP NOT NULL;

UPDATE orders
SET city = NULL
WHERE order_id IN ('CA-2020-161389', 'US-2021-156909');

SELECT order_id , city
FROM orders
WHERE city IS NULL;

--Q2


