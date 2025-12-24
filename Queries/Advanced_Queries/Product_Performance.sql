--1. Product revenue ranking
--Purpose:- Which products performs best within each category??
SELECT c.Category_name, p.Product_name,SUM(oi.quantity * p.price) AS product_revenue, 
		RANK() OVER ( PARTITION BY c.Category_name
    			ORDER BY SUM(oi.quantity * p.price) DESC) AS revenue_rank
FROM Order_items oi JOIN Products p ON oi.Product_id = p.Product_id
JOIN Categories c ON p.Category_id = c.Category_id
GROUP BY c.Category_name, p.Product_name;

--2. Low-volume high-price products
--Purpose:- Are expensive products actually selling??
SELECT p.Product_name, p.Price, SUM(oi.Quantity) AS total_units_sold
FROM Products p LEFT JOIN Order_items oi ON p.Product_id = oi.Product_id
GROUP BY p.Product_name, p.Price
HAVING SUM(oi.Quantity) < 10
ORDER BY p.Price DESC;

--3. Product sales trend over time
--Purpose:- Is a product gainig or lossing demand or popularity over time??
SELECT p.Product_name, DATE_FORMAT(o.Order_date, '%Y-%m') AS order_month,
	SUM(oi.Quantity) AS monthly_sales
FROM Orders o JOIN Order_items oi ON o.Order_id = oi.Order_id
JOIN Products p ON oi.Product_id = p.Product_id
GROUP BY p.Product_name, DATE_FORMAT(o.Order_date, '%Y-%m')
ORDER BY p.Product_name, order_month;


