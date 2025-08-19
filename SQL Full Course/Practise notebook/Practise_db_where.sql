USE Practise_DB; -- Already created databse in Prac_db_1.

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats
WHERE breed = 'Tabby';
SELECT cat_id, age FROM cats
WHERE cat_id = age;