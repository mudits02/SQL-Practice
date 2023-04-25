--string functions
SELECT order_id , customer_name , LEN(customer_name) as name_len,
LEFT(customer_name , 4) as name_4,
right(customer_name , 4) as name_rigt_4,
SUBSTRING(customer_name , 4 , 5) as substr,
CHARINDEX(' ' , Customer_Name) as char_index -- returns the first index of the character we are passing , return 0 if doesnt exist , in charindex , indexing is done not from 0 but 1
FROM Orders;
