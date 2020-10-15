--return employees from electornics division
--group couint
select department,count(*) from employees where department in (select department from departments where division='Electronics')
group by department
--return employees salary >130000 and region is asia , canadsa
select * 
from employees
where salary >130000
and region_id in (select region_id from regions where country in ('Asia','Canada'))
--firstname, depatrt, salary , diff of salrtmax from company, as ia canda
select emp.first_name, emp.salary,   (select max(salary) from employees) - emp.salary
from employees emp
where emp.region_id in (select region_id from regions where country in ('Asia', 'Canada'))

---------------------------------
create table dupes (id integer, name varchar(10));
insert into dupes values (1,'FRANK');
insert into dupes values (2,'FRANK');
insert into dupes values (3,'ROBERT');
insert into dupes values (4,'ROBERT');
insert into dupes values (5,'SAM');
insert into dupes values (6,'FRANK');
insert into dupes values (7,'PETER');
SELECT * FROM DUPES;
-------------------------
SELECT ID,NAME 
FROM DUPES
WHERE ID = ANY(SELECT MAX(ID) FROM DUPES GROUP BY NAME)
------------------------------------------------
--Removing duplicates
DELETE  FROM
DUPES WHERE ID NOT IN (
SELECT MAX(ID)
FROM DUPES 
GROUP BY NAME)
-----------------------------------------------------
--get avg slary by excluding highest paid amnd lowest paid

select round(avg(salary) )
from employees
where salary >  (select  min(salary) from employees)
and salary <  (select  max(salary) from employees)
-----------------
select round(avg(salary) )
from employees
where salary not in ( (select  min(salary) from employees),
                      (select  max(salary) from employees))











