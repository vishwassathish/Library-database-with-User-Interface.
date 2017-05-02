select title from books where Genre ilike 'AB%';
select distinct(bid,title) from books where Author = 'J K Rowling' or Genre in ('Adventure','Fiction');
select title ,Author from books where Genre not in ('Thriller');

select distinct(b.bid) ,title from books b,ratingBooks r where b.bid = r.bid and r.stars > 3;
select bid,avg(stars) from ratingBooks group by bid having avg(stars) > 5;

select user_id,username from users where username ilike '%D%';
select distinct(title),bid from books order by  bid  desc;
select r.bid,title,avg(stars) from ratingBooks r,books b where b.bid=r.bid group by r.bid having avg(stars) > 5;
select distinct(r.bid),b.title,avg(stars) from ratingBooks r,books b where b.bid = r.bid and avg(stars) > 5 group by r.bid;

select distinct(title) from books where bid in (select bid from ratingBooks group by bid having avg(stars)>5) ; 
select distinct(title),stars from books b,ratingBooks r where b.bid = r.bid and b.bid in (select bid from ratingBooks group by bid having avg(stars)>5) ; 
