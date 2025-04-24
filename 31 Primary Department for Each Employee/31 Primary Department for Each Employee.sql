with filtered as (select 
	employee_id, 
	department_id,
	ROW_NUMBER () over (partition by employee_id order by primary_flag desc) as rn
from 
	Employee)

select 
	employee_id, 
	department_id 
from 
	filtered
where 
	rn = 1