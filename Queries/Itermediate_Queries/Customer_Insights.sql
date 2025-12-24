--1. Customer lifetime value
--Purpose:- Who are our most valuable long-term customers??
SELECT  c.Customer_name, SUM(oi.Quantity * oi.Item_price) AS Lifetime_Value
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
JOIN Order_items oi ON o.Order_id = oi.Order_id
GROUP BY c.Customer_name
ORDER BY Lifetime_Value DESC
LIMIT 10;

--2. Repeat Vs one time customers
--Purpose:- Are customers coming back or not??
SELECT 
    CASE 
        WHEN Order_Count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS Customer_Type, COUNT(*) AS Customer_Count
		FROM ( SELECT  Customer_id, COUNT(Order_id) AS Order_Count
    			FROM Orders GROUP BY Customer_id
)  t GROUP BY Customer_Type;

