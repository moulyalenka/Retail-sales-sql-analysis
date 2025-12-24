--1. Total Units Sold By Product
SELECT  p.Product_name, SUM(o.Quantity) AS Units_Sold
FROM Products p JOIN Order_items oi ON p.Product_id = o.Product_id
GROUP BY p.Product_name
ORDER BY Units_Sold DESC
LIMIT 15;

--2. Average Price Of Products By Category
SELECT c.Category_name, AVG(p.Price) AS Average_Product_Price
FROM Categories c JOIN Products p ON c.Category_id = p.Category_id
GROUP BY c.Category_name
LIMIT 15;

--3. Number Of Products In Each Category

SELECT c.Category_name, COUNT(p.Product_id) AS Product_Count
FROM Categories c JOIN Products p ON c.Category_id = p.Category_id 
GROUP BY c.Category_name;


