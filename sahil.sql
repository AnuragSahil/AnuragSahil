CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id INT,
    location_id varchar(50)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email VARCHAR(225),
    phone_number VARCHAR(225),
    hire_date VARCHAR(225),
    job_id VARCHAR(225),
    salary FLOAT,
    commission_pct FLOAT,
    manager_id INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(100, 'John', 'Smith', 'jsmith', '555-1234567', '2020-01-15', 'IT_PROG', 6000.00, 0.15, 102, 60);
INSERT INTO Employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(101, 'Jane', 'Doe', 'jdoe', '555-2345678', '2019-03-20', 'IT_PROG', 5500.00, 0.20, 102, 60);
INSERT INTO Employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(102, 'Adam', 'WEST', 'Awest', '555-254678', '2014-03-27', 'IT_PROG', 7000.00, 0.10, 114, 60);

INSERT INTO Departments (department_id, department_name, manager_id, location_id)
VALUES 
(10, 'Administration', 200, 1700);
INSERT INTO Departments (department_id, department_name, manager_id, location_id)
VALUES 
(20, 'Marketing', 201, 1800);
INSERT INTO Departments (department_id, department_name, manager_id, location_id)
VALUES 
(30, 'Purchasing', 114, 1700);
INSERT INTO Departments (department_id, department_name, manager_id, location_id)
VALUES 
(40, 'Human resorces', 203, 2400);
INSERT INTO Departments (department_id, department_name, manager_id, location_id)
VALUES 
(60, 'IT', 102, 1700);

SELECT * FROM Employees;

SELECT first_name, salary
FROM Employees
WHERE department_id = 60;

SELECT department_id, SUM(salary) AS total_salary
FROM Employees
GROUP BY department_id;

SELECT AVG(salary) AS average_salary
FROM Employees
WHERE commission_pct > 0;

SELECT E.first_name AS manager_first_name, E.last_name AS manager_last_name, 
       E2.first_name AS employee_first_name, E2.last_name AS employee_last_name
FROM Employees E
LEFT JOIN Employees E2 ON E.employee_id = E2.manager_id
WHERE E.job_id = 'IT_PROG';

SELECT department_id, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department_id;

SELECT D.department_name
FROM Employees E
JOIN Departments D ON E.department_id = D.department_id
GROUP BY D.department_name
HAVING COUNT(E.employee_id) > 2;
