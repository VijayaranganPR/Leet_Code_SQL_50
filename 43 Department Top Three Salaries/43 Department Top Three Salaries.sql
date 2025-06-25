WITH temp AS (
	SELECT 
		*,
		DENSE_RANK() OVER (PARTITION BY departmentid ORDER BY salary DESC) AS RANKING
	FROM
		Employee
)

SELECT 
	d.name AS Department,
	t.name AS Employee,
	t.salary 
FROM
	temp t
LEFT JOIN
	Department d
ON 
	t.departmentId = d.id
WHERE
	t.RANKING <= 3
