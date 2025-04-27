with requestTable as (select requester_id as id, count(requester_id) as counted from RequestAccepted
group by requester_id
),
acceptTable as (
select accepter_id as id, count(accepter_id) as counted from RequestAccepted
group by accepter_id
)
select top 1 id, sum(counted) num from (
select * from requestTable 
union all
select * from acceptTable) as t
group by id
order by num desc
