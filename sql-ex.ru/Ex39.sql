-- Find the ships that `survived for future battles`; that is, after being damaged in a battle, 
-- they participated in another one, which occurred later.

--solve1
select distinct o1.ship from outcomes o1
join battles b1 on b1.name = o1.battle 
where exists
(select o2.*,b2.[date] from outcomes o2
join battles b2 on b2.name = o2.battle 
where o1.ship = o2.ship and  b1.[date] > b2.[date] 
and o2.result ='damaged' )
--solve2
select distinct a.ship
from (
select o1.ship,o1.result,b1.[date] from outcomes o1
join battles b1 on b1.name = o1.battle 
) a
join (
select o2.ship,o2.result,b2.[date] from outcomes o2
join battles b2 on b2.name = o2.battle 
) b
on a.ship = b.ship
where a.[date] > b.[date] and b.result = 'damaged'