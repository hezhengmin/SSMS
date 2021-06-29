--每科分數最高分的姓名
select S.*
from Student S,
(
	select Subject, Max(Score) as HScore
	from Student
	group by Subject
) T
where T.HScore = S.Score and T.Subject = S.Subject

