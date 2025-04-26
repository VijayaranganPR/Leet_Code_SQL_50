select 
	employee_id 
from 
	Employees e2
where	
	salary < 30000 
	and manager_id not in (select employee_id from Employees)
order by employee_id