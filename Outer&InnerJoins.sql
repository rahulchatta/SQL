--Outer Joins---
Select distinct department from employees; --27
Select distinct department from departments; --24
-------------------------------------
--dept in both tables
select distinct e.department, d.department
from employees e inner join departments d on e.department=d.department --23
--------------------------------------------------
--all dept in employee tables + matching 
select distinct e.department, d.department
from employees e left join departments d on e.department=d.department -- camping,security,maintenance
-- all dept in dept table + matychging
select distinct e.department, d.department
from employees e right join departments d on e.department=d.department --camping and fishing
-----get all from all
select distinct e.department, d.department
from employees e full outer join departments d on e.department=d.department 
----------------------------------------
--Unions --Think of this as stacking data on top of another
--UNION gives a unique stack
--UNION ALL gives a stack which conatains data from both queries
--Columns must match
select distinct department
from employees
UNION
select department
from departments ;
select distinct department
from employees
UNION ALL
select department
from departments  -- gives 51 results ;
=============================================================
--UNION cares about only the number and type of columns
--eg
select distinct department, first_name
from employees
union
select department, division
from departments
===============================================================
--INTERSECTION gives us common items in both

select distinct department
from employees
INTERSECT
SELECT DEPARTMENT
FROM DEPARTMENTS
--SAME AS KEY BASED JOIN;

---EXCEPT OR MINUS
--give data from 1 not found in 2nd set
select distinct department
from employees
except
select department
from departments
==================================

select department, count(*)
from employees
group by department
union all
select 'Total', count(*)
from employees
========================================
select count (*) from (select * from 
employees, departments)a
===============================
--CROSS JOIN
select * from employees cross join departments
=========================================================

select first_name,hire_date,department,country
from employees, regions
where hire_date in  (select max(hire_date) from employees
					 union
					 select min(hire_date) from employees)
					 and employees.region_id = regions.region_id
==========================================================================
select e.hire_date, e.salary, (select sum(e2.salary) from employees e2 where e2.hire_date between e.hire_date -90 
							   and e.hire_date ) as pattern
from employees e
order by e.hire_date  asc








