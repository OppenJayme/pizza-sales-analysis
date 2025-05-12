SELECT TOP 10 *
FROM dbo.pizza_sales


SELECT DISTINCT pizza_category
from dbo.pizza_sales
-- Query to check all pizza categories

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)
FROM dbo.pizza_sales
GROUP BY pizza_category;
-- Query to find percentage of total sales of which category / how much each category contributes to total revenue.

WITH total_sales AS (
	SELECT pizza_category, SUM(total_price) AS category_total
	FROM dbo.pizza_sales
	WHERE MONTH(order_date) = 2
	GROUP BY pizza_category
),
overall_total_sales AS (
	SELECT SUM(total_price) AS overall
	FROM dbo.pizza_sales
	WHERE MONTH(order_date) = 2
)

SELECT DISTINCT ts.pizza_category, ts.category_total,
		ts.category_total * 100 / ots.overall AS total_contribution_in_percentage
FROM total_sales ts, overall_total_sales ots, pizza_sales
-- Query to find percentage of total sales of which category / how much each category contributes to total revenue in A month (change the MONTH(order_date) to a specified number of month


