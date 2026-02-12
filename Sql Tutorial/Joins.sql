create database JoinTut;

use joinTut;

create table employees(id int primary key, employee_name varchar(20), department_id int);

insert into employees values 
(1, 'Homer Simpson', 4),
(2, 'Ned Flanders', 1),
(3, 'Barney Gamble', 5),
(4, 'Clancy Wiggum', 3),
(5, 'Moe Syzslak', null);

create table departments(department_id int primary key, department_name varchar(50));

insert into departments values 
(1, 'Sales'),
(2, 'Engineering'),
(3, 'Human Resources'),
(4, 'Customer Service'),
(5, 'Research and Development');

#inner join - only gives the matching values in both table
select * from employees e inner join departments d on e.department_id = d.department_id;

#left join - gives all from left table and matching 
select * from employees e left join departments d on e.department_id = d.department_id;

#right join - gives all from right table and matching
select * from employees e right join departments d on e.department_id = d.department_id;

#cross join
select * from employees cross join departments;