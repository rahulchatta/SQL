select * from (select e.department, e.first_name, e.salary,
Case
when e.salary = (select max(ch.salary) from employees ch where ch.department=e.department ) then 'max_salary'
when e.salary = (select min(ch.salary) from employees ch where ch.department=e.department ) then 'min_salary'
else 'range'
end as salary_indicator
from employees e
order by e.department ) a
where salary_indicator !='range'
-----------------------------------------

select a.department,a.first_name,a.salary,
Case
when salary = max_salary then 'high'
when salary = min_salary then 'low'
end
from (
select e.department, e.first_name, e.salary,
(select max(ch.salary) from employees ch where ch.department=e.department ) as max_salary
,(select min(ch.salary) from employees ch where ch.department=e.department ) as min_salary
from employees e
order by e.department ) a
where salary in (max_salary,min_salary)
-------------------------------------------------------------------------

select first_name, email,division
from employees, departments
where employees. department = departments.department
and email is NOT NULL
---------------------------

select r.country, count(employee_id)
from employees e, regions r
where e.region_id = r.region_id
group by r.country








