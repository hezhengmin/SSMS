-- Find out the average speed of the PCs produced by maker A.

select avg(pc.speed) 
from pc
join product pro on pro.model = pc.model
where pro.maker = 'A'
