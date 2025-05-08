WITH avg_order_value AS (
	SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS average_order_value
	FROM dbo.pizza_sales
)
SELECT * FROM avg_order_value;