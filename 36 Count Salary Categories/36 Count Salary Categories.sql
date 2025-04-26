SELECT S.category, COUNT(C.account_id) AS accounts_count FROM (
	select 'Low Salary' as category
	union
	select 'Average Salary' as category
	union
	select 'High Salary' as category
) S
LEFT JOIN (

SELECT 
	*, 
	CASE 
		WHEN income < 20000 
			THEN 'Low Salary' 
		WHEN income <= 50000
			THEN 'Average Salary'
		ELSE
			'High Salary'
	END AS category
FROM Accounts) AS C
ON S.CATEGORY = C.CATEGORY
GROUP BY S.category
