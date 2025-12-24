--1. Total Customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

--2. Customer Count By City
SELECT City, COUNT(*) AS Customer_Count
FROM Customers
GROUP BY City
ORDER BY Customer_Count DESC;

--3. Customers Who Placed Order More Than 1
SELECT c.Customer_name, COUNT(o.Order_id) AS Orders_Count
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_name
HAVING Orders_Count > 1
ORDER BY Orders_Count DESC;

