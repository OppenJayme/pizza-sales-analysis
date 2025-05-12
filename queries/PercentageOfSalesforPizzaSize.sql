
SELECT pizza_size, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS total_contribution_percentage_wholeYear
FROM dbo.pizza_sales
GROUP BY pizza_size;
-- Query to find percentage of total sales of which size / how much each size contributes to total revenue.

WITH total_sales AS (
	SELECT pizza_size, SUM(total_price) AS size_total_earning
	FROM dbo.pizza_sales
	GROUP BY pizza_size
),
-- calculates total revenue per size
overall_total_sales AS (
	SELECT SUM(total_price) AS overall_earning
	FROM dbo.pizza_sales
)
-- calculates the total revenue across all sizes
SELECT pizza_size, size_total_earning, total_contribution_in_percentage
FROM (
	SELECT  
		ts.pizza_size, 
		ts.size_total_earning,
		ROUND(ts.size_total_earning * 100.0 / ots.overall_earning, 2) AS total_contribution_in_percentage,
		CASE ts.pizza_size
			WHEN 'S' THEN 1
			WHEN 'M' THEN 2
			WHEN 'L' THEN 3
			WHEN 'XL' THEN 4
			WHEN 'XXL' THEN 5
			ELSE 6
		END AS sort_order
	FROM total_sales ts
	CROSS JOIN overall_total_sales ots
) AS sorted_table
ORDER BY sort_order;
-- Query to find percentage of total sales of which size / how much each size contributes to total revenue ordered by pizza size.
-- Also subqueried to make the sort_order not be included in the final output. 


