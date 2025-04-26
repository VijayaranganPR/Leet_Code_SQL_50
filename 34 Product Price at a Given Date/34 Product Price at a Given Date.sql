with distinct_Table as (
	select 
		distinct product_id as distinct_id 
	from 
		Products
),
Filtered_Table as (
	select 
		*,
		ROW_NUMBER () over (partition by product_id order by change_date desc) as rn 
	from 
		Products
	where 
		change_date <= '2019-08-16'
)

select 
	d.distinct_id product_id, 
	case when rn = 1 then f.new_price else 10 end as  price 
from 
	distinct_Table d
full join 
	Filtered_Table f
on 
	d.distinct_id = f.product_id
where 
	rn = 1 or rn is null
