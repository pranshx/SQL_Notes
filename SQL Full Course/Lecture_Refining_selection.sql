CREATE DATABASE REFINING_SELECTION;
USE REFINING_SELECTION;

-- DISTINCT
SELECT author_fname FROM books;
SELECT DISTINCT author_fname FROM Books;
-- DISTINCT FOR 2 COLUMN - IT FIRST COMBINE 2 COLUMN AND THEN FIND THE DISTICT VALUE
SELECT DISTINCT author_fname, author_lname FROM books; -- THIS WORK SAME AS DISTINCT CONCAT(Aauthor_fname, author_lname)
SELECT DISTINCT author_fname, author_lname, released_year FROM books;
-- DISTINCT END

-- ORDER BY
SELECT book_id,author_fname, author_lname FROM books
ORDER BY author_lname;

SELECT Title,pages FROM books -- ORDERED BY DESCENDING 
ORDER BY pages DESC;
 
SELECT Title,pages FROM books
ORDER BY released_year;
-- ORDER BY End

-- ORDER BY column number
SELECT book_id, author_fname, author_lname, pages -- index start form 1
FROM books ORDER BY 2 desc;

-- Order by multiple column
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname; -- Fisrt sort by author_lname then within sort with author_fname
-- Order by multiple column End

-- Order by column that is not the part of table
SELECT CONCAT(author_fname, ' ', author_lname) as full_name
FROM books ORDER BY full_name desc;
-- Order by column that is not the part of table End

-- LIMIT
SELECT title FROM books LIMIT 10;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 14;

SELECT title, released_year FROM books -- INDEX START AT 0, THIS QUERY FETCH US ROW = 0 AND THEN MOVE 5 DOWN
ORDER BY released_year DESC LIMIT 0,5;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;

SELECT title FROM books LIMIT 500;  -- IF LIMIT EXCEED NUMBER OF ROWS IN TABLE, IT RETURN ALL THE ROWS
SELECT title FROM books LIMIT 4,500;  -- SAME FOR THIS QUERY

-- LIMIT End

-- LILE
SELECT author_fname FROM books
WHERE author_fname LIKE '%da%'; -- % is a wildcard character meaning 0 or more character.

SELECT author_fname FROM books
WHERE author_fname LIKE 'dav_'; -- _ is a wildcard character meaning exactly 1 character.

SELECT * FROM books
WHERE author_fname LIKE '%'; -- return all row

SELECT * FROM books
WHERE author_fname LIKE '%n'; -- return where author_fname end with n

-- LIKE End

-- Eascaping Wildcard

-- To select books with '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%';
 
-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';

-- Eascaping Wildcard End