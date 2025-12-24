--1. Monthly sales revenue trend
--Purpose:- Sales Growing or Falling??
SELECT DATE_FORMAT(o.Order_date, '%Y-%m') AS Month, SUM(oi.Quantity * oi.Item_price) AS Revenue
FROM Orders o JOIN Order_items oi ON o.Order_id = oi.Order_id
GROUP BY Month
ORDER BY Month;

--2. Percentage contribution of each category to total sales
--Purpose:- Which category actually drives revenue??
SELECT  c.Category_name, ROUND( SUM(oi.Quantity * oi.Item_price) * 100.0 /
       	     			(SELECT SUM(Quantity * Item_price) FROM Order_items), 2
       	     		) AS Revenue_Percentage
FROM Categories c JOIN Products p ON c.Category_id = p.Category_id
JOIN Order_items oi ON p.Product_id = oi.Product_id
GROUP BY c.Category_name
ORDER BY Revenue_Percentage DESC;




