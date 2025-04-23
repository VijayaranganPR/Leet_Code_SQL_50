select 
	query_name, 
	round(
		sum(cast(rating as float)/position)/count(rating)
	,2) as quality,
	round(
		count(case when rating < 3 then rating else null end)
		/cast(count(rating) as float) * 100
	, 2) as poor_query_percentage
from 
	queries
group by 
	query_name
