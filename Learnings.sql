CREATE TABLE COMPUTER (
COMPID int PRIMARY KEY,
BRAND VARCHAR (50),
COMPMODEL VARCHAR (50),
MANUFACTUREDATE DATE);

CREATE TABLE EMPLOYEE (
EMPID int PRIMARY KEY,
FIRSTNAME VARCHAR (50),
LASTNAME VARCHAR (50),
SALARY int,
EMAILID VARCHAR (50),
MANAGERID int,
DATEOFJOINING DATE,
DEPT  varchar(10),
COMPID int,
FOREIGN KEY (COMPID) REFERENCES COMPUTER(COMPID));

INSERT INTO COMPUTER VALUES (1001,'Lenovo','T480','12-06-19');
INSERT INTO COMPUTER VALUES (1002,'Lenovo','T490','24-08-20');
INSERT INTO COMPUTER VALUES (1003,'SONY','SQ112','01-12-19');
INSERT INTO COMPUTER VALUES (1004,'SONY','SX1001','21-12-20');

INSERT INTO EMPLOYEE VALUES (1,'NANDA','KUMAR',50000, 'NANDA@GMAIL.COM',NULL,'15-06-12','IT',1001);
INSERT INTO EMPLOYEE VALUES (2,'BIPLAB','PARIDA',30000, 'BPARIDA@YAHOO.COM',1,'21-12-15','IT',1001);
INSERT INTO EMPLOYEE VALUES (3,'DISHA','PATEL',50000,'DISHAP@GMAIL.COM',NULL,'21-08-13','HR',NULL);
INSERT INTO EMPLOYEE VALUES (4,'SIBA','PRASAD',90000,'SIBA@GMAIL.COM',3,'01-06-20','HR',1002);
INSERT INTO EMPLOYEE VALUES (5,'ANUSHKA','SHARMA', 20000, 'SHARMAA@GMAIL.COM',1,'01-03-21','IT', NULL);
INSERT INTO EMPLOYEE VALUES (6,'SOMNATH','MAHARANA', 65000, 'SMAHA@GMAIL.COM',3,'07-05-19','IT',1003);

select * from computer;
select * from employee;

-- Q1
-- SQL Query to update DateOfJoining to 15-07-2012 for empid =1.
update employee set dateofjoining = '15-07-12' where empid = 1;

-- Q2
-- SQL Query to Find all employee with Salary between 40000 and 80000?
select * 
from employee 
where salary between 40000 and 80000;

-- Q3
-- SQL Query to display full name?
select 
concat(firstname,' ',lastname) as fullname
from employee;

-- Q4
-- SQL Query to find name of employee beginning with S?
select *
from employee where firstname like 'S%';

-- Q5
-- Write a query to fetch details of employees whose firstname ends with an alphabet ‘A’ and contains exactly five alphabets ?
select *
from employee
where firstname like '____A';

-- Q6
-- Write a query to fetch details of all employees excluding few Employees
select *
from employee
where firstname not in ('Nanda');

-- Q7
-- SQL query to display the current date ?
select curdate();

-- Q8
-- last day of previous month
select last_day(curdate() - interval 1 month);
-- first day of previous month
select last_day(curdate() - interval 2 month) + interval 1 day;

-- Q9
-- Write an SQL query to fetch the employee FIRST names and replace the A with ‘@’:
select replace(firstname, 'A', '@')
from employee;

-- Q10
-- Write an SQL query to fetch the domain from an email address:
select * from employee;
select substr(EMAILID, instr(EMAILID, '@') +1) 
from employee;

-- 11Q
-- Write an SQL query to update the employee names by removing leading and trailing spaces
update employee set firstname = trim(firstname);

-- Q12
-- Write an SQL query to fetch all the Employees details from Employee table who joined in the Year 2001:
select *
from employee
where dateofjoining between '01-01-01' and '01-12-31';

-- Q13
-- Write an SQL query to fetch only odd rows / Even rows from the table
select * 
from employee
where mod(empid,2) = 0;

-- Q14
-- Write an SQL query to create a new table with data and structure copied from another table:
create table emp06 as (select * from employee);

-- Q15
-- Write an SQL query to create an empty table with the same structure as some other table :
create table emp07 as (select * from employee where 1=2);

-- Q16
-- Write an SQL query to fetch top 3 HIGHEST salaries :
select *
from employee
order by salary desc
limit 3;

-- Q17
-- Find the first employee and last employee from employee table
select * from employee
where empid = (select min(empid) from employee);
select * from employee
where empid = (select max(empid) from employee);

-- Q18
-- List the ways to get the count of records in a table:
select count(*) from employee;

-- Q19
-- Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order:
select count(empid) as count,dept
from employee
group by dept
order by count;

-- Q20
-- Write a query to retrieve Departments who have less than 4 employees working in it
select dept,count(*) as total_count
from employee
group by dept
having total_count < 4;

-- Q21
-- Write a query to retrieve Department wise Maximum salary:
select dept,max(salary) as max_salary
from employee
group by dept;

-- Q23
-- Query to fetch details of employees not having computer:
select * from computer;
select * from employee;

select * from employee
where compid is null;

-- Q24
-- Query to fetch employee details along with the computer details who have been assigned with a computer :
select c.COMPID,brand,empid,firstname,lastname,salary,emailid,dateofjoining,dept
from computer c left join employee e 
on c.COMPID = e.compid;

-- Q25
-- Find Nth Highest salary : 4th
select distinct salary from employee e1
 where 3 = (select count(distinct salary)
            from employee e2
            where e2.salary > e1.salary)








