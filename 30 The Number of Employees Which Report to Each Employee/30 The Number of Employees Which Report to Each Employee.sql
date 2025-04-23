select 
	f.employee_id,
	e.name,
	f.reports_count,
	f.average_age
from (
	SELECT 
		E1.reports_to as employee_id, 
		COUNT(E1.employee_id) as reports_count, 
		round(AVG(cast(E1.age as float)),0) as average_age 
	FROM 
		Employees E1
	GROUP BY 
		E1.reports_to
	HAVING 
		E1.reports_to IS NOT NULL) as f 
left join 
	Employees e
on 
	f.employee_id = e.employee_id
