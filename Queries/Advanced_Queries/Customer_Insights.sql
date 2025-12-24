--1. Rank customers by life time value
--Purpose:- Who are our most valuable customers based on total spending??
SELECT Customer_name, Total_Spent, RANK() OVER (ORDER BY Total_Spent DESC) AS Customer_Rank
FROM ( SELECT c.Customer_name, SUM(oi.Quantity * oi.Item_price) AS Total_Spent
        FROM Customers c JOIN Orders o ON c.Customer_id = o.Customer_id
   	JOIN Order_items oi ON o.Order_id = oi.Order_id
    	GROUP BY c.Customer_name
) t;

--2. Time gap between customer orders
--Purpose:- How frequently customers place orders??
SELECT Customer_id, Order_date,
	 DATEDIFF( Order_date, LAG(Order_date) OVER (PARTITION BY Customer_id ORDER BY Order_date) ) AS Days_Between_Orders
FROM Orders;


