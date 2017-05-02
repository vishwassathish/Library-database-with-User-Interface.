-- CHANGE THE FILE LOCATION ACCORDINGLY !!!


\c library ;
--1
COPY books(bid, title, Author) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/books.csv' DELIMITER ',' CSV HEADER;

--2
COPY users(user_id, Username, Email_id, password) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/users.csv' DELIMITER ',' CSV HEADER;

--3
COPY userBooks(user_id, bid) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/userBooks.csv' DELIMITER ',' CSV HEADER;

--4
COPY ratingBooks(bid, user_id, comments, stars) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/ratingBooks.csv' DELIMITER ',' CSV 
HEADER;

--5
COPY magazines(mid, title, category) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/magazine.csv' DELIMITER ',' CSV HEADER;

--6
COPY Journals(jid, title, Writer, publishers) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/journal.csv' DELIMITER ',' CSV HEADER;

--7
COPY ratingMagazines(mid,user_id,comments,stars) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/ratingMagazine.csv' DELIMITER ',' CSV HEADER;

--8
COPY borrow(user_id, book_id, date_of_borrow, date_of_return) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/borrow.csv' DELIMITER ',' CSV HEADER;

--9
COPY blogs(blog_id, blogger_id, title, details) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/blog.csv' DELIMITER ',' CSV HEADER;

--10
COPY followers(blog_id, followers_id, comments) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/followers.csv' DELIMITER ',' CSV HEADER;

--10
COPY genre(bid, Genre) FROM '/home/quantum/Quantum/DBMS project/FinalLibrarySchema/genre.csv' DELIMITER ',' CSV HEADER;


