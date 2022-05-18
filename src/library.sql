drop table if exists book;
drop table if exists author;
drop table if exists book_to_author_map;
drop table if exists customer;
drop table if exists event;

create table book (
                      id int primary key,
                      title varchar(100) not null,
                      genre varchar(100)
    ,year_published int
    ,available bit not null
);

create table author (
                        id int primary key
    ,first_name varchar(100)
    ,last_name varchar(100)
);

create table book_to_author_map (
                                    book_id int not null
    ,author_id int not null
);

create table customer (
                          id int primary key
    ,name varchar(100) not null
);

create table event (
                       id integer IDENTITY(1,1) primary key,
                       event_type varchar(50) not null,
                       customer_id int not null,book_id int not null,
                       date_time varchar(50) not null
);

insert into book(id, title, genre, year_published, available) values (1, 'A Tale of Two Cities', 'Historical drama', 1859, 1);
insert into book(id, title, genre, year_published, available) values (2, 'Oliver Twist', 'Novel', 1837, 0);
insert into book(id, title, genre, year_published, available) values (3, 'Moby Dick', 'Novel', 1851, 0);
insert into book(id, title, genre, year_published, available) values (4, 'Never Let Me Go', 'Speculative fiction', 2005, 1);
insert into book(id, title, genre, year_published, available) values (5, 'The Left Hand of Darkness', 'Speculative fiction', 1969, 1);
insert into book(id, title, genre, year_published, available) values (6, 'The Gilded Age', 'Novel', 1873, 1);
insert into book(id, title, genre, year_published, available) values (7, 'The Adventures of Tom Sawyer', 'Satire', 1876, 1);
insert into book(id, title, genre, year_published, available) values (8, 'Beowulf', 'Epic', 1000, 1);

insert into author(id, first_name, last_name) values (1, 'Charles', 'Dickens');
insert into author(id, first_name, last_name) values (2, 'Herman', 'Melville');
insert into author(id, first_name, last_name) values (3, 'Kazuo', 'Ishiguro');
insert into author(id, first_name, last_name) values (4, 'Ursula', 'Le Guin');
insert into author(id, first_name, last_name) values (5, 'Mark', 'Twain');
insert into author(id, first_name, last_name) values (6, 'Charles Dudley', 'Warner');
insert into author(id, first_name, last_name) values (7, 'Aldous', 'Huxley');

insert into book_to_author_map(book_id, author_id) values (1, 1);
insert into book_to_author_map(book_id, author_id) values (2, 1);
insert into book_to_author_map(book_id, author_id) values (3, 2);
insert into book_to_author_map(book_id, author_id) values (4, 3);
insert into book_to_author_map(book_id, author_id) values (5, 4);
insert into book_to_author_map(book_id, author_id) values (6, 5);
insert into book_to_author_map(book_id, author_id) values (6, 6);
insert into book_to_author_map(book_id, author_id) values (7, 5);

insert into customer(id, name) values (20000, 'Aaron Meyers');
insert into customer(id, name) values (20001, 'Paula Vasquez');
insert into customer(id, name) values (20002, 'Debra Olson');
insert into customer(id, name) values (20003, 'Matt Nguyen');

insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20001, 4, '2015-10-18 17:32');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkin', 20001, 4, '2015-11-27 18:11');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20000, 3, '2015-10-22 14:56');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkin', 20000, 3, '2015-10-29 8:22');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20003, 3, '2015-10-29 10:03');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkin', 20003, 3, '2015-11-04 11:15');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20001, 1, '2015-11-15 12:00');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkin', 20001, 1, '2015-12-08 19:34');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20002, 5, '2015-11-15 08:44');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20002, 6, '2015-11-15 08:44');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkin', 20002, 5, '2015-12-01 09:20');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkin', 20002, 6, '2015-11-20 10:13');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20002, 2, '2015-12-30 11:08');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20000, 3, '2015-12-15 15:57');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20000, 6, '2015-12-15 15:57');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkout', 20001, 1, '2015-12-15 13:05');
insert into event(event_type, customer_id, book_id, date_time) values ('Checkin', 20001, 1, '2015-12-30 14:59');
insert into event(event_type, customer_id, book_id, date_time) values ('Lost', 20000, 3, '2015-12-30 16:46');

--BASICS

-- Meditate on selecting all columns from a table
select * from book
;
-- Meditate on selecting one column (title) from a table
select _____ from book;

-- Meditate on selecting some columns (title, available) from a table
select _____, _____ from book;

-- Meditate on adding a new book
insert into book(title, genre, year_published, available)
values('_____', '_____', _____, 1);

-- Meditate on adding two new books
insert into book(title, genre, year_published, available)
values('_____', '_____', _____, 1)
     ,('_____', '_____', _____, 1);

--UPDATE DELETE

