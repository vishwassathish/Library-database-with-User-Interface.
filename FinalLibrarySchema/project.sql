drop database library ;
create database library ;

\c library ;

drop table followers;
drop table blogs;
drop table borrow;
drop table ratingMagazines;
drop table Journals;
drop table magazines;
drop table ratingBooks;
drop table userBooks;
drop table users;
drop table books;


--1
create table books(
bid varchar(4) ,
title varchar(50),
Author varchar(50),
primary key(bid)
);

--2
create table users(
user_id	int primary key,
Username varchar(50),
Email_id varchar(320),
password varchar 
);

--3
create table userBooks(
user_id int ,
bid varchar(4),
foreign key(user_id) references users(user_id) on delete cascade,
foreign key(bid) references books(bid) on delete cascade
);

--4
create table ratingBooks(
bid varchar(4),
user_id int,
comments varchar,
stars int,
foreign key(bid) references books(bid) on delete cascade,
foreign key(user_id) references users(user_id) on delete cascade
);

--5
create table magazines(
mid varchar primary key,
title varchar,
category varchar
);

--6
create table Journals(
jid varchar primary key,
title varchar,
Writer varchar,
publishers varchar
);

--7
create table ratingMagazines(
mid varchar,
user_id int,
comments varchar,
stars int,
foreign key(mid) references magazines(mid) on delete cascade,
foreign key(user_id) references users(user_id) on delete cascade
);

--8
create table borrow(
user_id int,
book_id varchar,
date_of_borrow date,
date_of_return date,
foreign key(user_id) references users(user_id) on delete cascade,
foreign key(book_id) references books(bid) on delete cascade
);

--9
create table blogs(
blog_id varchar primary key,
blogger_id int,
title varchar,
details varchar,
foreign key(blogger_id) references users(user_id) on delete cascade
);

--10
create table followers(
blog_id varchar,
followers_id varchar,
comments varchar,
foreign key(blog_id) references blogs(blog_id) on delete cascade
);

--11
create table genre(
bid varchar(4),
Genre varchar(20),
foreign key(bid) references books(bid) on delete cascade
) ;



