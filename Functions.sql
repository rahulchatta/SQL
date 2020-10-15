select distinct department
from employees
order by 1 asc
--limit 12 
--we can also rewrite as
fetch first 12 rows only;
============================

select Upper(first_name) || ' '|| Upper(last_name) as list_name , (salary > 140000)
from employees
order by 2 desc;
=====================================

select first_name, substring(first_name,2,5)
from 
employees;










