SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) 
		/ CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
		AS avg_pizzas_per_order
FROM DBO.pizza_sales