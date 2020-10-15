-- Case statement used in group by
select data.category,count(*)
from (
select 
employee_id,
case
when salary <100000 then 'under'
when salary >100000 and salary < 150000 then 'well'
when salary >150000 then 'exec'
end as category
from employees
order by 2 asc ) data
group by data.category
order by count(*) desc
-------------------------------------------------
--Show above data as columns instead of rows
select 
sum(case when salary < 100000 then 1 else 0 end) as underpaid,
sum(case when salary >100000 and salary < 150000 then 1 else 0 end) as okpaid,
sum(case when salary > 150000 then 1 else 0 end) as executive
from employees
