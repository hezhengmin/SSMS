--�d�ߥX�C���ҳ��j��80�����ǥͩm�W
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
