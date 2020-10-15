select department, count(employee_id)
from employees
where department in ('Sports','Tools','Clothing','Computers')
group by department;
---------------------Transpose this ----------------------------
select
sum(case when a.department='Sports' then 1 else 0 end) as Sports,
sum(case when a.department='Tools' then 1 else 0 end) as Sports,
sum(case when a.department='Clothing' then 1 else 0 end) as Sports,
sum(case when a.department='Computers' then 1 else 0 end) as Sports
from employees a
--------------------------------------------------------------------
select first_name,
case when region_id =1 then (select country from regions where region_id=1) else NULL end as region_id1,
case when region_id =2 then (select country from regions where region_id=2) else NULL end as region_id2,
case when region_id =3 then (select country from regions where region_id=3) else NULL end as region_id3,
case when region_id =4 then (select country from regions where region_id=4) else NULL end as region_id4,
case when region_id =5 then (select country from regions where region_id=5) else NULL end as region_id5,
case when region_id =6 then (select country from regions where region_id=6) else NULL end as region_id6,
case when region_id =7 then (select country from regions where region_id=7) else NULL end as region_id7
from  employees
-----------------------------------------------------------------------------------------

select count(region_id1) + count(region_id2) + count(region_id3) as US,
count(region_id4) + count(region_id5) as asia,
count(region_id6) + count(region_id7) as canada
from (
select first_name,
case when region_id =1 then (select country from regions where region_id=1) else NULL end as region_id1,
case when region_id =2 then (select country from regions where region_id=2) else NULL end as region_id2,
case when region_id =3 then (select country from regions where region_id=3) else NULL end as region_id3,
case when region_id =4 then (select country from regions where region_id=4) else NULL end as region_id4,
case when region_id =5 then (select country from regions where region_id=5) else NULL end as region_id5,
case when region_id =6 then (select country from regions where region_id=6) else NULL end as region_id6,
case when region_id =7 then (select country from regions where region_id=7) else NULL end as region_id7
from  employees) a

--- names of departtmens which habve more than 38 emp---
select e.department,
(select max(d.salary) from employees d where d.department = e.department)
from departments e
where e.department in (select department from employees group by department having count(*)> 38)
order by 2 asc








