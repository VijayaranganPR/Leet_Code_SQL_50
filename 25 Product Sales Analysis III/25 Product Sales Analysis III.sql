WITH FIRST_YEAR AS (
	SELECT 
		*, 
		(ROW_NUMBER() OVER(PARTITION BY PRODUCT_ID ORDER BY YEAR)) AS RN
	FROM 
		SALES
)

SELECT 
	F.product_id, 
	F.year AS first_year,
	s.quantity,
	s.price 
FROM 
	FIRST_YEAR F
JOIN 
	SALES S
ON 
	S.product_id = F.product_id 
	AND S.YEAR = F.YEAR
WHERE 
	RN = 1