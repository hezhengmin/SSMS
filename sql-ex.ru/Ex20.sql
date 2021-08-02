-- Find the makers producing at least three distinct models of PCs.
-- Result set: maker, number of PC models.

select maker,count(*)
from product
where type = 'PC' 
group by maker 
having count(*)>=3
