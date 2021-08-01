-- Find the makers producing PCs but not laptops.

select maker
from product 
group by maker
having sum(case when type = 'pc' then 1 else 0 end) > 0
and sum(case when type = 'laptop' then 1 else 0 end) = 0


select distinct maker
from product 
where maker not in
(
select distinct maker
from product
where type = 'laptop'
) and type = 'pc'


select maker from product where type = 'pc'
except
select maker from product where type = 'laptop'

