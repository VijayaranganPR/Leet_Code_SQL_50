select e.name from employee e
join 
(select managerID,count(id) as counted from employee 
group by managerId
having count(id) >= 5) as m
on e.id = m.managerId