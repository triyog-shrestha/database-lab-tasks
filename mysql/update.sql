#update the gender if an employee where employee id = 1
use dbemp;
update employee
set gender = 'f' 
where emp_id = 1 and gender = 'm';