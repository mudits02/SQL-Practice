--SELECT and Pattern Matching

SELECT * FROM orders;

--Top command of SQL Server in Postgres
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 5;

--DISTINCT
SELECT DISTINCT segment FROM orders;

--If we do like DISTINCT for say 2 columns , it will give us the combination of all the possible distinct values
SELECT DISTINCT ship_mode,segment FROM orders;

--Filters
--Not writing the normal where clause
--BETWEEN Clause
SELECT * FROM orders
WHERE order_date BETWEEN '2020-11-08' AND '2020-12-10' --both the ends are included in the range , always take dates in '' and not ""
ORDER BY order_date DESC;

-- IN Clause -> Multiple Values from the same Col are needed in the filter condition
SELECT * FROM orders
WHERE ship_mode IN ('First Class', 'Second Class')
ORDER BY order_date;

--ASCII Value relevance in filter
SELECT DISTINCT ship_mode FROM orders
WHERE ship_mode > 'First Class'; -- This will give us more ascii value words than this

--Multiple col filter
SELECT * FROM orders
WHERE ship_mode = 'First Class' AND segment = 'Consumer';


SELECT CAST(order_date AS TIME), * -- Typecast errors but changes the datatype while in runtime
FROM orders;

-- Converting for the below operations
ALTER TABLE orders 
ALTER COLUMN "profit" TYPE NUMERIC USING "profit"::NUMERIC;

ALTER TABLE orders 
ALTER COLUMN "sales" TYPE NUMERIC USING "sales"::NUMERIC;


--Making a new col (while running the query)
SELECT order_date, ROUND((profit/sales), 2) as ratio
FROM orders;

--Pattern Matching (Like Operator)
-- 1. First character and then anything

SELECT * FROM orders
WHERE customer_name LIKE 'C%';

-- 2. Ends with soemthing

SELECT * FROM orders
WHERE customer_name LIKE '%d';

-- 3. In between something (say in between 'ven')
SELECT * FROM orders
WHERE customer_name LIKE '%ven%';


-- 4. Starts with something and ends with something
SELECT * FROM orders
WHERE customer_name LIKE 'A%a';

-- 5. First letter can be anything , then we need some letter and then anything
SELECT * FROM orders
WHERE customer_name LIKE '_l%';
-- For 2 character for anytiing , just do 2 underscore -> __

-- 6. If we want a collection of characters that can be there, then use [] method for the LIKE , btw these are all for the second character in this case
SELECT * from orders
WHERE customer_name LIKE 'C[alb]%'; -- Works for SQL server only ,  for postgeres it is following

SELECT * FROM orders
WHERE customer_name SIMILAR TO 'C(a|l|b)%';

-- For its negative scenarios it is
SELECT * FROM orders
WHERE customer_name ~ '^C[^alb]'; -- basically matching regex

-- Case insensitive verison
SELECT * FROM orders
WHERE customer_name ~* '^C[^alb]';

-- If we want to say give a range instead for say the second character
SELECT * FROM orders
WHERE customer_name ~ '^C[a-h]';
