create database crime;

create table crime.crime_data (
case_number varchar(20) not null,
crime_category varchar(50) not null,
crime_description varchar(60),
crime_location varchar(50) not null,
arrest_status varchar (10) not null,
primary key (crime_description, crime_location)
); 

SELECT * FROM crime.crime_data;

select * from crime.crime_data where crime_description = "over $500";

select count(distinct crime_description) from crime_data where crime_description = "over $500";

select distinct crime_category from crime_data order by crime_category;

select count(distinct crime_category) from crime_data order by crime_category;

SELECT COUNT(*) AS "Number of Cases" , crime_category
FROM crime_data
GROUP BY crime_category
ORDER BY "Number of Cases" DESC ;


SELECT COUNT(*) AS "Number of Cases" , crime_category
FROM crime_data
GROUP BY crime_category
ORDER BY "Number of Cases" DESC;

SELECT * FROM (SELECT *,
ROW_NUMBER() OVER (PARTITION BY case_number ORDER BY case_number) AS rn
    FROM crime_data) t
WHERE rn = 1;


