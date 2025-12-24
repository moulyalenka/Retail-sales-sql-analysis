--1. Rank months by total revenue
--Purpose:- Which month performed best??
SELECT  Month, Revenue, 
	RANK() OVER (ORDER BY Revenue DESC) AS Revenue_Rank
		FROM ( SELECT  DATE_FORMAT(o.Order_date, '%Y-%m') AS Month, 
			SUM(oi.Quantity * oi.Item_price) AS Revenue
    			FROM Orders o JOIN Order_items oi ON o.Order_id = oi.Order_id
 		GROUP BY Month
) t;

--2. Month-over-Month revenue growth
--Purpose:- Is revenue increasing or declining??
SELECT  Month, Revenue,
    	 Revenue - LAG(Revenue) OVER (ORDER BY Month) AS Growth
FROM ( SELECT  DATE_FORMAT(o.Order_date, '%Y-%m') AS Month,
        SUM(oi.Quantity * oi.Item_price) AS Revenue
    FROM Orders o JOIN Order_items oi ON o.Order_id = oi.Order_id
    GROUP BY Month
) t;

--3. Running total of revenue over time
--Purpose:- How revenue accumulates overtime??
SELECT  Month, Revenue,
   	 SUM(Revenue) OVER (ORDER BY Month) AS Cumulative_Revenue
FROM ( SELECT  DATE_FORMAT(o.Order_date, '%Y-%m') AS Month,
        SUM(oi.Quantity * oi.Item_price) AS Revenue
    FROM Orders o JOIN Order_items oi ON o.Order_id = oi.Order_id
    GROUP BY Month
) t;









