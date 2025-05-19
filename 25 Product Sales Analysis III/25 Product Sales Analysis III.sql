WITH temp AS (
    SELECT 
		*,
		RANK() OVER (PARTITION BY product_id ORDER BY year) AS rn
    FROM sales
)

SELECT 
	product_id, 
	year AS first_year, 
	quantity, 
	price
FROM 
	temp
WHERE 
	rn = 1
