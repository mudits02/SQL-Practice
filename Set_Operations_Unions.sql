--String Functions
--REMEMBER , IN SQL , String indexes Start from 1

SELECT Order_ID , Customer_name , 
LEN(Customer_name) as name_length,
LEFT(Customer_Name , 4), --4 characters from the left
RIGHT(Customer_Name , 5) -- 5 characters from the right
FROM Orders;

--SUBSTRING (Substring in SQL)
--SUBSTRING(name_of_the_column , starting index of the character , number of chars u want to inlcude)
--Example -> Claire Gute and SUBSTRING(Customer_name , 4 , 5) ,  answer would be -> ire G

SELECT Order_ID , Customer_Name,
SUBSTRING(Customer_Name , 4 , 5) as substr_example,
SUBSTRING(Order_ID , 4 , 4) as year_of_order,
CHARINDEX(' ' , Customer_Name) as space_position,--CHARINDEX tells the position of the character in the string , if not then it returns 0 , on repeating characters , it gves the first occurence
CHARINDEX('n' , Customer_name , 4) as second_space, -- third parameter is the start positon of the string , its not a compulsory parameter
CONCAT(Order_id , customer_name) as concatenated_string,
CONCAT(Order_ID , '-' , Customer_Name) as Concat_string_with_a_sign, --'-' makes the sign between the string
Order_ID + '-' + Customer_Name as alternate_concat, -- '+' can be used alternatvely instead of concat same as previos line
REPLACE (customer_name , 'A' , 'B') as replace_A_with_B -- A is replaced with B in customer name
FROM Orders;

--TRIM Funtion removes leading and trailing spaces , not the between one

--NULL Handling functions
-- ISNULL Functiom -> if there are null values in a column and we dont want it to display null then we use it
--For example ISNULL(City , 'Term from which u want to replace NULL')
--COALESCE is basically multiple Isnulls taking place
--Also in both ,  the datatype of the column should be matching with thing we are replacing it with

SELECT Order_ID , City , ISNULL(City , 'Unknown') as new_city, -- can be used without the where clause also
COALESCE(City , state , region , 'Unknown') as multiple_isnulls_aka_coalesce -- if city is null , then check state is nll or not if it is not , return state if it is then region and same rule then return unknow
FROM Orders
WHERE city is null;

--ROUND Function , rounds the number to the parameter provided
--ROUND(Column_name , kahan tak round karna hai(int)

--SET Functions/queries
--UNION ALL , UNION

SELECT * FROM orders_west
UNION ALL
SELECT * FROM orders_east; --While doing union , noth the queries must have equal number of columns

--UNION removes all the duplicates in the table  , then t does union

--INTERSECT

SELECT Order_ID , Sales as Sale FROM orders_east
INTERSECT
SELECT Order_ID , Sales FROM orders_west

--If we want to do A - B like in set theory , we use EXCEPT

SELECT Order_ID , Sales as Sale FROM orders_east
EXCEPT
SELECT Order_ID , Sales FROM orders_west;




