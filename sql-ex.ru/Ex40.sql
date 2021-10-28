-- Get the makers who produce only one product type and more than one model. Output: maker, type.

--solve1
select p.maker,p.type
from product p
join(
select maker
,count(distinct type) as 'type_cnt'
,count(distinct model) as 'model_cnt'
from product 
group by maker
having count(distinct type) =1 and count(distinct model)>=2
) p2 
on p.maker = p2.maker
group by p.maker,p.type

--solve2
select distinct p.maker,p.type
from product p
join(
select maker
,count(distinct type) as 'type_cnt'
,count(distinct model) as 'model_cnt'
from product 
group by maker
having count(distinct type) =1 and count(distinct model)>=2
) p2 
on p.maker = p2.maker
