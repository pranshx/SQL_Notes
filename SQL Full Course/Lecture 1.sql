CREATE DATABASE New_Database; -- To create a database in the server
USE NEW_Database; -- Select the Database -- You can also double click on the database on the left
SELECT database(); -- To view which database is selected

-- CREATING TABLES
CREATE TABLE cats(
	name VARCHAR(20),
    age INT
);
-- Creating Tables End.

SHOW TABLES; -- Show all the tables in the database
-- Shows the structure of table
SHOW COLUMNS FROM cats; 
-- OR
DESC cats;

INSERT INTO cats(name, age) -- cats() or cats or cats(name,age) work the same, defining the cats(name,age) or cats(age,name) are different 
VALUES("Blue steele", 5);  -- Single data input in the table

INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5),
  ('Turkey', 1),
  ('Potato Face', 15); -- Mutiple insert in the table
  
-- NOT NULL
INSERT INTO cats() -- Both the column will be empty
VALUES();
INSERT INTO cats(name)
VALUES ("Harry");  -- Age column will ne NULL here 

-- No column can be empty
CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
-- Not NULL End.

-- Escape Character
-- \
INSERT INTO cats(name)
VALUES ("Harry's"); -- Single quote inside of double quote and vise versa works
-- INSERT INTO cats(name)
-- VALUES ("Har"ry's"); Here error to solve > "Har\"ry's")
INSERT INTO cats(name)
VALUES ("Har\"ry's");
-- Escape Character End

-- Default Constraint
CREATE TABLE cats3  (    
    name VARCHAR(20) DEFAULT 'no name provided',    
    age INT DEFAULT 99  
);
-- But value could be set NULL manually! If not null is not specified!

-- name VARCHAR(20) NOT NULL DEFAULT 'unnamed' Combine NOT NULL and DEFAULT

-- Default Contraint end

-- Primary key
CREATE TABLE unique_cats
(
	cats_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
-- Another way to write 
-- CREATE TABLE unique_cats2 ( cat_id INT, PRIMARY KEY (cat_id));

-- Primary Key End

-- Auto Increment
CREATE TABLE AutoIncrement_cat(

    cat_id INT AUTO_INCREMENT, -- + 1 FROM THE LAST VALUE
    name VARCHAR(10) NOT NULL,
    PRIMARY KEY (cat_id)
);

-- Auto Increment End

Select * FROM AutoIncrement_cat; -- Show the data in the table


-- Comments, ctrl + /

-- DROP TABLE <table-name>; -- For dropping the table
-- DROP DATABASE <NAME> -- Drop the database