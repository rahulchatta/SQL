--How its read  [Aggregate Function] OVER ([partition by] column)
-- over without partition gives data for all rows
select first_name,department,count(*) OVER()
from employees;
select first_name,department,count(*) OVER (partition by department)
from employees
----------------------simialarly--------------------------------
select first_name,department,round(avg(salary) OVER(partition by department)), sum(salary) OVER(partition by department)
from employees
-----------------------------------------------------
select first_name,department,region_id,count(*) OVER(partition by department,region_id)
from employees
-----------------------------------------------------
--RUNNING TOTALS----
--Bear in mind that you need a order of data on which running total needs to be compiled
--In this example we order by hire_date and sum accordingly
-- [agg] OVER [ORDER BY [column] RANGE BETWEEN UNBOUNDED PRECEDING ROW AND CURRENT ROW] --ACTUAL SYNTAX

select first_name, hire_date,salary, sum(salary) OVER(order by hire_date) as total
from employees;
select first_name, hire_date,salary,department, sum(salary) OVER(partition by department order by hire_date) as total
from employees;
select first_name, hire_date,salary, sum(salary) OVER (order by employee_id)
from employees;
--SUM PREVIOUS ROW AND CURRENT ROW
--ROWS FOLLOWING 
select first_name, hire_date,salary, sum(salary) OVER (order by HIRE_DATE ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
from employees;



