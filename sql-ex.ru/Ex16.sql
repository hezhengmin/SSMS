-- Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
-- Result set: model with the bigger number, model with the smaller number, speed, and RAM.

with 
CTE as
(
select speed,ram ,count(speed) as c
from pc
group by speed, ram
having count(*)>=2
),
A as
(
select pc.*
from pc, CTE
where pc.speed = CTE.speed and pc.ram = CTE.ram
),
B as
(
select A1.model as model_1, A2.model as model_2, A1.speed, A1.ram
from A A1, A A2
where A1.model != A2.model and A1.speed = A2.speed and A1.ram = A2.ram
group by A1.model, A2.model , A1.speed, A1.ram
)

select B.*
from B
where model_1>model_2

-- solve 2

select distinct A.model,B.model,A.speed,A.ram
from pc A, pc B
where A.model>B.model and A.speed=B.speed and A.ram=B.ram

