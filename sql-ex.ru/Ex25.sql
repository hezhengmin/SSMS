-- Find the printer makers also producing PCs with the lowest RAM capacity 
-- and the highest processor speed of all PCs having the lowest RAM capacity.
-- Result set: maker.

--1.
select distinct maker
from product
where type ='printer' and maker in (
    select maker 
    from product
    where model in (
        select model
        from pc 
        where speed = (
            select max(speed)
            from pc
            where ram = (select min(ram) from pc )
        )
        and ram = (select min(ram) from pc ) 
    )
)

--2.
select distinct maker
from pc 
join product on pc.model = product.model
where speed = (
 select max(speed)
 from (select speed 
       from pc
       where ram = (select min(ram) from pc)) as z
)
and ram = (select min(ram) from pc)
and product.maker in (select distinct maker from product where type ='printer')

