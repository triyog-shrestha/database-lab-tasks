#display name,joined date, date of birth, current date and age of employees whose age > 25
select name,
joinedDate,
dateOfbirth, 
curdate() as currentDate,
timestampdiff(year, dateOfbirth, curdate()) as age from employee 
where timestampdiff(year, dateOfbirth, curdate()) > 25;