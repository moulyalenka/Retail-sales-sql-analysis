-- 1. Total sales revenue
SELECT SUM(Quantity * Item_price) AS Total_Revenue
FROM Order_items;

-- 2. Total number of orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- 3. Total sales by city
SELECT c.City, SUM(oi.Quantity * oi.Item_price) AS City_Revenue
FROM Customers c JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Order_items oi ON o.Order_id = oi.Order_id
GROUP BY c.City
ORDER BY City_Revenue DESC;

