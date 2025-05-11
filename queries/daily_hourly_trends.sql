SELECT *
FROM DBO.pizza_sales

--DAILY TREND 
SELECT order_day, total_orders
FROM (
	SELECT 
		DATENAME(WEEKDAY, order_date) AS order_day,
		COUNT(DISTINCT order_id) AS total_orders,
		CASE DATENAME(WEEKDAY, order_date)
			WHEN 'Monday' THEN 1
			WHEN 'Tuesday' THEN 2
			WHEN 'Wednesday' THEN 3
			WHEN 'Thursday' THEN 4
			WHEN 'Friday' THEN 5
			WHEN 'Saturday' THEN 6
			WHEN 'Sunday' THEN 7
		END AS weekday_number
	FROM dbo.pizza_sales
	GROUP BY DATENAME(WEEKDAY, order_date)
) AS temp
ORDER BY weekday_number;
-- used a subquery to not show the weekday_number in the final output
-- Made a CASE WHEN expression so it can be used in the order by clause. The reason for this use is because the output of DATENAME is a weekday name and using order by will Order alphabetically


--Hourly trend	
WITH HourDay AS (
	SELECT DATENAME(HOUR, order_time) AS time_of_hour, order_id
	FROM dbo.pizza_sales
)

SELECT time_of_hour, COUNT(DISTINCT order_id) AS total_orders_hourly
FROM HourDay
GROUP BY time_of_hour
ORDER BY CAST(time_of_hour AS INT) DESC
--casted as INT because there is a problem when DESC it stays at the top.