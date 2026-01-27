create database dbemp;

CREATE TABLE employee (
    emp_id INT NOT NULL AUTO_INCREMENT primary key,
    name VARCHAR(255) NOT NULL,
    age INT,
    salary FLOAT,
    department VARCHAR(255),
    gender CHAR(1),
    dateOfBirth DATE,
    joinedDate DATE NOT NULL DEFAULT (CURDATE()),
    managerId VARCHAR(20) DEFAULT 'main123',
    designation VARCHAR(50),
);


INSERT INTO employee (emp_id, name, salary, department, gender, dateOfBirth, managerId, designation)
VALUES 
    (1, 'Navy Blue', 36720, 'Software engineering', 'f', '2008-06-05', '1', 'Manager'),
    (2, 'Gunna Wunna', 738340, 'Software engineering', 'm', '1998-09-19', '1', 'Engineer'),
    (3, 'John Blue', 90188, 'Business Analytics', 'm', '2002-02-05', '4','Engineer'),
    (4, 'Frank Lucas', 738340, 'Business Management', 'm', '1989-01-13','4', 'Manager');


