-- ALL or ANY example
select * from employees where region_id > ANY (select region_id from regions where country='United States')
select * from employees where region_id > ALL (select region_id from regions where country='United States')
---
select * 
from employees
where department in (select department from departments where division ='Kids')
and hire_date > All (select hire_date
from employees
where department ='Maintenance')
--------------------------------------------

select  salary, count(salary)
from employees
group by salary
having count(salary) >1
order by salary desc
------------------------------
select salary 
from employees
group by salary
having count(*) >= All (select count(*) from employees group by salary)
order by salary desc
limit 1










