-- Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.

select p.maker
from product p
join pc on pc.model = p.model
where pc.speed >=450
group by p.maker