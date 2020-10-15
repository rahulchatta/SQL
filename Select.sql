--Select Exercises
-- NUll is not an comaparable value as in field=NULL or NUll=NULL will not work.
--Always use IS NUll or IS NOT NULL
SELECT FIRST_NAME,
EMAIL
FROM EMPLOYEES
WHERE GENDER = 'F'
AND DEPARTMENT = 'Tools'
AND SALARY > 110000;


SELECT FIRST_NAME,
HIRE_DATE
FROM EMPLOYEES
WHERE (GENDER = 'M'
			AND DEPARTMENT = 'Sports')
OR SALARY > 165000;


SELECT FIRST_NAME,
HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2002-01-01' AND '2004-01-01';


SELECT *
FROM EMPLOYEES
WHERE (GENDER = 'M'
			AND DEPARTMENT = 'Automotive'
			AND SALARY BETWEEN 40000 AND 100000)
OR (GENDER = 'F'
				AND DEPARTMENT = 'Toys');
