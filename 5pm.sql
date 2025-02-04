CREATE TABLE customers(
c_id INT NOT NULL,
c_name VARCHAR(32) UNIQUE ,
email VARCHAR(50) NOT NULL ,
mobile VARCHAR(50),
dob DATE CHECK(dob>'2010-01-01'),
loc VARCHAR(32) DEFAULT "banglore"
);
mysql>
mysql> desc customers;
+--------+-------------+------+-----+----------+-------+
| Field  | Type        | Null | Key | Default  | Extra |
+--------+-------------+------+-----+----------+-------+
| c_id   | int         | NO   |     | NULL     |       |
| c_name | varchar(32) | YES  | UNI | NULL     |       |
| email  | varchar(50) | NO   |     | NULL     |       |
| mobile | varchar(50) | YES  |     | NULL     |       |
| dob    | date        | YES  |     | NULL     |       |
| loc    | varchar(32) | YES  |     | banglore |       |
+--------+-------------+------+-----+----------+-------+
6 rows in set (0.02 sec)


INSERT INTO customers
VALUES
(101,'Rohi',"rohi@gmail.com",'812197','2011-01-01','new delhi');


DELETE FROM customers
WHERE c_id=102;


CREATE TABLE employee(
eid INT , 
ename VARCHAR(32) UNIQUE ,
age INT CHECK(age>18),
PRIMARY KEY (eid)
);

INSERT INTO employee
VALUES
(101,"rahul",52);


INSERT INTO employee
VALUES
(102,"sonia",72),
(103,"priyanka",42),
(104,"modi",72),
(105,"amit",72);






CREATE TABLE bunit(
b_id int,
b_name VARCHAR(32) UNIQUE ,
loc VARCHAR(32) ,
PRIMARY KEY (b_id));

CREATE TABLE employees(
eid int, 
ename VARCHAR(32),
bunit_Id int,
age INT,
PRIMARY KEY(eid),
FOREIGN KEY(bunit_Id) REFERENCES bunit(b_Id)
);


INSERT INTO bunit
VALUES
(11,'IT-Unit','Bangalore'),
(12,'Sales','USA'),
(13,'Admin','Chennai');


INSERT INTO employees
VALUES
(101,'rahul',11,52),
(102,'sonia',12,62),
(103,'priyanka',13,72);

SELECT employees.ename, bunit.b_name
FROM employees,bunit
WHERE employees.bunit_id=bunit.b_id;


SELECT employees.ename AS NAME, bunit.b_name AS BRANCH
FROM employees,bunit
WHERE employees.bunit_id=bunit.b_id;