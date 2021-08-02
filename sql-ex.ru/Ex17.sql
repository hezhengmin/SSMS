-- Get the laptop models that have a speed smaller than the speed of any PC.
-- Result set: type, model, speed.

select distinct pro.type, l.model, l.speed
from laptop l
join product pro on pro.model = l.model  
where l.speed < all(
select speed from pc
)