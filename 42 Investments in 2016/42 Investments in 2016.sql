with 
	tiv_2015_table as (
		select 
			tiv_2015, 
			count(tiv_2015) as counted_tiv_2015 
		from 
			Insurance
		group by 
			tiv_2015
	),

	loc_table as (
		select 
			cast(lat as varchar(50)) + cast(lon as varchar(50)) as combined_loc,
			count(cast(lat as varchar(50)) + cast(lon as varchar(50))) as counted_loc
		from 
			Insurance
		group by 
			cast(lat as varchar(50)) + cast(lon as varchar(50))
	)

select 
	round(
		sum(i.tiv_2016)
	,2) as tiv_2016
from 
	Insurance i
left join 
	tiv_2015_table t
on 
	i.tiv_2015 = t.tiv_2015
left join 
	loc_table loc
on 
	cast(i.lat as varchar(50)) + cast(i.lon as varchar(50)) = loc.combined_loc
where 
	counted_tiv_2015 > 1 and counted_loc = 1
