USE TV_DB;

-- VIEW
-- INSTEAD OF TYPING THIS QUERY ALL THE TIME...
SELECT title, released_year, genre, rating, first_name, last_name
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- WE CAN CREATE A VIEW -- VIEW CREATE A VIRTUAL TABLE FOR RETURNED TABLE FROM THE QUERY
CREATE VIEW full_reviews AS -- HERE full_review WILL BECOME NAME OF OUR VIRTUAL TABLE
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;

-- SOME VIEWS CAN BE MODIFIED AND SOME CAN NOT
-- VIEW DOCS

-- VIEW END

-- MODIFYING VIEW
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year; 
 
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;
 
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;
 
DROP VIEW ordered_series; -- DELETE THE VIEW

-- MODIFYING VIEW END

-- HAVING -- IT LET YOU FILTER FROM GROUP BY
SELECT title, AVG(rating), COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;
-- HAVING END

-- ROLL UP
SELECT title, AVG(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT title, COUNT(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT first_name, released_year, genre, AVG(rating)
FROM full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;
-- ROLL UP END

-- MODES -- BASICALLY SETTINGS WHICH CAN WE TURN ON AND OFF
-- To View Modes:
-- SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
 
-- To Set Them:
-- SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';