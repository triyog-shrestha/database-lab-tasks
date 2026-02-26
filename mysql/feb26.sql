create database company;
use company;
CREATE TABLE DEPARTMENT(
    DNAME VARCHAR(20),
    DNUMBER INT PRIMARY KEY,
    MGRSSN VARCHAR(15),
    MGRSTARTDATE DATE
);
CREATE TABLE EMPLOYEE(
    FNAME VARCHAR(20),
    MINIT CHAR(1),
    LNAME VARCHAR(20),
    SSN VARCHAR(15) PRIMARY KEY,
    BDATE DATE,
    ADDRESS VARCHAR(100),
    SEX CHAR(1),
    SALARY INT,
    SUPERSSN VARCHAR(15),
    DNO INT,
    FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNUMBER)
);

INSERT INTO DEPARTMENT VALUES
('Research',5,'333445555','1988-05-22'),
('Administration',4,'987654321','1995-01-01'),
('Headquarters',1,'888665555','1981-06-19');


INSERT INTO EMPLOYEE VALUES
('John','B','Smith','123456789','1965-01-09','Houston, TX','M',30000,'333445555',5),
('Franklin','T','Wong','333445555','1955-12-08','Houston, TX','M',40000,'888665555',5),
('Alicia','J','Zelaya','999887777','1968-01-19','Spring, TX','F',25000,'987654321',4),
('Jennifer','S','Wallace','987654321','1941-06-20','Bellaire, TX','F',43000,'888665555',4),
('Ramesh','K','Narayan','666884444','1962-09-15','Houston, TX','M',38000,'333445555',5),
('Joyce','A','English','453453453','1972-07-31','Houston, TX','F',25000,'333445555',5),
('Ahmad','V','Jabbar','987987987','1969-03-29','Houston, TX','M',25000,'987654321',4),
('James','E','Borg','888665555','1937-11-10','Houston, TX','M',55000,NULL,1);
#q1.  10% Salary Raise for Research Department
select E.FNAME,E.LNAME,
E.SALARY * 1.1 as increased_salary
from EMPLOYEE E 
join DEPARTMENT D on E.DNO = D.DNUMBER
where D.DNAME = 'Research';

#2 Salary Statistics of Accounts Department
#sum. max, min, avg for department administration
select sum(E.SALARY) as Total,
 max(E.SALARY) as max,
 min(E.SALARY) as min,
avg(E.SALARY) as average
from EMPLOYEE E 
join DEPARTMENT D on E.DNO = D.DNUMBER
where D.DNAME = 'Administration';

select * from department;
select * from employee;

#q3 Employees Controlled by Department 5
select FNAME, LNAME from employee where DNO = 5;
#using exist
select FNAME, LNAME from EMPLOYEE E where exists (select 1 from EMPLOYEE e where e.DNO = 5 and E.SSN = e.SSN);


#q4 departments having at least 2 employees
select DNAME,count(*) from department D join employee E on E.DNO = D.DNUMBER group by D.DNAME having count(*) >= 2;


#q5 Employees born in between 1990-1999
select * from employee where year(BDATE) between 1960 and 1999;

#q6 employee name with department name
select e.FNAME, d.DNAME from department D join employee E on E.DNO = D.DNUMBER;
