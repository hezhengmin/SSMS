-- For each maker producing laptops with a hard drive capacity of 10 Gb or higher, 
-- find the speed of such laptops. Result set: maker, speed.

select distinct p.maker,l.speed 
from laptop l 
join product p on l.model = p.model
where l.hd >=10