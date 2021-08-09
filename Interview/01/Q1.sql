--查詢出每門課都大於80分的學生姓名
select distinct Name
from Student 
where Name 
not in(
	select distinct Name
	from Student
	where Score <=80
)

select Name
from Student 
group by Name
having min(Score) >=80
