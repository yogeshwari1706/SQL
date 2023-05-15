create table employee_table(
employee_id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
job_id char(10) not null,
salary int not null, 
manager_id int not null,
department_id int not null
);

insert into employee_table (employee_id, first_name, last_name, job_id, salary, manager_id, department_id)
values
(101,	"ankit",	"jain",	"HP124",	200000,	2,	24),
(102,	"sarvesh", "patel",	"HP123",	150000,	2,	24),
(103,	"krishna",	"gee",	"HP125",	500000,	5,	44),
(104,	"rana",	"gee",	"HP122",	250000,	3,	54),
(105,	"soniya",	"jain",	"HP121",	400000,	1,	22),
(106,	"nithin",	"kumar",	"HP120",	300000, 4,	34),
(107,	"karan",	"patel",	"HP126",	300001,	2,	34),
(108,	"shilpa",	"jain",	"HP127",	300001,	5,	24),
(109,	"mukesh",	"singh",	"HP128",	300001,	4,	44);


/* first name and salary of the employee whose salary is higher than the 
employee with the last name Kumar from the employee table */ 
select first_name, salary from employee_table where salary > (SELECT salary FROM 
employee_table WHERE last_name = 'kumar');


/*  employee id and last name of the employee whose salary
 is greater than the average salary from the employee table */
select employee_id, last_name from employee_table where salary > (select avg(salary) from employee_table);


/*  employee id, first name, and salary of the employees who earn a salary 
that is higher than the salary of all the shipping clerks (JOB_ID = HP122). 
Sort the results of the salary in ascending order */
select employee_id, first_name, salary from employee_table WHERE salary > (SELECT 
salary FROM employee_table WHERE job_id = 'HP122') ORDER BY salary;


-- first name, employee id, and salary of the first three employees with highest salaries:
SELECT DISTINCT employee_id ,first_name,salary FROM employee_table a WHERE 3>= 
(SELECT COUNT(DISTINCT salary) FROM employee_table b WHERE b.salary >= 
a.salary) ORDER BY a.salary DESC;