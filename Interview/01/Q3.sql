--�C��̰����ARank��s�Ʀ欰"�Ĥ@"
update S
set S.Ranking = '�Ĥ@'
from Student S ,
(
select Subject, Max(Score) as HScore
from Student
group by Subject 
) T
where T.HScore = S.Score and T.Subject = S.Subject
