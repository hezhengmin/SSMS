-- Find out the average price of PCs and laptops produced by maker A.
-- Result set: one overall average price for all items.

-- 1.
select avg(price) as AVG_price
from
(
select price,type
from product pro 
join pc on pc.model = pro.model
where pro.maker ='A'
union all
select price,type
from laptop l
join product pro on pro.model = l.model
where pro.maker ='A'
) as t

-- 2.
select avg(case when pc.price is not null then pc.price else l.price end)
from product pro
full join pc on pc.model = pro.model
full join laptop l on l.model = pro.model
where pro.maker ='A' and type !='printer'