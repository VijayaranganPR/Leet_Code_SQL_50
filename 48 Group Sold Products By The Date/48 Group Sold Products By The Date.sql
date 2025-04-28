select 
	t.sell_date, 
	count(product) as num_sold, 
	STRING_AGG(product, ',') within group (order by product) as products
from 
	(select 
		distinct sell_date, PRODUCT
	from 
		Activities) as t
group by 
	t.sell_date
order by
	t.sell_date