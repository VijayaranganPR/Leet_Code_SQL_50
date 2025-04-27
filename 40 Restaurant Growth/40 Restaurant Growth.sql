with 
	sum_table as(
	select 
		visited_on,
		sum(amount) as day_total 
	from 
		Customer
	group by 
		visited_on),

	moving as (
	select 
		a.visited_on,
		sum(b.day_total) as amount,
		round(sum(cast(b.day_total as float)/7), 2) as average_amount
	from sum_table a
	join 
		sum_table b
	on 
		b.visited_on between DATEADD(day, -6, a.visited_on) and a.visited_on
	group by 
		a.visited_on
	)

select 
	* 
from 
	moving
where visited_on >  DATEADD(day, 5, (select min(visited_on) from Customer) )
