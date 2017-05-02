-- Complex Queries

--Q.1
--Select all books of "Fantasy" Genre. List Alphabetically
select title from books where bid in (select bid from genre where Genre='Fantasy') order by title ;

--Q.2
--Display all the Books by the author "Daniel Goleman" Rating greater than 4 .
select title from books where author = 'Daniel Goleman' and bid in (select bid from ratingBooks group by bid having avg(stars) > 4) ;

--Q.3
--Display all the books of genre "Fiction" with average rating greater that 5
select title from books where bid in (select bid from genre where genre = 'Fiction' ) and bid in (select bid from ratingBooks group by bid having avg(stars) > 6) ;


--Problem! : How to select avg(stars) and the Title of a book?? They are present in 2 different tables. 

-- Very Important Query!!!
SELECT books.title, (SELECT round(avg(stars),2) FROM ratingBooks WHERE ratingBooks.bid = books.bid) AS Stars FROM books ;

--Q.4 
-- Display all books and their average rating of genre "Self Help" with average rating greater than 3
SELECT books.title, (SELECT avg(stars) FROM ratingBooks WHERE ratingBooks.bid = books.bid) AS Stars FROM books group by title having books.bid in (select bid from genre where genre = 'Self Help' ) and books.bid in (select bid from ratingBooks group by bid having avg(stars) > 3) ;

--Q.5 
-- Select all users and date of borrowed of users with name starting from "gl" 
select distinct borrow.user_id,borrow.date_of_borrow from borrow where borrow.user_id in(select user_id from users where users.user_id = borrow.user_id and users.Username ilike 'gl%') ;

--Q.6
-- Selects all users and Magazines borrowed by them with rating > 5
select users.user_id,users.Username,magazines.title,ratingMagazines.stars from users,magazines,ratingMagazines where users.user_id = ratingMagazines.user_id and ratingMagazines.mid = magazines.mid and (ratingMagazines.stars > 5 ) order by users.user_id;

--Q.7
-- Selects users and date of users who have books due for more than 1 month
select distinct(borrow.book_id,borrow.user_id ,username) from borrow,users where extract(month from current_date) - extract(month from borrow.date_of_return)>=1;

--Q.8
--Creates View FictionBooks
create view FictionBooks as (select bid,title, author from books where bid in (select bid from genre where Genre like 'Fiction')) ;

--Q.9
--Selects users who have rated books with name starting from "the"
select users.Username,books.title from users,books,ratingBooks where users.user_id = ratingBooks.user_id and books.bid = ratingBooks.bid and books.title ilike 'The%';

--Q.10
--selects all books with their rating which have been given a rating more than 6
select distinct(books.title), ratingBooks.stars from books, ratingBooks where stars in (select min(r.stars) from ratingBooks r,books b where r.bid = b.bid and r.user_id in (select user_id from users) group by r.bid having min(r.stars) > 6);

--Q.12
--updates all magazine ratings by 1 whose title is Express Computer
Update ratingMagazines
   set stars=stars+1
    where mid in(select mid from magazines where title like 'Express Computer');
--Q.13
--changes name of books written by author 'George'
update books
set title='A Song of Ice and Fire'
 where author like 'George%';
 
 
--Q.14
--Selects books and average rating from a particular user's Wishlist 
SELECT userbooks.user_id,books.title, (SELECT round(avg(stars),2) FROM ratingBooks WHERE ratingBooks.bid = books.bid) AS Stars FROM books,userbooks where userbooks.bid=books.bid ;

--Q.14
--Selects +




 








