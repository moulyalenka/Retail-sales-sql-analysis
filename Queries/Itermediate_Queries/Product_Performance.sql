--1. Revenue genrated by each product
--Purpose:- Which products actually make money??
SELECT  p.Product_name, SUM(oi.Quantity * oi.Item_price) AS Product_Revenue
FROM Products p
JOIN Order_items oi ON p.Product_id = oi.Product_id
GROUP BY p.Product_name
ORDER BY Product_Revenue DESC
LIMIT 10;

--2. Products that were never sold
--Purpose:- Dead inventory detection
SELECT  p.Product_name AS Dead_Products
FROM Products p LEFT JOIN Order_items oi ON p.Product_id = oi.Product_id
WHERE oi.Product_id IS NULL;

--3. Average quantity sold per order for each product
--Purpose:- Bulk-buy products Vs Single unit products
SELECT  p.Product_name, AVG(oi.Quantity) AS Avg_Quantity_Per_Order
FROM Products p JOIN Order_items oi ON p.Product_id = oi.Product_id
GROUP BY p.Product_name
ORDER BY Avg_Quantity_Per_Order DESC
LIMIT 10;


