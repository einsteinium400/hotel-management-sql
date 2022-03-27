-- HOTEL DB CREATION
-- TODO:
-- ADD CONSTRAINT if room is unavailable dont let order in future too
-- ADD CONSTRAINT FOR RECEPTIONIST IN ORDER
-- ADD CHECK IF CLEANER IN ROOM CLEAN LOG PROCEDURE


-- ADD LOGS TO CLEAN LOGS
-- ADD ORDERS
-- ADD CHECK ROOM AVAILIBILITY FOR FUTURE ORDERS
-- 


-- optional:
-- DERIVED ATTRIBUTE ORDER
-- https://stackoverflow.com/questions/49918232/how-to-create-derived-attribute
-- https://www.google.com/search?q=how+to+create+derived+attribute+in+sql&rlz=1C1CHBD_enIL839IL839&sxsrf=ALeKk02aefJSsnf-i-etjFDYqAT0d6xEFg%3A1627168310134&ei=Np78YKHkB5W9lwS7vLOIAQ&oq=derived+attribute+in+sql+how&gs_lcp=Cgdnd3Mtd2l6EAMYADIGCAAQFhAeMgYIABAWEB46BwgAEEcQsAM6BAgAEBM6CAgAEBYQHhATSgQIQRgAUKINWMwQYPUcaAFwAngAgAHGAYgB5gWSAQMwLjWYAQCgAQGqAQdnd3Mtd2l6yAEIwAEB&sclient=gws-wiz

-- CODE FOR DATABASE CREATION-- 
drop database if exists hotel;

create database hotel;
use hotel;

SET GLOBAL log_bin_trust_function_creators = 1;


 create table city(
	city_id int auto_increment primary key,
    name varchar(100) not null
 );
 
 create table address(
	address_id int auto_increment primary key,
	city_id int not null,
    street varchar(100) not null,
    street_number int not null,
    foreign key (city_id) references city(city_id)
    on delete cascade on update cascade
 );
 

create table customer(
	customer_id int auto_increment primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    phone_number varchar(10) not null,
    address_id int not null,
    foreign key (address_id) references address(address_id)
	on delete cascade on update cascade
 );
 
 create table jobs(
	job_id int auto_increment primary key,
    title varchar(100) not null
);

create table employee(
	employee_id int auto_increment primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    phone_number varchar(100) not null,
    address_id int not null,
	foreign key (address_id) references address(address_id)
	on delete cascade on update cascade
);
 
--  drop table  IF EXISTS employee_job;
 create table employee_job(
	employee_id int,
    job_id int not null,
    foreign key (employee_id) references employee(employee_id)
    on delete cascade on update cascade,
    foreign key (job_id) references jobs(job_id)
	on delete cascade on update cascade,
    primary key(employee_id, job_id)
 );
 
 create table status(
	status_id int primary key auto_increment,
    status_name varchar(100) not null
 );
 
 create table building(
	building_id int primary key auto_increment,
    building_name varchar(100) not null
 );
 
 create table room(
	room_id int primary key auto_increment,
    daily_price int not null,
    beds_quantity tinyint  not null,
    floor int  not null,
    building_id int  not null,
	status_id int  not null,
    foreign key(building_id) references building(building_id)
    on delete cascade on update cascade,
    foreign key(status_id) references status(status_id)
    on delete cascade on update cascade,
	check (0<floor<22)
 );
 -- ADD CHECK CONSTRAINT ON THE FLOOR

 

-- drop table  IF EXISTS orders;
 create table orders(
	order_id int primary key auto_increment,
    room_id int not null,
    customer_id int not null,
    employee_id int not null,
    start_date datetime not null,
    end_date datetime,
    price int,
	foreign key(customer_id) references customer(customer_id)
    on delete cascade on update cascade,
	foreign key(employee_id) references employee(employee_id)
    on delete cascade on update cascade,
	foreign key(room_id) references room(room_id)
    on delete cascade on update cascade,
    check (start_date<end_date)
	-- check (is_recept()=1)
 );
 

