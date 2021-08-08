-- Find out the average hard disk drive capacity of PCs produced by makers who also manufacture printers.
-- Result set: maker, average HDD capacity.

select pro.maker,avg(pc.hd) 
from pc
join product pro on pro.model = pc.model
where pro.maker in (  
select maker 
from product 
where type = 'printer'
)
group by pro.maker