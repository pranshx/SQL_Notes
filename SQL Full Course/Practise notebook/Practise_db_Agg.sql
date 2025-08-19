use practise_db;
select * from books;
select released_year,count(*) as number_of_book_released from books
group by released_year
order by number_of_book_released desc;

Select sum(stock_quantity) as total_books from books;

SELECT author_fname,author_lname,AVG(released_year) as average_released_year
from books
group by author_fname,author_lname;

Select concat(author_fname, ' ', author_lname) as full_name, pages
from books
order by pages desc
Limit 1;
-- or
Select concat(author_fname, ' ', author_lname) as full_name, pages
from books
where pages= (select max(pages) from books);

select released_year,count(*) as number_of_book_released, avg(pages) from books
group by released_year
order by number_of_book_released desc;