USE Practise_DB;
CREATE TABLE Employees
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    age INT NOT NULL,
    current_status VARCHAR(20) NOT NULL DEFAULT 'employed'
);
INSERT INTO Employees(last_name,first_name,age)
VALUES ('smith','vans',6);
SELECT * FROM Employees;