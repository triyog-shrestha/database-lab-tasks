#display the oldest employee
select * from employee 
where dateOfBirth = (select min(dateOfbirth) from employee);