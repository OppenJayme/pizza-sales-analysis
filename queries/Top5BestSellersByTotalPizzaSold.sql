SELECT *
FROM DBO.pizza_sales

-- All pizza's query, contains 32 Pizza's
SELECT DISTINCT pizza_name
FROM dbo.pizza_sales


-- Top 5 best sellers by total pizza Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold DESC;

-- Bottom 5  Worst Sellers
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold ASC