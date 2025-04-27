select 
	user_id, 
	upper(substring(name, 1,1)) + lower(SUBSTRING(name, 2, 100)) as name 
from 
	users
order by
	user_id