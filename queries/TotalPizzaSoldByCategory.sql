WITH total_pizza_sold AS (
	SELECT pizza_category, SUM(quantity) AS count_sales
	FROM dbo.pizza_sales
	GROUP BY pizza_category
)

SELECT ts.*
from total_pizza_sold ts
ORDER BY ts.count_sales DESC;
--classic contains the most sales for the whole year.