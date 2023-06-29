SELECT TOP 5 Order_Id
FROM Orders;

--Distinct in SQL

SELECT DISTINCT Ship_Mode FROM Orders;

SELECT DISTINCT ship_mode , segment FROM Orders; -- Makes the combination of all the distinct pair

-- filters
SELECT COUNT(*) from Orders
WHERE Ship_Mode = 'First Class'

SELECT * FROM Orders
WHERE Quantity = 5

SELECT Row_ID , Quantity, Order_ID FROM Orders
WHERE Quantity >= 5 --  we can also do != an <=
Order by Quantity desc

--Between keyword (For range)

SELECT Row_ID , Quantity, Order_ID FROM Orders
WHERE Order_Date BETWEEN '2020-12-08' and '2020-12-18'
ORDER BY Quantity DESC

--If we want to select from 2 tpes of data for example all data with First Class and Same day

SELECT Row_ID , Quantity, Order_ID , Ship_Mode FROM Orders
WHERE Ship_mode in ('First Class' , 'Same Day')
ORDER BY Quantity DESC;

SELECT Row_ID , Quantity, Order_ID , Ship_Mode FROM Orders
WHERE Ship_mode not in ('First Class' , 'Same Day')
ORDER BY Quantity DESC;

-- If we want one thing from one col and other from othr col

SELECT * FROM Orders
WHERE ship_mode = 'First Class' and Segment = 'Consumer';


-- TypeCastng

SELECT * FROM Orders
WHERE CAST(order_date as DATE) = '2020-11-08'

-- Making coloumns

SELECT order_id , profit/sales as Ratio , profit + sales as Revenue
FROM Orders;

