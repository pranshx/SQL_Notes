CREATE DATABASE Practise_DB;
USE Practise_DB;

CREATE TABLE pastries(
	name VARCHAR(50),
    quantity INT
);
INSERT INTO pastries
VALUES
	("Harry", 3),
    ("Berry",7);
    
INSERT INTO pastries(name)
VALUES ("Harry");
    
SELECT * FROM pastries;
SHOW TABLES;
DESC pastries;
DROP TABLE cats;
