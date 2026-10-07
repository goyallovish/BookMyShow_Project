create database BookMyShow;

use BookMyShow;

create table users
(
user_id int primary key,
name varchar(40),
email varchar(50),
phone varchar(30)
);

insert into users values
(1,'lovish','lovishgoyal@gmail.com','53947537583'),
(2,'rahul','rahulgoyal@gmail.com','676343237583'),
(3,'ravish','ravishgoyal@gmail.com','9898999983');

select * from users;

drop table users;

create table movies
(
movie_id int primary key,
title varchar(40),
genre varchar(50),
lang varchar(30),
duration int
);

insert into movies values
(1,'drishyam','crime','hindi',132),
(2,'dangal','comedy','hindi',122),
(3,'from','mystery','hindi',142),
(4,'pushpa','crime','telgu',178),
(5,'kgf','crime','hindi',142);

drop table movies;

select * from movies;

create table theaters
(
theater_id int primary key,
name varchar(40),
city varchar(50),
);

insert into theaters values
(1,'Gcinemea','Barnala'),
(2,'pvr','patiala'),	
(3,'imax','pune'),
(4,'cinepolix','agra'),
(5,'meeraj','nasik');

select * from theaters;


create table shows
(
show_id int primary key,
movie_id int,
theater_id int,
timing int,
available_seats int,
foreign key (movie_id) references movies(movie_id),
foreign key (theater_id) references theaters(theater_id)
);

alter table shows alter column timing varchar(30); 

drop table shows; 

select * from shows;

insert into shows values
(1,1,1,10,50),
(2,1,2,12,100),
(3,2,3,7,70),
(4,3,4,9,60),
(5,4,5,8,40),
(6,5,2,6,20);

UPDATE shows
SET timing = '6:00 PM'
WHERE show_id = 6;

create table seat(
seat_id int primary key,
show_id int,
seat_number varchar(10),
is_booked bit default 0,
foreign key (show_id) references shows(show_id)
);

insert into seat values
(1,1,'A1',0),(2,1,'A2',0),(3,1,'A3',0),(4,1,'A4',0),(5,1,'A5',0),
(6,2,'B1',0),(7,2,'B2',0),(8,2,'B3',0),(9,2,'B4',0),(10,2,'B5',0),
(11,3,'C1',0),(12,3,'C2',0),(13,3,'C3',0),(14,3,'C4',0),(15,3,'C5',0),
(16,4,'D1',0),(17,4,'D2',0),(18,4,'D3',0),(19,4,'D4',0),(20,4,'D5',0),
(21,5,'E1',0),(22,5,'E2',0),(23,5,'E3',0),(24,5,'E4',0),(25,5,'E5',0);

select * from seat;


create table bookings(
booking_id int primary key,
user_id int,
show_id int,
seat_booked varchar(30),
total_price decimal(10,2)
);

select * from bookings;
select * from seat;

update seat set is_booked = 1 where show_id = 1 and seat_number in ('A1','A2');

insert into bookings (user_id,show_id,seat_booked,total_price) values
(1,1,1,'A1,A2',400);
 