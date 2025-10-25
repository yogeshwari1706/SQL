use employee;

/* Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, 
and make a list of employees and details of their department */

select emp_id, first_name, last_name, gender, dept from emp_record;

/* Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is:
less than two
greater than four
between two and four */

select emp_id, first_name, last_name, gender, dept, emp_rating from emp_record 
where emp_rating < 2;

select emp_id, first_name, last_name, gender, dept, emp_rating from emp_record 
where emp_rating > 4;

select emp_id, first_name, last_name, gender, dept, emp_rating from emp_record 
where emp_rating between 2 and 4;

/* Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department 
from the employee table and then give the resultant column alias as NAME */

select concat(first_name, ' ', last_name) as Name from emp_record 
where dept = 'finance';

-- Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters --

select count(EMP_ID), manager_id as REPORTERS from emp_record
GROUP BY MANAGER_ID
order by MANAGER_ID;

-- Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table --

SELECT * FROM employee.emp_record  WHERE DEPT = 'FINANCE'
UNION 
SELECT * FROM employee.emp_record WHERE DEPT = 'HEALTHCARE'
ORDER BY DEPT, EMP_ID;

/* Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE,
DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the
max emp rating for the department */

SELECT emp_id, first_name, last_name, role, dept, emp_rating, emp_rating AS max_rating
FROM emp_record
WHERE (dept, emp_rating)
IN (SELECT dept, MAX(emp_rating) FROM emp_record GROUP By dept)
ORDER BY dept ASC;

-- write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table --

SELECT role, MIN(salary) AS minSalary, MAX(salary) AS maxSalary
FROM emp_record
GROUP BY role;

-- Write a query to assign ranks to each employee based on their experience. Take data from the employee record table --

SELECT first_name, last_name, exp as experience,
DENSE_RANK() OVER (ORDER BY exp DESC) exp_rank
FROM emp_record;

/* Write a query to create a view that displays employees in various countries whose salary is more than six
thousand. Take data from the employee record table */

CREATE VIEW 6K_salary AS
SELECT emp_id, first_name, last_name, country, salary
FROM emp_record
WHERE salary > 6000;

SELECT * FROM 6k_salary;
 
-- Write a nested query to find employees with experience of more than ten years. Take data from the employee record table --

SELECT emp_id, first_name, last_name, exp
FROM emp_record
WHERE exp IN (
SELECT exp
FROM emp_record
WHERE exp > 10
);

/* Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is
‘Eric’ in the employee table after checking the execution plan. */

ALTER TABLE emp_record ADD INDEX firstname_index (first_name);

SELECT * FROM emp_record WHERE first_name = "Eric";

/* Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula:
5% of salary * employee rating). */

SELECT first_name, last_name, salary, ((salary * .05)*emp_rating) AS bonus
FROM emp_record;

/* Write a query to calculate the average salary distribution based on the continent and country. 
Take data from the employee record table */

-- Average salary based on the continent

SELECT continent, AVG(salary)
FROM emp_record
GROUP BY continent
ORDER BY continent ASC;

-- Average salary based on the country

SELECT country, AVG(salary)
FROM emp_record
GROUP BY country
ORDER BY country ASC;
