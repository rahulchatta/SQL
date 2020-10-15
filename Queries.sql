select first_name, salary * 5/100+salary from employees;
select * from employees where first_name like 'A%';
select count(*) from employees where department='Toys';
--2nd Highest Salary
select * from employees
where salary = (select max(salary) from employees where salary < (select max(salary) from employees) );
select  max(salary)
from employees where salary < (select max(salary) from employees);
-- 2nd Highest Salary------------------------------
select * from (select employee_id, salary
from employees 
order by salary desc 
limit 2) a
order by salary asc limit 1 ;
-----------------------------------------------------
select * 
from employees inner join departments on employees.department=departments.department
inner join regions on departments.region_id =regions.region_id
-------------------------------------------------------------------------------------












