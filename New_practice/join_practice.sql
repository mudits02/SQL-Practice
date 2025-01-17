-- Employee and Manager table practice for joins

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
SELECT * FROM employee;

-- Cross Join, when there is no condition for joining, it gives number of rows of table1 * number of rows of table2

SELECT * FROM employee
INNER JOIN dept on 100 = 100;

-- Inner Join , 9 entries coz 10th Entry Rakesh has a dept_id as 500 and it doesnt exist in dept and also no dept id 400 there

SELECT * FROM
employee e
INNER JOIN dept d ON e.dept_id = d.dep_id;

-- Right Join, we wont have the Rakesh one row coz it is right join and all the entries of the right table and the common of the left will be available

SELECT * FROM
employee e
RIGHT JOIN dept d ON e.dept_id = d.dep_id;

-- Left Join, we wont have the 400 one coz it is left join and all entires of left table

SELECT * FROM
employee e
LEFT JOIN dept d ON e.dept_id = d.dep_id;

-- Full outer join, there in postgresql

SELECT * FROM
employee e
FULL OUTER JOIN dept d ON e.dept_id = d.dep_id;

SELECT DISTINCT o.order_id , o.product_id, r.return_reason
FROM orders o
RIGHT JOIN returns r on o.order_id = r.order_id;

SELECT * FROM returns;



























