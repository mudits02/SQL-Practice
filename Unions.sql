--string functions
SELECT order_id , customer_name ,
REPLACE(order_id , 'CA' , 'PB') ,
LEN(customer_name) as name_len,
TRANSLATE(customer_name , 'AG' , 'TP') as translate_ag, -- translate function replaces one to one i.e. a -> t and g -> p is replaced in the string
LEFT(customer_name , 4) as name_4,
right(customer_name , 4) as name_rigt_4,
SUBSTRING(customer_name , 4 , 5) as substr,
CHARINDEX('n' , Customer_Name , 1) as char_index, -- returns the first occurrence index of the character we are passing , return 0 if doesnt exist , in charindex , indexing is done not from 0 but 1
CHARINDEX('n' , Customer_Name , CHARINDEX('n' , Customer_Name , 1) + 1) as second_n,
CONCAT(Order_id , ' ' , Customer_Name) as concatenaion,
order_id + '-' + Customer_Name as con
FROM Orders;


--NULL handling function , replacing null with some default value

SELECT order_id , City , ISNULL(city , ' unknown') as new_city,
COALESCE(city , state , region , 'unknown')
FROM Orders
WHERE City is NUll
ORDER BY City

--Typecasting

SELECT order_id , sales , CAST(sales as int) as sales_int,
ROUND(sales , 1) as sales_int
FROM Orders

--SET Queries
CREATE TABLE orders_west
(
order_id INT,
region VARCHAR(100),
sales INT
)

CREATE TABLE orders_east
(
order_id INT,
region VARCHAR(100),
sales INT
)

INSERT INTO orders_west VALUES(1 , 'west' , 100) , (2 , 'west' , 200)
INSERT INTO orders_east VALUES(3 , 'east' , 300) , (4 , 'east' , 400)
INSERT INTO orders_west VALUES(3 , 'east' , 300)

SELECT * FROM orders_west
UNION ALL
SELECT * FROM orders_east

--UNION ALL doesnt remove duplicates while UNION removes duplicates

SELECT * FROM orders_west
UNION
SELECT * FROM orders_east

--in union all, datatypes and dimensions of the tables should be compatible or else it throws error
SELECT * FROM orders_east
INTERSECT -- Finds the common data points
SELECT * FROM orders_west


