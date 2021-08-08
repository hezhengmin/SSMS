-- Using Product table, find out the number of makers who produce only one model.

select count(distinct t.maker)
from 
(
select maker,count(maker) as maker_cnt
from product
group by maker
having count(maker) = 1
) t
