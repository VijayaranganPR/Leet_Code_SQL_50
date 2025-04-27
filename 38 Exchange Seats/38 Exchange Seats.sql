with 
odd_to_even as (select id + 1 id, student from seat
where id % 2 = 1),
event_to_odd as (
select id - 1 id, student from seat
where id % 2 = 0)

select
	ROW_NUMBER() over(order by id) as id,
	student	
from (
	select * from odd_to_even
	union 
	select * from event_to_odd
) as combined
