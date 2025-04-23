SELECT 
	max(num) as num 
from (
	SELECT NUM, 
	COUNT(NUM) as num_count 
FROM 
	MyNumbers
GROUP BY 
	NUM
HAVING 
	COUNT(NUM) = 1) AS FILTERED
