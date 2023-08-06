--Q1
SELECT Order_ID , Customer_Name
FROM Orders
WHERE Customer_Name LIKE '_a_d%'

--Q2
SELECT Order_ID , Order_Date
FROM Orders
WHERE Order_Date BETWEEN '2020-12-01' AND '2020-12-31'
ORDER BY Order_Date;

--Q3
SELECT Order_ID , Ship_Mode , Ship_date
FROM Orders
WHERE Ship_Mode NOT IN ('Standard Class' , 'First Class') AND Ship_date > '2020-11-30'
ORDER BY Ship_Date;

--Q4

SELECT Order_ID , Customer_Name
FROM Orders
WHERE Customer_Name NOT LIKE 'A%n';

--Q5

SELECT Order_ID , Customer_Name , Profit
FROM Orders
WHERE Profit < 0;

--Q6

SELECT Order_ID , Customer_name , profit , Quantity
FROM Orders
WHERE profit = 0 OR Quantity < 3;

--Q7

SELECT * FROM Orders
WHERE Profit = 0 AND Discount > 0;

--Q8

SELECT TOP 5 * FROM Orders
WHERE Category = 'Furniture'
ORDER BY Sales DESC;

--Q9

SELECT *
FROM Orders
WHERE Category IN ('furniture' , 'Technology') AND Order_Date BETWEEN '2020-01-01' AND '2020-12-31';

