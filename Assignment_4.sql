--Q2

SELECT * FROM Orders
WHERE city is null;

--Q3

SELECT Category , SUM(Profit) AS Total_Profits , MAX(Order_Date) AS Latest_Order_Date , MIN(Order_date) AS first_Order_date
FROM Orders
GROUP BY Category;

--Q4

SELECT Sub_Category
FROM Orders
GROUP BY Sub_Category
HAVING AVG(Profit) > Max(Profit) / 2;

--Q5

SELECT student_id 
FROM exams
WHERE subject in ('Physics' , 'chemistry')
GROUP BY Student_ID , marks
HAVING COUNT(1) = 2;

--Q6

SELECT Category , SUM(Quantity)
FROM Orders
GROUP BY Category;
