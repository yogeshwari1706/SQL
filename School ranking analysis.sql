
create table Students_table (
Student_id int primary key,
Student_first_name varchar(25) not null,
student_last_name varchar(25) not null,
Class int,
Age int
);

create table Marksheet_table(
Score int,
Year int,
Class int,
Ranking int, 
Student_id int
);

insert into sql_basics.students_table (Student_id, Student_first_name, student_last_name, Class, Age)
values 
(1,	"krishna",	"gee",	10,	18),
(2,	"Stephen", "christ", 10,	17),
(3,	"Kailash",	"kumar",	10,	18),
(4,	"ashish",	"jain",	10,	16),
(5,	"khusbu",	"jain",	10,	17),
(6,	"madhan",	"lal",	10,	16),
(7,	"saurab",	"kothari",	10,	15),
(8,	"vinesh",	"roy",	10,	14),
(9,	"rishika",	"r",	10,	15),
(10,	"sara",	"rayan", 10,	16),
(11,	"rosy", "kumar",	10,	16);

insert into sql_basics.marksheet_table (Score, Year, Class, Ranking, Student_id)
values
(989,	2014,	10,	1,	1),
(454,	2014,	10,	10,	2),
(880,	2014,	10,	4,	3),
(870, 2014,	10,	5,	4),
(720,	2014,	10,	7,	5),
(670,	2014,	10,	8,	6),
(900,	2014,	10,	3,	7),
(540, 2014,	10,	9,	8),
(801,	2014,	10,	6,	9),
(420,	2014,	10,	11,	10),
(970,	2014,	10,	2,	11),
(720,	2014,	10,	12,	12);

/* student id and student first name from the student table if the age is
 greater than or equal to 16 and the student's last name is Kumar */
select student_id, student_last_name  from sql_basics.students_table 
where Age >= 16 and student_last_name = "kumar";


-- details from the marksheet table if the score is between 800 and 1000:
select * from sql_basics.marksheet_table 
where score between 800 and 1000;

/* details from the marksheet table by adding 5 to the score 
and by naming the column as new score */
SELECT * ,score+5 as new_score FROM sql_basics.marksheet_table;

-- marksheet table in descending order of the score:
select * from sql_basics.marksheet_table 
order by score desc;

-- details of the students whose first name starts with a:
select * from students_table 
where Student_first_name like "a%";