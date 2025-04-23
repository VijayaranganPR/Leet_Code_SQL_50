select 
	FORMAT(trans_date, 'yyyy-MM') as month, 
	country,
	count(trans_date) as trans_count,
	count(case when state = 'approved' then 1 else null end) as approved_count,
	sum(amount) as trans_total_amount,
	sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from 
	transactions
group by 
	FORMAT(trans_date, 'yyyy-MM'), country
