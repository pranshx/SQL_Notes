-- SRING FUNCTIONS
USE Practise_db;
SELECT REVERSE(
	UPPER('Why does my cat look at me with such hatred?')
    );
SELECT REPLACE(
	CONCAT('I',' ','LIKE',' ','CATS'),
    ' ', '-'
    );

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465);

SELECT REPLACE(Title,' ','->') AS Title From books;
SELECT 
    author_fname AS forward, REVERSE(Author_fname) AS Backward
FROM books;
SELECT UPPER(CONCAT(Author_fname,' ', Author_lname)) AS 'Author Full Name In Caps' FROM books;