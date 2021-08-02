-- Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
-- Result set: maker

select distinct product.maker
from pc 
join product on product.model = pc.model  
where pc.speed >= 750
intersect
select distinct product.maker
from laptop 
join product on product.model = laptop.model  
where laptop.speed >= 750
