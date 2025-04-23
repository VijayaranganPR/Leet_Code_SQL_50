select 
	p.project_id, 
	round(
		AVG(1.0 * experience_years)
	, 2) as average_years
from 
	Project p
join 
	Employee e
on 
	p.employee_id = e.employee_id
group by 
	project_id
