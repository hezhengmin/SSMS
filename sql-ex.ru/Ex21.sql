-- Find out the maximum PC price for each maker having models in the PC table. 
-- Result set: maker, maximum price.

select pro.maker,max(pc.price)
from product pro
join pc on pc.model = pro.model
where pro.type = 'PC' 
group by pro.maker

--solve2
with cte
as
(
select pro.maker,pc.price
from product pro
join pc on pro.model = pc.model 
)

select maker,max(price)
from cte
group by maker
