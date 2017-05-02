
select bid,avg(stars) from ratingBooks group by bid having avg(stars) > 5;

select users.user_id from users,payment where users.user_id = payment.user_id and extract(month from payment.paid_on)='12';

select users.user_id,users.Username,magazines.title from users,magazines,ratingMagazines where users.user_id = ratingMagazines.user_id and ratingMagazines.mid = magazines.mid and (ratingMagazines.stars > 3 );

select distinct(title),stars from books b,ratingBooks r where b.bid = r.bid and b.bid in (select bid from ratingBooks group by bid having avg(stars)>3) ; 

select distinct(borrow.book_id,borrow.user_id ,username) from borrow,users where extract(month from current_date) - extract(month from borrow.date_of_return)>=1;

select users.user_id,borrow.date_of_borrow from users,borrow where users.user_id=borrow.user_id and users.Username like 'Jo%';

select users.Username,books.title from users,books,ratingBooks where users.user_id = ratingBooks.user_id and books.bid = ratingBooks.bid and books.title like 'The%';

select ratingBooks.bid,books.title from books,ratingBooks where books.Genre='Action' group by ratingBooks.bid having avg(ratingBooks.stars)>7 ;

select r.bid,min(r.stars) from ratingBooks r,books b where r.bid = b.bid and r.user_id in (select user_id from users) group by r.bid having min(r.stars) > 2 order by r.bid;

select distinct(books.title), ratingBooks.stars from books, ratingBooks where stars in (select min(r.stars) from ratingBooks r,books b where r.bid = b.bid and r.user_id in (select user_id from users) group by r.bid having min(r.stars) > 6);
