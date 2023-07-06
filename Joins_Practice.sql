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

--LEFT JOIN

SELECT o.order_id , o.order_date , r.return_reason , r.order_id as return_order_id
FROM Orders o
LEFT JOIN returns r on o.order_ID = r.Order_ID;

--Filtering in Joins
--first the join happens and then the WHERE clause or the filter starts to be applied

SELECT o.order_id , o.order_date , r.return_reason , r.order_id as return_order_id
FROM Orders o
LEFT JOIN returns r on o.order_ID = r.Order_ID
WHERE r.return_reason IS NULL;

-- Every possible combination OR Cross Join concept

SELECT * 
FROM employee
LEFT JOIN dept on 1 = 1 --The result will be same for Right , Left or Inner join
ORDER BY employee.emp_id; 

--Inner join demo

SELECT * FROM
employee e
INNER JOIN dept d on e.dept_id = d.dept_id;