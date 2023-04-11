-- This is called DDL -> Data Definition language or by which we are defingi are database
CREATE TABLE amazon_order
(
	order_id INT, -- If we write order_id INT NOT NULL: , then the querying lang takes care that the entry cannot be null or it gives an erro
	order_date DATE,
	product_name VARCHAR(50),
	total_price DECIMAL,
	payment_method VARCHAR(50)
);


-- This is called DML -> Data Manipulation Language , or by which we are manipulating the data in our required way.

INSERT INTO amazon_order VALUES(1 , '2023-04-03' , 'Macbook' , 159000.95 ,'Credit Card');
INSERT INTO amazon_order VALUES(2 , '2023-04-18' , 'Mouse' , 1590 ,'UPI');
INSERT INTO amazon_order VALUES(3 , '2023-04-21' , 'Headphone' , 2000 ,'Debit Card');
INSERT INTO amazon_order VALUES(4 , '2023-04-01' , 'Keyboard' , 3500 ,'UPI');
INSERT INTO amazon_order VALUES(5 , '2023-03-31' , 'Chips' , 300 ,'UPI');

-- This is DQL -> Data Querying Lang because we are just querying the data here
SELECT * FROM amazon_order;
SELECT order_date FROM amazon_order;
-- Limiting columns or selecting on the basis of columns
SELECT order_id , product_name FROM amazon_order;
-- Limiting rows or selecting on the basis of rows
SELECT TOP 2 * FROM amazon_order; 

-- order by is used to order the data i.e. sort the data. In default without condition , it sorts the data
SELECT * FROM amazon_order
ORDER BY order_date;

SELECT * FROM amazon_order
ORDER BY order_date DESC -- DESC used for descending order

SELECT * FROM amazon_order
-- First the order_date are arraneged  , the the total price, if order_date are same then it goes tot he second condition
ORDER BY order_date DESC , total_price ASC; 
/* To delete a table we use
	DROP TABLE amaon_orders;
*/
-- Change the type of datatpe of the entries of a column
ALTER TABLE amazon_order ALTER COLUMN order_date DATETIME; -- This will be DDL coz we are chagin gthe structure of the table

ALTER TABLE amazon_order ADD user_name VARCHAR(30);
SELECT * FROM amazon_order;
ALTER TABLE amazon_order ADD CATEGORY VARCHAR(10);
SELECT * FROM amazon_order;
ALTER TABLE amazon_order DROP COLUMN CATEGORY; --to delete a column from the table

ALTER TABLE amazon_order ALTER COLUMN order_date DATE;
SELECT * FROM amazon_order;
INSERT INTO amazon_order VALUES(1 , '2023-04-03' , 'Macbook' , 159000.95 ,'Credit Card' , 'MUDIT');
SELECT * FROM amazon_order;
DELETE FROM amazon_order WHERE user_name = 'MUDIT';
SELECT * FROM amazon_order;



CREATE TABLE a_orders
(
	order_id INT NOT NULL, -- No NULL value in the order_id
	order_date DATE,
	product_name VARCHAR(50),
	total_price DECIMAL,
	payment_method VARCHAR(50) CHECK (payment_method in ('UPI' , 'CREDIT CARD' , 'DEBIT CARD')) -- payment method should be ayone one of the three only
);

INSERT INTO a_orders VALUES(1 , '2023-04-04' , 'Bottle' , 103 , 'UPI');
SELECT * FROM  a_orders;

DROP TABLE a_orders;

CREATE TABLE a_orders
(
	order_id INT, -- No NULL value in the order_id and unique keyword means that values cannot repeat in it
	order_date DATE,
	product_name VARCHAR(50),
	total_price DECIMAL,
	payment_method VARCHAR(50) CHECK (payment_method in ('UPI' , 'CREDIT CARD' , 'DEBIT CARD')) DEFAULT 'UPI', -- payment method should be ayone one of the three only
	discount INT CHECK (discount <= 20),
	category VARCHAR(20) DEFAULT 'Grocery',
	PRIMARY KEY (order_id) --PRIMARY KEY in SQL has no null values and non repeating values or UNIQUE
);

INSERT INTO a_orders VALUES(1 , '2023-04-04' , 'Bottle' , 103 , 'UPI' , 10 , 'Metal Product');
INSERT INTO a_orders VALUES(2 , '2023-04-18' , 'Coca Cola' , 40 , 'UPI' , 20 , 'Bevrage'); -- Check function returns bool values

--If we dont pass the contraint even in default value , it will give me erros , so in the following we will custom input
--In custom input , the names of columns can be in any order and it will work fine
INSERT INTO a_orders(order_id , order_date , product_name , total_price , payment_method , discount)
VALUES(3 , '2023-04-12' , 'Brocolli' , 88 , 'DEBIT CARD' , 15); 

SELECT * FROM a_orders;


SELECT * FROM a_orders
ORDER BY order_id;

-- DELETE IN TABLE

DELETE FROM a_orders WHERE discount = 20;
SELECT * FROM  a_orders;

--UPDATE IN A TABLE

UPDATE a_orders
SET discount = 18 WHERE category = 'Grocery';
SELECT * FROM  a_orders;























