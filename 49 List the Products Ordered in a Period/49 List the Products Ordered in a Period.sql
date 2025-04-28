SELECT 
	p.product_name, 
	sum(o.unit) unit 
FROM
	Orders o
left join 
	products p
on
	o.product_id = p.product_id
WHERE 
	O.order_date like '2020-02%' 
group by 
	p.product_name
HAVING 
	SUM(O.unit) >= 100 