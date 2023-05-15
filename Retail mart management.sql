create database SQL_basics;

select database ();

create table Product_table(
Product_code int, 
Product_name varchar(15),
price int,
stock int,
category varchar(15)
 );
 desc Product_table;
 
 create table Customer_table(
 Customer_id int,
  Customer_name varchar(25),
   Customer_location varchar(15),
    Customer_phone_number int
 );
desc Customer_table;

create table Sales_table(
Order_date date,
Order_number char(10),
Product_code int,
Product_name varchar(25),
Quantity varchar(25),
Price float
);

desc sales_table;

INSERT INTO
sql_basics.Product_table (Product_code, Product_name, Price, Stock, Category)
VALUES
(1,	"tulip", 198,  5, "perfume"),
(2,	"cornoto",	50,	21,	"icecream"),
(3,	"Pen",	10,	52,	"Stationary"),
(4,	"Lays",	10,	20,	"snacks"),
(5,	"mayanoise",	90,	10,	"dip"),
(6,	"jam",	105,	10,	"spread"),
(7,	"shampoo",	5,	90,	"hair product"),
(8,	"axe",	210,	4,	"perfume"),
(9,	"park avenue",	901,	2,	"perfume"),
(10, "wattagirl",	201,	3,	"perfume"),
(11,	"pencil",	4,	10,	"Stationary"),
(12,	"sharpener",	5,	90,	"Stationary"),
(13,	"sketch pen",	30,	10,	"Stationary"),
(14,	"tape",	15,	30,	"Stationary"),
(15,	"paint",	60, 12,	"Stationary"),
(16,	"chocolate",	25,	50,	"snacks"),
(17,	"biscuts",	60,	26,	"snacks"),
(18,	"mango",	100,	21,	"fruits"),
(19, "apple",	120,	9,	"fruits"),
(20,	"kiwi",	140,	4,	"fruits"),
(21,	"carrot",	35,	12, "vegetable"),
(22,	"onion",	22,	38,	"vegetable"),
(23,	"tomato",	21,	15,	"vegetable"),
(24,	"serum",	90,	4,	"hair product"),
(25, "conditioner",	200,	5,	"hair product"),
(26,	"oil bottle",	40,	2,	"kitchen utensil");

INSERT INTO
sql_basics.customer_table (Customer_id, Customer_name, Customer_location, Customer_phone_number)
VALUES
(1111,	"Nisha",	"kerala",	8392320),
(1212,	"Oliver",	"kerala",	4353891),
(1216,	"Nila",	"delhi",	3323242),
(1246,	"Vignesh",	"chennai",	1111212),
(1313,	"shiny",	"Maharastra",	5454543),
(1910,	"Mohan",	"mumbai",	9023941),
(2123,	"Biyush",	"Bombay",	1253358),
(3452,	"Alexander",	"West Bengal", 1212134),
(3921,	"Mukesh",	"Manipur",	4232321),
(5334,	"Christy",	"pakistan",	2311111),
(9021,	"Rithika",	"Kashmir",	1121344),
(9212,	"Jessica",	"banglore",	1233435),
(9875,	"Stephen",	"chennai",	1212133);

INSERT INTO
sql_basics.Sales_table (Order_date, Order_number, Product_code, Product_name, Quantity, Price)
VALUES
("2016-07-24", "HM06",    11,	"pencil",	3,	30),
("2016-10-19", "HM09",	17,	"biscuits",	10,	600),
("2016-10-30", "HM10",	2,	"cornoto",	10,	500),
("2018-04-12", "HM03",	20,	"kiwi",	3,	420),
("2018-05-02", "HM05",	20,	"kiwi",	2,	280),
("2018-09-20", "HM08",	16,	"chocolate",	2,	50),
("2019-01-11", "HM07",	19,	"apple",	5,	600),
("2019-03-15", "HM01",	5,	"mayanoise",	4,	360),
("2021-02-10", "HM04",	25,	"conditioner",	5,	1000),
("2021-02-12", "HM02",	3,	"Pen",	2,	20);


/* add two new columns such as S_no and 
categories to the sales table */
ALTER TABLE sql_basics.sales_table
ADD S_No int,
add Categories varchar(25);

-- change the column type of stock in the product table to varchar:
ALTER TABLE sql_basics.product_table
MODIFY Stock varchar(25) not null;

-- change the table name from customer-to-customer details:
ALTER TABLE customer_table
RENAME TO Customer_details;

ALTER TABLE sales_table
CHANGE COLUMN Price AMOUNT INT;


-- drop the columns S_no and categories from the sales table:
ALTER TABLE sales_table
DROP column S_No,
DROP COLUMN Categories;

desc sales_table;

select * FROM sales_table;

SELECT * FROM product_table
WHERE CATEGORY = "STATIONARY";

-- unique category from the product table:
SELECT DISTINCT CATEGORY 
FROM product_table; 

SELECT DISTINCT CATEGORY 
FROM product_table
ORDER BY CATEGORY; 

/* sales details if quantity is greater than 2 and 
price is lesser than 500 from the sales table */

SELECT * FROM sales_table
WHERE Quantity = "> 2" and Amount = "< 500";


-- customer’s name if the name ends with a:
select * from customer_details
where Customer_name like "%a";

-- product details in descending order of the price:
select * from product_table
order by price desc;


-- product code and category from similar categories that are greater than or equal to 2:
SELECT Product_code, category FROM sql_basics.product_table GROUP BY category HAVING 
count(category)>=2;