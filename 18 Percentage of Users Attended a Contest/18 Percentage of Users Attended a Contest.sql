DECLARE @total_students INT

select 
	@total_students = count(user_id) 
from 
	users 

select
	contest_id, 
	round (
	cast(count(user_id) as float)/@total_students*100
	, 2) as percentage
from 
	register
group by
	contest_id
order by 
	percentage desc,
	contest_id asc