-- Under the assumption that receipts of money (inc) and payouts (out) are registered 
-- not more than once a day for each collection point [i.e. the primary key consists of (point, date)], 
-- write a query displaying cash flow data (point, date, income, expense).
-- Use Income_o and Outcome_o tables.

-- 1.
select 
case when i.point is null then o.point else i.point end as point, 
case when i.date is null then o.date else i.date end as date, 
inc ,out
from income_o i
full join outcome_o o on o.date = i.date and o.point = i.point
order by i.point

-- 2.
select i.point,i.date,i.inc,o.out
from income_o i
left join outcome_o o on o.date = i.date and o.point = i.point
union 
select o.point,o.date,i.inc,o.out
from outcome_o o
left join income_o i on i.date = o.date and i.point = o.point
