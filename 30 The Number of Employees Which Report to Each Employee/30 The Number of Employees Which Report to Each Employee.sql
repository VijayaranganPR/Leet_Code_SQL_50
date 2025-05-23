﻿SELECT 
	E2.EMPLOYEE_ID, 
	E2.NAME, 
	COUNT(E1.NAME) AS reports_count, 
	ROUND(SUM(E1.AGE*1.0)/COUNT(E2.NAME),0) AS average_age 
FROM 
	EMPLOYEES E1
JOIN 
	EMPLOYEES E2
ON 
	E1.REPORTS_TO = E2.EMPLOYEE_ID
GROUP BY 
	E2.EMPLOYEE_ID, 
	E2.NAME
ORDER BY 
	E2.EMPLOYEE_ID