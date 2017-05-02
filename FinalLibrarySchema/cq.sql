select bid,avg(stars) from ratingBooks group by bid having avg(stars) > 5;
select users.user_id from users,payment where users.user_id = payment.user_id and extract(month from payment.paid_on)='12';
select users.user_id,users.Username,magazines.title from users,magazines,ratingMagazines where users.user_id = ratingMagazines.user_id and ratingMagazines.mid = magazines.mid and (ratingMagazines.stars > 3 );
select distinct(title),stars from books b,ratingBooks r where b.bid = r.bid and b.bid in (select bid from ratingBooks group by bid having avg(stars)>3) ; 
select distinct(borrow.book_id,borrow.user_id ,username) from borrow,users where extract(month from current_date) - extract(month from borrow.date_of_return)>=1;
select users.user_id,borrow.date_of_borrow from users,borrow where users.user_id=borrow.user_id and users.Username like 'Jo%';
select distinct(users.Username,books.title) from users,books,ratingBooks where users.user_id = ratingBooks.user_id and books.bid = ratingBooks.bid and books.title like 'The%';
select ratingBooks.bid,books.title from books,ratingBooks where books.Genre='Action' group by ratingBooks.bid having avg(ratingBooks.stars)>7 ;
select r.bid,b.title,min(r.stars) from ratingBooks r,books b where r.bid = b.bid and r.user_id in (select user_id from users) group by r.bid having min(r.stars) > 2;
select user.user_id,borrow.date_of_borrow from users,borrow where user.user_id in(select user_id from borrow) and user.Username like 'va%';
Update ratingMagazines
   set stars=stars+1
    where mid in(select mid from magazines where title like 'Express Computer');
create view FictionBooks as (select bid,author from books where genre like 'Fiction');
delete from books
where author='Robin Sharma' and bid not in(select bid from ratingbooks);
CREATE TRIGGER idtrigger AFTER  UPDATE ON ratingMagazines
    FOR EACH ROW update bid 
            set mid=mid+1;
update books
set title='A Song of Ice and Fire'
 where author like 'George%';

select users.user_id,books.title from users,books wishlist where users.user_id in(select user_id from wishlist) and books.bid in(select bid from wishlist) and books.genre like 'Fiction';



