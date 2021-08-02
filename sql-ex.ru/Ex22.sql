-- For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
-- Result set: speed, average price.

select speed ,avg(price)
from pc
group by speed
having speed > 600
