create table Patients_table (
date date,
patient_id char(10),
patient_name varchar(25),
age int,
weight int,
gender varchar(10),
location varchar(25),
phone_number int,
disease varchar(20),
doctor_name varchar(25),
doctor_id int
);

insert into patients_table (date, patient_id, patient_name, age, weight, gender, location, phone_number, disease, doctor_name, doctor_id)
values 
("2019-06-15",	"AP2021",	"Sarath",	67,	76,	"Male",	"chennai",	5462829,	"Cardiac",	"Mohan",	21),
("2019-02-13",	"AP2022",	"John",	62,	80,	"Male",	"banglore",	1234731,	"Cancer",	"Suraj",	22),
("2018-01-08",	"AP2023",	"Henry",	43,	65,	"Male",	"Kerala",	9028320,	"Liver",	"Mehta",	23),
("2020-02-04",	"AP2024",	"Carl",	56,	72,	"Female",	"Mumbai",	9293829,	"Asthma",	"Karthik",	24),
("2017-09-15",	"AP2025",	"Shikar",	55,	71,	"Male",	"Delhi",	7821281,	"Cardiac",	"Mohan",	21),
("2018-07-22",	"AP2026",	"Piysuh",	47,	59,	"Male",	"Haryana",	8912819,	"Cancer",	"Suraj",	22),
("2017-03-25",	"AP2027",	"Stephen",	69,	55,	"Male",	"Gujarat",	8888211,	"Liver",	"Mehta",	23),
("2019-04-22",	"AP2028",	"Aaron",	75,	53,	"Male",	"Banglore",	9012192,	"Asthma",	"Karthik",	24);

-- total number of patients:
select count(*) as total_patients from patients_table;

-- patient id, patient name, gender, and disease of the patient whose age is maximum:
select patient_id, patient_name, gender, disease, max(age) as max_age from patients_table;

select max(age) as max_age from patients_table;

-- patient id and patient name with the current date:
select patient_id, patient_name, now() as present_date from patients_table;


--  old patient’s name and new patient's name in uppercase:
select patient_name, ucase(patient_name) as patient_name_upper from patients_table;


--  patient’s name along with the length of their name:
select patient_name, length(patient_name) as patient_name_char from patients_table;

-- patient’s name, and the gender of the patient must be mentioned as M or F:
select patient_name, mid(gender,1,1) as patient_gender from patients_table;


-- combine the names of the patient and the doctor in a new column:
select patient_name, doctor_name, concat(patient_name, '  ', doctor_name) as patient_doctor from patients_table;


-- patients’ age along with the logarithmic value (base 10) of their age:
select age, log10(age) as log_age from patients_table;

-- extract the year from the given date in a separate column:
select * , year(date) as year_column from patients_table;


/* return NULL if the patient’s name and doctor’s name 
are similar else return the patient’s name */
select nullif(patient_name, doctor_name) from patients_table;


-- return Yes if the patient’s age is greater than 40 else return No:
select age, if(age > 40, "yes", "no") as new_col from patients_table;

-- display the doctor’s duplicate name from the table:
select doctor_name, count(*) as doctor_count from patients_table group by doctor_name having count(*)>1;