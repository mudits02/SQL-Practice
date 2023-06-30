--LIKE Operator

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE 'C%'; --All names starting with letter C (% means C ke baad kucch bhi ho sakta hai name main)

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE 'Chris%'; -- Anything after Chris(Chris should be the pattern matching string)

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE '%Schild'; --Anything before this word can be (Ending with Schild)

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE '%T'; --Ending with t(t and T ek hi baat hai ismein)

--starting with anything , ending with anything , but somethimg we require in between

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE '%ven%'; --ven hona chhahiye naam ke beech main

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE 'A%a'; --first char should A and last char should be a

-- If we want that to check it even when the SQL server has case sensitive off

SELECT Order_Id, order_date , UPPER(Customer_Name) as cust_name
FROM Orders
WHERE Customer_Name LIKE 'A%A';

-- _ operator

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE '_L%'; --Second character should be L and then anything , _ -> One character

-- [] operator

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE 'C[al]%'; -- here first character is C and then second character could be either a or l

-- [^] operator

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE 'C[^al]%'; -- Means second character can neither be a nor be l

--Anything betweeen 2 characters

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Customer_Name LIKE 'C[a-f]%'; -- Means anything between a and f can be there at the econd character

-- Another example

SELECT Order_Id, order_date , Customer_Name
FROM Orders
WHERE Order_ID LIKE 'CA-202[1-2]%'; -- Means either CA-2021% or CA-2022%