SELECT TOP 5 order_id , order_date
FROM dbo.Orders
ORDER BY order_id;

--to get all the distinct values
SELECT DISTINCT ship_mode FROM Orders;
SELECT COUNT(DISTINCT Order_Date) FROM Orders; -- Counting all the distinct order_date
SELECT DISTINCT ship_mode , segment FROM orders;

SELECT * FROM Orders;

--FILTERS
SELECT * FROM Orders
WHERE Ship_Mode = 'First Class';

SELECT * FROM Orders
WHERE Quantity > 5
ORDER BY Quantity;

SELECT * FROM Orders
WHERE Order_Date BETWEEN '2020-12-08' AND '2020-12-12'
ORDER BY Order_date DESC;

SELECT * FROM Orders
WHERE Ship_Mode in ('First Class' , 'Second Class'); -- NOT IN  will be its negation

SELECT DISTINCT Ship_Mode FROM Orders
WHERE Ship_Mode >= 'Second Class'; -- It sorts or compares the in terms of the ASCII values;

SELECT * FROM Orders
WHERE Ship_Mode = 'First Class' AND Segment = 'Consumer'

-- TypeCasting of a column
-- We use SELECT CAST(Column_Name as DataType) as Name_of_the_New_Column , * from Table_Name

-- CREATING NEW COLUMN
--Syntax => SELECT * , operation(can be anything even for columns) AS New_Column_Name FROM Table_Name

SELECT * , profit/sales AS Ratio
FROM Orders;

SELECT * , profit/sales AS Ratio , profit + sales AS Total , GETDATE() as Time_of_Change --GETDATE() is an inbuilt fucntion that shows the current time of your manipulation
FROM Orders;

--STRING/PATTERN MATCHING OPERATIONS

SELECT order_id , order_date , customer_name
FROM Orders;

-- All customer whose names starting with C
SELECT customer_name FROM Orders
WHERE Customer_Name LIKE 'Cl%'; --LIKE COMMAND and 'Word%' where % baaki sab kucch bhi but starting Cl se honi chaahiye

SELECT customer_name FROM Orders
WHERE Customer_Name LIKE '%dtke'; -- % matlab ki iske pahele kucch bhi ending isse hi honi chaahiye

SELECT customer_name FROM Orders
WHERE Customer_Name LIKE '%ven%'; -- ven in between

--for example if we want to do case insensitive search we can convert the entire names into either upper case or lower case

SELECT customer_name , UPPER(customer_name) as Upper_Name
FROM Orders
WHERE UPPER(customer_name) LIKE 'A%A';

--If we want that the thord character is say E , then we use _ , _ stands for one character so 3rd char means __E
SELECT customer_name FROM Orders
WHERE UPPER(Customer_Name) LIKE '__E%'; --implies 3rd character should be E

-- % -> Means one or more character
-- _ -> One character

SELECT customer_name FROM Orders
WHERE Customer_Name LIKE 'C[al]%'; -- This means that name should start with C and the second char can be either a or c

SELECT customer_name FROM Orders
WHERE Customer_Name LIKE 'C[^al]%'; -- This means that second character cannot be al or negation of the previous QUERY

-- If we want a range of the character

SELECT customer_name FROM Orders
WHERE Customer_Name LIKE 'C[a-o]%' -- Second character can be anything between a to o
ORDER BY Customer_Name;

-- Filtering NULL values

SELECT * FROM Orders
WHERE City is null;-- We cannot write -> WHERE City = null; Coz NULL is unknown(neither 0 or garbage)
SELECT * FROM Orders
WHERE City is not NULL; -- Not NULL values

--WORKING WITH NULL DATA

SELECT * FROM Orders
UPDATE Orders
SET City=null
WHERE order_id IN ('CA-2020-161389' , 'US-2021-156909');

SELECT * FROM Orders
WHERE City IS NULL;