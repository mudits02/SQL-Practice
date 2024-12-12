SELECT order_id, order_date, customer_name
FROM orders
WHERE customer_name LIKE 'Chris%'

SELECT order_id, order_date, customer_name
FROM orders
WHERE customer_name LIKE '%Schild';

SELECT order_id, order_date, customer_name
FROM orders
WHERE customer_name LIKE '%hris%'

SELECT order_id, order_date, customer_name
FROM orders
WHERE UPPER(customer_name) LIKE 'A%A';

SELECT order_id, order_date, customer_name
FROM orders
WHERE UPPER(customer_name) LIKE '_L%A'; --Means First letter can by anytning , then it shoild have L , then anything and it should end with A

SELECT order_id, order_date, customer_name
FROM orders
WHERE UPPER(customer_name) LIKE '__L%A'; --First 2 can be anything , then l , then Anything , then A

SELECT order_id, order_date, customer_name
FROM orders
WHERE customer_name ~ '^C[al].*';--Second character can either a or l


