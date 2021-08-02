-- Find the makers of the cheapest color printers.
-- Result set: maker, price.


select distinct pro.maker, p.price
from printer p
join product pro on pro.model = p.model
where p.color = 'y' and  p.price =
(
select min(p.price) --p.color, pro.maker, p.price , p.type
from printer p
join product pro on pro.model = p.model
where p.color = 'y'
)
