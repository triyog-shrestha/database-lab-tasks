create database TechSolutionsDB;
use TechSolutionsDB;

create table Department(DeptID int primary key auto_increment, Deptname varchar(30) not null, location varchar(30));

create table Employee(EmpID int primary key auto_increment, FirstName varchar(20), LastName varchar(30), Gender enum('Male', 'Female', 'Others'), Salary decimal(20,2), HireDate date, DeptId int, foreign key(DeptID) references Department(DeptID));

create table Project(ProjectID int primary key auto_increment, ProjectName varchar(30), EndDate date, Budget decimal(20,2));

create table Works_on(EmpiD int, ProjectID int, HoursWorked int, foreign key(EmpID) references Employee(EmpID), foreign key(ProjectID) references Project(ProjectID), primary key(EmpID, ProjectID));

-- Department (insert first — Employee references it)
INSERT INTO Department (DeptName, Location) VALUES
    ('Human Resources', 'New York'),
    ('Engineering',     'San Francisco'),
    ('Marketing',       'Chicago'),
    ('Finance',         'Boston'),
    ('Operations',      'Austin');

-- Employee
INSERT INTO Employee (FirstName, LastName, Gender, Salary, HireDate, DeptID) VALUES
    ('Alice',   'Johnson',  'Female', 72000.00, '2019-03-15', 1),
    ('Bob',     'Smith',    'Male',   95000.00, '2020-07-01', 2),
    ('Carol',   'Williams', 'Female', 68000.00, '2018-11-20', 3),
    ('David',   'Brown',    'Male',   110000.00,'2021-01-10', 2),
    ('Priya',   'Patel',    'Female', 85000.00, '2022-06-25', 4);

-- Project
INSERT INTO Project (ProjectName, EndDate, Budget) VALUES
    ('Website Revamp',    '2025-06-30', 150000.00),
    ('Mobile App',        '2025-12-31', 300000.00),
    ('Data Migration',    '2025-03-31', 80000.00),
    ('Brand Campaign',    '2025-09-15', 200000.00),
    ('ERP Integration',   '2026-01-31', 500000.00);

-- Works_on  (each EmpID + ProjectID pair must be unique)
INSERT INTO Works_on (EmpID, ProjectID, HoursWorked) VALUES
    (1, 1, 120),
    (2, 2, 200),
    (3, 4,  90),
    (4, 3, 160),
    (5, 5, 140);
    
    
update Employee set salary = salary*1.1 where EmpID = 2;

delete from works_on where ProjectID = 5;
delete from project where ProjectID = 5;


select * from employee where salary > 50000;

select FirstName,LastName,Salary from employee order by salary desc;

select * from employee where DeptID = (select DeptID from department where Deptname = 'Marketing');

select count(*) as TotalEmployees, DeptID from employee group by DeptID;

select * from employee where HireDate > '2022-01-01';

select e.FirstName, e.LastName, d.DeptName from Employee e left join department d on e.DeptID = d.DeptID;

select p.ProjectName, e.FirstName, e.LastName from Project p inner join works_on w on p.ProjectID = w.ProjectID inner join employee e on w.empID = e.empID;

select p.projectName, e.FIrstName, e.LastName, w.HoursWorked from Project p inner join works_on w on p.ProjectID = w.ProjectID inner join employee e on w.empID = e.empID;


select avg(e.Salary) as AverageSalary, d.Deptname from employee e join department d on e.DeptID = d.DeptID group by Deptname;

select d.Deptname, count(e.EmpID) as totalEmployees from Department d join Employee e on d.DeptID = e.DeptID group by d.Deptname order by totalEmployees desc;

select FirstName, LastName, Salary, (select avg(salary) from employee)as AverageSalary from employee where salary > (select avg(salary) from employee);

create view HighSalaryEmployees as select * from employee where salary>60000;

select * from HighSalaryEmployees;

create index idx_lastname on employee(LastName)