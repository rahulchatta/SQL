--people with same names and counts of the same.
select first_name,count(first_name)
from employees
group by first_name
having count(first_name) >1
order by 2 desc
--unqiue dept in employees , but cant use distinct keyword
select department
from employees
group by department
order by 1 asc;
--diff domain names, employees with that domain name

select substring(email,position('@' in email)+1), count(*)
from employees
where email is Not NULL
group by substring(email,position('@' in email)+1)
order by 2 asc
-- by region and gender show min, max and avg salary

select gender,region_id,round(avg(salary)),min(salary),max(salary)
from employees
group by gender,region_id
order by region_id,gender
