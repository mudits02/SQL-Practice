SELECT COUNT(*) as cnt, 
SUM(Sales) as sales,
MAX(Sales) as Max_Sales,
MIN(Profit) as Min_Profit,
AVG(Profit) as Avg_Profit
FROM Orders;

SELECT TOP 1 * FROM Orders ORDER BY Sales DESC; -- Gives the row with the hogest profit

-- Group By --

SELECT COUNT(*) as cnt, 
SUM(Sales) as sales,
MAX(Sales) as Max_Sales,
MIN(Profit) as Min_Profit,
AVG(Profit) as Avg_Profit
FROM Orders;




