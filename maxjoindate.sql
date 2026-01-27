select * from employee
where joinedDate = (select max(joinedDate) from employee)