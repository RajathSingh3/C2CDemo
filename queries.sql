CREATE DATABASE airline;

use airline;

CREATE TABLE customer (
        cid int AUTO_INCREMENT,
        cname varchar(255) NOT NULL,
        address varchar(255) NOT NULL,
        email varchar(255) NOT NULL,
        phone int NOT NULL,
	PRIMARY KEY(cid)
     );

CREATE TABLE flight (
        fid int,
        destination varchar(255) NOT NULL,
        start varchar(255) NOT NULL,
        cost int NOT NULL,
        noofseats int NOT NULL,
	date date NOT NULL,
	PRIMARY KEY(fid)
     );

CREATE TABLE booking (
        bid int AUTO_INCREMENT,
	c_id int NOT NULL,
	f_id int NOT NULL,
	PRIMARY KEY(bid),
	FOREIGN KEY (c_id) REFERENCES customer(cid),
	FOREIGN KEY (f_id) REFERENCES flight(fid)
     );

insert into customer(cname, address, email, phone) values('RJ', 'Bangalore', 'rj@gmail.com',87878);
insert into customer(cname, address, email, phone) values('AJ', 'Bangalore', 'aj@gmail.com',67868);
insert into customer(cname, address, email, phone) values('MJ', 'Bangalore', 'mj@gmail.com',76878);
insert into customer(cname, address, email, phone) values('Mike', 'Bangalore', 'mike@gmail.com',67878);

insert into flight values(1000, 'Mumbai', 'Bangalore', 5000, 100, '2022-09-12');
insert into flight values(1025, 'Pune', 'Kolkata', 4000, 100, '2022-09-13');
insert into flight values(1050, 'Kolkata', 'Bangalore', 7000, 100, '2022-09-14');
insert into flight values(1075, 'Bangalore', 'Chandigarh', 9000, 100, '2022-09-15');

insert into booking(c_id,f_id) values(1, 1000);
insert into booking(c_id,f_id) values(2, 1025);
insert into booking(c_id,f_id) values(3, 1050);
insert into booking(c_id,f_id) values(4, 1075);
insert into booking(c_id,f_id) values(1, 1075);
insert into booking(c_id,f_id) values(3, 1075);

select * from customer;
select * from flight;
select * from booking;

create view flightcount as
select f.fid, count(b.f_id)
from flight as f, booking as b
where f.fid=b.f_id
GROUP By b.f_id;

select * from flightcount;

create view customerdetails as
select c.cid, c.cname, f.fid, f.destination, f.start, f.cost
from customer as c, flight as f, booking as b
where c.cid = b.c_id AND f.fid=b.f_id;

select * from customerdetails where cid=1;

create view flightrevenue as
select f.fid, f.cost * count(b.f_id) as revenue
from flight as f, booking as b
where f.fid = b.f_id
GROUP BY b.f_id;

select * from flightrevenue;

changes again

