-- Under the assumption that receipts of money (inc) and payouts (out) can be registered any number 
-- of times a day for each collection point [i.e. the code column is the primary key]
-- , display a table with one corresponding row for each operating date of each collection point.
-- Result set: point, date, total payout per day (out), total money intake per day (inc).
-- Missing values are considered to be NULL.

-- 1.
select i.point, i.date, o.out, i.inc
from (
select i.point,i.date ,sum(i.inc) as inc
from income i
group by i.point,i.date
) i
left join (
select o.point,o.date ,sum(o.out) as out
from outcome o
group by o.point,o.date
) o on o.point = i.point and o.date = i.date
union
select o.point, o.date, o.out, i.inc
from (
select o.point,o.date ,sum(o.out) as out
from outcome o
group by o.point,o.date
) o
left join (
select i.point,i.date ,sum(i.inc) as inc
from income i
group by i.point,i.date
) i on i.point = o.point and i.date = o.date

-- 2.
select point,date,sum(out),sum(inc)
from (
select point ,date ,out = null,inc
from income
union all
select point ,date ,out ,inc = null
from outcome
) t
group by point,date

