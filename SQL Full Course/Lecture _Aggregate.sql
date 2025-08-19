-- Aggregate Functions
USE book_store;
-- COUNT

SELECT COUNT(*) FROM books;
-- COUNT(*) Will count all the rows including the null onces
SELECT COUNT(author_lname) FROM books;
-- COUNT(author_fname) -> It will not count null values
SELECT COUNT(DISTINCT author_lname) FROM books;
 -- COUNT(DISTINCT Author_fname) -> Give the count of distinct author first name
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
-- COUNT END

-- Group By
SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;
 
SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;

-- Group By End

-- Min N Max
SELECT MAX(pages) FROM books;
 
SELECT MIN(author_lname) FROM books;
-- Min N Max End

-- SubQueries
SELECT * FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);
-- SubQueries

-- Grouping by multiple column
SELECT author_fname, author_lname, COUNT(*) FROM books
GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;
-- Grouping by multiple column End

-- Min N Max with Group by
SELECT author_fname,author_lname, 
COUNT(*) AS book_written,
MAX(released_year) AS latest_release,
MIN(released_year) AS earliest_release,
MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname, author_fname;
-- Min N Max with Group by End

-- SUM
SELECT SUM(pages) FROM books;

SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;
SELECT SUM(author_lname) FROM books; -- Sums only number here result = 0
-- SUM End

-- AVG
SELECT AVG(pages) FROM books;
SELECT AVG(released_year) FROM books;
SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;
-- AVG End
