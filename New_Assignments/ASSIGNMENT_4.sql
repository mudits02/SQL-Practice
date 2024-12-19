-- Assignment_4 Exercise

SELECT * FROM orders;

-- Q1
ALTER TABLE orders
ALTER COLUMN city DROP NOT NULL;

UPDATE orders
SET city = NULL
WHERE order_id IN ('CA-2020-161389', 'US-2021-156909');

--Q2

SELECT order_id , city
FROM orders
WHERE city IS NULL;

--Q3

SELECT category, SUM(cast(profit as FLOAT)) as total_profit,
MIN(order_date) as min_order_date,
MAX(order_date) as latest_order_date
FROM orders
GROUP BY category

--Q4

SELECT sub_category
FROM orders
GROUP BY sub_category
HAVING AVG(CAST(profit AS FLOAT)) > MAX(CAST(profit AS FLOAT)) / 2;

--Q5

CREATE TABLE exams (
    student_id INT NOT NULL,
    subject VARCHAR(50) NOT NULL,
    score INT NOT NULL
);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

SELECT * FROM exams;

select student_id , score
from exams
where subject in ('Physics','Chemistry')
group by student_id , score
having count(1)=2

--Q5 (Alternate approach)

SELECT student_id, COUNT(*) as total_col, COUNT(DISTINCT score) as distinct_count
FROM exams
WHERE subject in ('Physics' , 'Chemistry')
GROUP BY student_id
HAVING COUNT(*) = 2 AND COUNT(DISTINCT score) = 1;

--Q6
select category,count(distinct product_id) as no_of_products
from orders
group by category;