--  ALTER TABLE orders
-- ADD CONSTRAINT CHK_PersonAge CHECK (is_recept()=1);
--  
 
 DELIMITER $$
CREATE PROCEDURE price_upd(in order_id_in int)
BEGIN
	DECLARE daily_room_price INT;
	DECLARE total_price INT;
	DECLARE date_difference INT;

	set daily_room_price = (select daily_price from room where room_id=(select room_id from orders where order_id=order_id_in));
    set date_difference = (select DATEDIFF((select start_date from orders where order_id=order_id_in),  (select end_date from orders where order_id=order_id_in)));
    set total_price= date_difference*daily_room_price;
    -- set date_difference as 
     update orders set price=(abs(total_price)) where order_id=order_id_in;
END$$
DELIMITER ;
 
 
 
 create table status_log(
	log_id int primary key auto_increment,
    room_id int not null,
    status_id int not null,
    change_date datetime not null,
    order_id int not null,
	foreign key(room_id) references room(room_id)
    on delete cascade on update cascade,
	foreign key(status_id) references status(status_id)
    on delete cascade on update cascade,
	foreign key(order_id) references orders(order_id)
    on delete cascade on update cascade
 );
 
 -- drop table  IF EXISTS  clean_log;
  create table clean_log(
	log_id int primary key auto_increment,
    room_id int not null,
    employee_id int not null,
	start_date datetime,
    end_date datetime,
	foreign key(room_id) references room(room_id)
    on delete cascade on update cascade,
	foreign key(employee_id) references employee(employee_id)
    on delete cascade on update cascade
 );
 
 -- END OF DB CREATION
 
 
 -- PROCEDURES
 
 -- 1
DELIMITER $$
CREATE PROCEDURE clean_log_update(  
IN room_id_in int ,
IN employee_id_in int ,
IN end_or_start VARCHAR(20) )
BEGIN
	-- if its end of cleaning
    IF( end_or_start= "end") THEN
		update clean_log set end_date=now() where (room_id=room_id_in and employee_id=employee_id_in and end_date is NULL);
    END IF;

    IF( end_or_start= "start") THEN
		insert into clean_log (room_id, employee_id, start_date, end_date) values (room_id_in, employee_id_in, now(), NULL);
    END IF;

END $$
DELIMITER ;



 -- 2 
 
DELIMITER $$
CREATE PROCEDURE update_status(  
IN order_id_in int,
out change_flag int )

BEGIN
-- update room set status_id=2 where room_id=1;
set change_flag=0;
if ((select end_date from orders where order_id=order_id_in) is null ||
   ((now()<(select end_date from orders where order_id=order_id_in) &&
    now()>(select start_date from orders where order_id=order_id_in) )))
	then update room set status_id=2 where room_id=(select room_id from orders where order_id=order_id_in);
    set change_flag= 1;
    end if;
    END $$
DELIMITER ;

-- TRIGGER FOR PROCEDURE 2 TO HAPPEN AFTER EACH ORDER IS BEING MADE
DELIMITER $$
CREATE TRIGGER change_room_status after insert on orders for each row
begin
	-- SET FOREIGN_KEY_CHECKS=0;
	call update_status(new.order_id, @change_flg); 
	call update_status_log(new.order_id, @change_flg);
end;
$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE update_status_log(  
IN order_id_in int, in change_flag int )
BEGIN
	declare stat_id INT;
    declare roo_id INT;
    IF( change_flag=1) THEN
		set roo_id=(select room_id from orders where order_id=order_id_in);
		set stat_id = (select status_id from room where room_id=(select room_id from orders where order_id=order_id_in));
		insert into status_log (room_id, status_id, change_date, order_id) values (roo_id, stat_id, now(), order_id_in);
    END IF;

END $$
DELIMITER ;

