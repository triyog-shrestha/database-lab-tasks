create database w3Tut;
use w3Tut;
create table Student(sID int primary key auto_increment, 
name varchar(30) not null, 
age int not null, 
year int not null, 
major varchar(20) not null
);

create table Course(cID int primary key auto_increment, 
course_name varchar(30) not null, 
course_length int not null, 
sID int not null, 
course_head varchar(20) not null,
foreign key (sID) references Student(sID)
);


insert into student (name, age, year, major) values
('Alice Johnson', 20, 2, 'Computer science'),
('Bob Smith', 19, 1, 'Mathematics'),
('Carol Davis', 21, 3, 'Physics'),
('David Wilson', 22, 4, 'Engineering'),
('Emma Brown', 20, 2, 'Biology'),
('frank miller', 19, 1, 'chemistry', 'frank.miller@university.edu'),
('grace lee', 21, 3, 'computer science', 'grace.lee@university.edu');

insert into course (course_name, course_length, sid, course_head) values
('Introduction to programming', 45, 1, 'Dr. Peterson'),
('Calculus i', 60, 2, 'Dr. Martinez'),
('Quantum mechanics', 50, 3, 'Dr. Thompson'),
('Engineering design', 55, 4, 'Dr. Jackson'),
('Molecular biology', 48, 5, 'Dr. Rodriguez'),
('data structures', 45, 1, 'dr. peterson'),
('algorithms', 50, 1, 'dr. chen'),
('calculus ii', 60, 2, 'dr. martinez'),
('linear algebra', 42, 7, 'dr. martinez'),
('database systems', 48, 7, 'dr. peterson');


select * from student where name like '%n' and age<22;

update student set age = 22 where sID = 1;

alter table student add Email varchar(30);
update student set email = 'alice.johnson@university.edu' where sid = 1;
update student set email = 'bob.smith@university.edu' where sid = 2;
update student set email = 'carol.davis@university.edu' where sid = 3;
update student set email = 'david.wilson@university.edu' where sid = 4;
update student set email = 'emma.brown@university.edu' where sid = 5;


delete from course where sID = 5;
delete from student where sID = 5;

select * from student where age = (select min(age) from student) or age = (select max(age) from student);

select sum(age) from student;
select avg(age) from student;


select s.sid, s.name, s.major, c.cid, c.course_name, c.course_head
from student s
inner join course c on s.sid = c.sid;


select s.sid, s.name, s.age, s.major, c.course_name, c.course_length
from student s
left join course c on s.sid = c.sid;


select c.cid, c.course_name, c.course_head, s.name, s.major
from student s
right join course c on s.sid = c.sid;


