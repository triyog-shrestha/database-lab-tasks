create database dbemp;

create table employee (
    emp_id int auto_increment primary key,
    name varchar(255),
    age int,
    salary double,
    department varchar(255),
    gender char(1),
    dateofbirth date,
    joineddate date default (curdate()),
    managerid varchar(255) default 'main123'
);

insert into employee(name, age, salary, department, gender, dateofbirth) 
values
('Navy Blue', 32, 36720, 'conscious', 'm', '2008-06-05'),
('Gunna Wunna', 32, 738340, 'trap', 'm', '1998-09-19');


