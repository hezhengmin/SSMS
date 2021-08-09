--每科最高分，Rank更新排行為"第一"
update S
set S.Ranking = '第一'
from Student S ,
(
select Subject, Max(Score) as HScore
from Student
group by Subject 
) T
where T.HScore = S.Score and T.Subject = S.Subject
