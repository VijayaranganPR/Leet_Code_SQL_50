select 
	p.product_id, 
	isnull (
	Round (
		1.0 * sum(case when u.purchase_date between p.start_date and p.end_date then p.price*u.units else 0 end)
		/ nullif(sum(case when u.purchase_date between p.start_date and p.end_date then u.units else 0 end),0)
	,2)
	, 0)as average_price
from 
	prices p
left join 
	UnitsSold u
on 
	p.product_id = u.product_id
group by 
	p.product_id
