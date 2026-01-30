select * from employee
where salary = (select max(salary) 
from employee);