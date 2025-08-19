-- CRUD CREATE READ UPDATE DELETE
CREATE DATABASE CRUD_cats;
USE CRUD_cats;
-- Table name cats in Crud_cats database has
-- already been created and code has been removed
-- For clean page

-- READ

-- Select
SELECT * FROM cats; -- All the column
SELECT name FROM cats; -- Single Column
SELECT name, breed FROM cats;
-- Select End

-- Where Clause - Here we are using it with select
SELECT * FROM cats WHERE AGE = 4;
SELECT * FROM cats WHERE name ='Egg';
SELECT name, age FROM cats
WHERE breed = 'Tabby'; -- You don't need to select breed to use where clause on breed
-- Where caluse End

-- Aliases
SELECT cat_id AS id, name FROM cats; -- Temporary(only for this query) change of resulting displayed table.
-- Aliases

-- UPDATE

UPDATE cats SET name='Update_cats'; -- update all the rows in name column to update_cats
UPDATE cats SET name='Update_cats', age=4; -- Multiple column
-- It is typically used with Where clause
UPDATE cats SET name='new_cats'
WHERE age=4; -- Update name where age = 4

-- Update End

-- DELETE
DELETE FROM cats; -- Will empty the table, delete all row
DELETE FROM cats
WHERE name='Jackson';
SELECT * FROM cats;
-- Delete End 
SET SQL_SAFE_UPDATES = 0; -- Set safe mode to false
