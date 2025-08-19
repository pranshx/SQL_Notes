USE book_Store;
-- COMPARISION WITH NULL RESULTS IN NULL
-- EQUAL AND NOT EQUAL TO
SELECT * FROM books
WHERE released_year = 2016;
SELECT * FROM books
WHERE released_year != 2017;
-- EQUAL AND NOT EQUAL TO END

-- NOT LIKE
SELECT * FROM books
WHERE title NOT LIKE '%e%';
-- NOT LIKE END

-- GREATER THAN
SELECT * FROM books
WHERE released_year > 2005;
 
SELECT * FROM books
WHERE pages > 500;
-- GREATER THAN END

-- LESS THAN
SELECT * FROM books
WHERE pages < 200;
 
SELECT * FROM books
WHERE released_year < 2000;
-- LESS THAN END

-- GREATER/LESS THAN OR EQUAL TO
SELECT * FROM books
WHERE released_year <= 1985;
-- GREATER/LESS THAN OR EQUAL TO END

-- AND
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';
 
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';

SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;
 
SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;
-- AND END

-- OR
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;

SELECT title, pages FROM books
WHERE pages < 200
OR title like '%Stories%';
-- OR END

-- BETWEEN N NOT BETWEEN
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;
SELECT title, released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2014;
-- BETWEEN N NOT BETWEEN END

-- COMPARING DATES
USE DATA_TYPES;
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);
 
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;
-- COMPARING DATES END

-- IN AND NOT IN
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
-- IN AND NOT IN

-- WORKING WITH MODULO
SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1;
-- WORKING WITH MODULO

-- CASE
SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'Modern lit'
    ELSE '20TH Century lit'
END AS Genre
FROM books;

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM books;
 
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM books;
-- CASE END

-- IS NULL AND IS NOT NULL
SELECT title FROM books
WHERE title IS NULL;
SELECT title FROM books
WHERE title IS NOT NULL;