-- Table named cats_Update has already been create in practise_DB databse
-- Values has been inserted
SHOW TABLES;
UPDATE cats_update SET name='Jack'
WHERE name='Jackson';
UPDATE cats_update SET breed='British Shorthair'
WHERE name='Ringo';
UPDATE cats_update SET age=12
WHERE breed='maine coon';
SELECT * FROM cats_update;