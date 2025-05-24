SELECT 
	MAX(num) AS num 
from (
	SELECT NUM, 
	COUNT(NUM) AS num_count 
FROM 
	MyNumbers
GROUP BY 
	NUM
HAVING 
	COUNT(NUM) = 1) AS FILTERED
