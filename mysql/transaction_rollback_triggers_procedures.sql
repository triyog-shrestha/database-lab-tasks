create database BankDB;
use BankDB;

create table accounts(account_id int primary key auto_increment, account_holder varchar(20), balance decimal(10,2));

insert into accounts(account_holder, balance) values ('Ram', 50000), ('Shyam', 30000), ('Sita', 20000);


start transaction;
update accounts set balance = balance - 5000 where account_id = 1;
update accounts set balance = balance + 5000 where account_id = 2;
commit;


#demonstrate bank transaction using rollback
start transaction;
update accounts set balance = balance - 10000 where account_id = 2;
update accounts set balance = balance + 10000 where account_id = 3;
rollback;


#use savepoint while updating account balances
start transaction;
update accounts set balance = balance - 2000 where account_id = 1;
savepoint sp1;
update accounts set balance = balance + 2000 where account_id = 2;
rollback to sp1;
commit;


create table employees(emp_id int primary key auto_increment, name varchar(20), salary decimal(10,2));

create table salary_log(log_id int primary key auto_increment, emp_id int, old_salary decimal(10,2), new_salary decimal(10,2), updated_at timestamp default current_timestamp);

-- trigger 
Delimiter $$
create trigger check_salary
before insert on employees 
for each row
begin 
	if new.salary < 10000 then 
    signal sqlstate '45000'
    set message_text = 'Salary must be at least 10k';
    end if;
end $$
Delimiter ;




-- create an after update trigger on employees that records salary changes into the salary_log table
Delimiter $$
create trigger log_salary_update
after update on employees
for each row
begin 
insert into salary_log(emp_id, old_salary, new_salary)
values(old.emp_id, old.salary, new.salary);
end $$
Delimiter ;

insert into employees(name,salary) values('John', 10000);
update employees set salary = 12000 where emp_id = 1;



-- get employees procedure
Delimiter $$
create procedure getEmployees()
Begin 
select * from employees;
end
$$
Delimiter ;
call getEmployees();


-- add Employee procedure
Delimiter $$
create procedure addEmployee1(in p_id int, in p_name varchar(20), in p_salary decimal(10,2))
begin 
insert into employees values(p_id, p_name, p_salary);
end $$
Delimiter ;

call addEmployee1(2,'Pork',20000);
call getEmployees()




-- update salary procedure
Delimiter $$
create procedure updateSalary(in p_id int, in p_salary decimal(10,2))
begin 
update employees set salary = p_salary where emp_id = p_id;
end $$
Delimiter ;

call updateSalary(1,50000);



-- stored procedure that transfers money between 2 users

Delimiter $$
create procedure transferMoney(in from_acc int, in to_acc int, in money decimal(10,2))
begin 
start transaction;
update accounts set balance = balance - money where account_id = from_acc;
update accounts set balance = balance + money where account_id = to_acc;
commit;
end $$
Delimiter ;

call transferMoney(1,2,5000);