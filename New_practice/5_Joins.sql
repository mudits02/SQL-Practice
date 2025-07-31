-- Joins

-- Following queries are for creating a table for employee one
create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);
select * from employee;

create table dept(
    dep_id int,
    dep_name varchar(20)
);
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');
select * from dept;

SELECT * FROM orders;
SELECT * FROM returns;

-- Inner Join

SELECT o.order_id , o.order_date, r.return_reason
FROM orders o
INNER JOIN returns r on o.order_id = r.order_id; -- basically it is intersection of the 2 sets

-- Left Join
-- So basically, first Join happens and then we will see WHERE clause being allocated , also first join happens and then Aliases are decided
-- Because that is why u see in the select statement , r. and all are used

SELECT o.order_id, o.order_date, r.return_reason, r.order_id as return_order_id
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.order_id IS NULL;

-- Comparion between left join and inner join in this case
-- Left Join will give us a null col also for group by

SELECT r.return_reason, SUM(sales) as total_sales
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id
GROUP BY r.return_reason;

SELECT r.return_reason, SUM(sales) as total_sales
FROM orders o
INNER JOIN returns r ON o.order_id = r.order_id
GROUP BY r.return_reason;

-- Cross join -> every record joins wuth every other record , so it will have number of records multiplied of both the tables

SELECT * FROM employee e
INNER JOIN dept d on 1 = 1; -- 40 records as output ( 10 * 4)

-- Join (better visualization)

SELECT e.emp_id, e.dept_id, e.emp_name, d.dep_id, d.dep_name
FROM employee e
INNER JOIN dept d ON e.dept_id = d.dep_id; -- So in this the dep_id 400 in dept table and employee with dept_id 500 is not present in the table

-- Now when I will do a left join , the 500 one employe will come in the table (Visualize by Set theory)

SELECT e.emp_id, e.dept_id, e.emp_name, d.dep_id, d.dep_name
FROM employee e
LEFT JOIN dept d on e.dept_id = d.dep_id;

-- Similarly, if we do RIGHT JOIN , we will see the 400 dept_id in the table

SELECT e.emp_id, e.dept_id, e.emp_name, d.dep_id, d.dep_name
FROM employee e
RIGHT JOIN dept d on e.dept_id = d.dep_id;

-- FULL OUTER JOIN , basically the entire Set of both the tables

SELECT e.emp_id, e.dept_id, e.emp_name, d.dep_id, d.dep_name
FROM employee e
FULL OUTER JOIN dept d on e.dept_id = d.dep_id;


