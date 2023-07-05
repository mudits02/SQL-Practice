--Distinct number of marks solution , different approach

SELECT student_id , COUNT(*) as total_marks , COUNT(DISTINCT Marks) as distinct_marks 
FROM exams
WHERE SUBJECT IN ('Physics' , 'Chemistry')
GROUP BY student_id
HAVING COUNT(*) = 2 AND COUNT(Distinct marks) = 1;

--JOINS

SELECT o.Order_id , o.order_date , r.return_reason
FROM Orders o
INNER JOIN returns r on o.Order_ID = r.Order_ID;


