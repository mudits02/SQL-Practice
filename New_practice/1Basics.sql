-- DDL -> Data Definition Language
-- When we are defining the data or a column , for example Create or Drop Table because the data is being Defined

-- DML -> Data Manipulation Language
-- When we are Manipulating data inside the Database( data manipulation , not the type and all) example -> Insert, Alter

-- DQL -> Data Querying Language
-- When we query the data from the Database and then we get an output , example -> Select statement



CREATE TABLE amazon_orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP,
    product_name TEXT,
    amount NUMERIC(10, 2),
    payment_method TEXT
);
INSERT INTO amazon_orders (order_date, product_name, amount, payment_method) 
VALUES 
('2022-10-01 12:05:12', 'Pants', 132.50, 'UPI'),
('2022-11-15 18:30:45', 'Shoes', 2999.99, 'Credit Card'),
('2023-01-20 09:10:22', 'Watch', 1599.00, 'Debit Card'),
('2023-03-05 14:25:38', 'Laptop Bag', 799.50, 'Net Banking'),
('2023-06-11 20:45:00', 'Earphones', 449.75, 'UPI'),
('2023-08-23 07:35:15', 'Notebook', 149.00, 'Cash on Delivery'),
('2024-01-02 13:50:19', 'T-shirt', 499.00, 'Credit Card'),
('2024-06-18 11:11:11', 'Smartphone', 20999.99, 'EMI');

SELECT * FROM amazon_orders;

SELECT * FROM amazon_orders
ORDER BY amount DESC
LIMIT 5; --works same as TOP command in sql server

-- Say if I want to alter the data type of column , how this is done (DDL)
ALTER TABLE amazon_orders ALTER COLUMN order_date TYPE TIMESTAMPTZ;

--Adding a new column
ALTER TABLE amazon_orders ADD COLUMN user_name VARCHAR(100);

SELECT * FROM amazon_orders;

-- Adding data to the newly added column

UPDATE amazon_orders 
SET user_name = 'mudits02';

-- in psql null value is -> NULL 

-- Dropping a column

ALTER TABLE amazon_orders 
ADD COLUMN chutiya VARCHAR(10);

ALTER TABLE amazon_orders
DROP chutiya; -- This works fine

SELECT * FROM amazon_orders;


-- CHECK method->constraint is used to enforce a rule on column values — it ensures that only valid data can be inserted or updated.

CREATE TABLE a_orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP,
    product_name TEXT,
    amount NUMERIC(10, 2),
    payment_method TEXT CHECK (payment_method IN ('UPI', 'CREDIT CARD', 'DEBIT CARD'))
);

INSERT INTO a_orders (order_date, product_name, amount, payment_method) 
VALUES 
('2022-10-01 12:05:12', 'Pants PRO', 132.50, 'UPI'),
('2022-11-15 18:30:45', 'Shoes', 2999.99, 'Credit Card')