-- Meditate on changing data with "UPDATE"
_____ book
set available = 1
where id = 2;

-- Meditate on removing data with "DELETE"
_____ from customer
where id = 20001;

--PRESENTATION

-- Meditate on aliasing columns: present the year_published column as "Publication Date"
select title, year_published as "_____"
from book

-- Meditate on sorting with "ORDER BY": sort by customer name
select * from customer
order by _____

-- Meditate on multiple sorts: sort by genre, then title
select * from book
order by _____, _____

-- Meditate on "DESC" keyword
select * from event
order by datetime _____

--FILTERING

-- Meditate on filtering results with WHERE: select all novels
select * from book
where genre = '_____';

-- Meditate on the != operator: select all books that are not novels
select * from book
where _____ != '_____';

-- Meditate on the <> operator: select all books that are not novels
select * from book
where _____ _____ '_____';

-- Meditate on the "in" operator: select all novels and satires
select * from book
where _____ in ('_____', '_____');

-- Meditate on the "not in" operator: select all books that are not novels or satires
select * from book
where _____ not in ('_____', '_____');

-- Meditate on the > operator: select all books published after 1900
select * from book
where _____ > _____;

-- Meditate on the "like" and % operators: select all books that start with 'The'
select * from _____
    _____ title like '_____%';

-- Meditate on the "like" and % operators: select all books that contain 'of'
select * from _____
where _____ _____ '%_____%';

-- Meditate on the "and" operator: select all books published before 1900 that are available
select * from book
where _____ _____ _____
  and _____ _____ _____;

-- Meditate on the "or" operator: select all books that start with 'The' OR are available
select * from book
where _____ _____ _____
   or _____ _____ _____;

--JOINS

-- Meditate on the "INNER JOIN" keyword to link tables
select *
from customer
    _____ _____ event on customer.id = event.customer_id;

-- Meditate on the "INNER" being implicit
select *
from customer
    _____ event on customer.id = event.customer_id;

-- Meditate on join conditions
select *
from customer
         join event on _____ = _____;

-- Meditate on limiting columns in joins
select _____.name, _____.datetime
from customer
    join event on customer.id = event.customer_id;

-- Meditate on aliasing tables
select *
from customer c
         join event e on _____.id = _____.customer_id;

-- Meditate on multiple joins
select e.id, e.type, e.datetime, c.id, c.name, b.title
from event e
         join customer c on _____.customer_id = _____.id
    join book b on _____.book_id = _____.id;

-- Meditate on the "LEFT JOIN" keyword
select b.*, e.datetime
from book b
    _____ join event e on b.id = e.book_id;

--RELATIONSHIPS

-- Meditate on ONE-TO-MANY relationships
select *
from customer c
         join event e on _____ = _____
where c.id = 20001;

-- Meditate on MANY-TO-ONE relationships
select e.*, b.id, b.title
from event e
         join book b on _____ = _____
where b.id = 1;

-- Meditate on MANY-TO-MANY relationships
select a.first_name, a.last_name, b.title
from book b
         join book_to_author_map btam on _____.id = _____.book_id
    join author a on _____.author_id = _____.id
where author_id in (1, 5, 6);

-- Meditate on using subqueries with IN
select * from event
where customer_id _____ (
    select customer_id from event
    where type = 'Lost'
)
order by customer_id desc;

-- Meditate on WITH to create a Common Table Expression query
_____ book_losers as (
    select customer_id from event
    where type = 'Lost'
)
select e.* from book_losers bl
                    join event e on bl.customer_id = e.customer_id
order by customer_id desc;

-- Meditate on using subqueries for deleting data
delete from _____
where _____ in (
    select book_id
    from event
    where type = 'Lost'
    );

--AGGREGATES

-- Meditate on counting rows with COUNT
select _____(*) from book;

-- Meditate on counting within groups with GROUP BY
select genre, count(*)
from book
    _____ _____ genre;

-- Meditate on MAX
select _____(year_published) from book;

-- Meditate on MIN
select _____(year_published) from book;

-- Meditate on getting the maximums within genre
select genre, _____(year_published)
from book
    _____ _____ _____;

-- Meditate on joining data with aggregates
select name, count(*)
from customer join event on _____ = _____
group by _____;

--SUBQUERIES

-- Meditate on using subqueries with IN
select * from event
where customer_id _____ (
    select customer_id from event
    where type = 'Lost'
)
order by datetime desc;

-- Meditate on WITH to create a Common Table Expression query
_____ book_losers as (
    select customer_id from event
    where type = 'Lost';
)
select e.* from book_losers bl
                    join event e on bl.customer_id = e.customer_id
order by datetime desc;

-- Meditate on using subqueries for deleting data
delete from _____
where _____ in (
    select book_id
    from event
    where type = 'Lost'
    );
