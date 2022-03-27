-- queries and functions

select * from orders;

--  QUERIES
--  -- 1
select * from room inner join status on room.status_id=status.status_id;
--  -- 2
select room_id,count(*) from orders group by room_id order by count(*) desc limit 10 ;
--  -- 3
select * from orders where (start_date between date_sub(now(),INTERVAL 2 WEEK) and now()) or (end_date between date_sub(now(),INTERVAL 2 WEEK) and now());
--  -- 4
select first_name, last_name, e.employee_id, count(*) as "how many rooms" from employee e inner join clean_log c on e.employee_id=c.employee_id group by employee_id order by count(*) desc limit 1;
--  -- 5
select c.first_name, c.last_name, o.order_id, o.room_id, o.start_date, o.end_date from orders o inner join customer c on c.customer_id=o.customer_id where (end_date is null or (end_date>now() and start_date<=now()));
--  -- 6
select first_name, last_name, count(*) as "how many orders" from orders o inner join customer c on c.customer_id=o.customer_id group by o.customer_id having count(*)>1;
--  -- 7
select sum(price) from orders  where (end_date between date_sub(now(),INTERVAL 4 WEEK) and now()) and (start_date<now());


-- FUNCTIONS
DELIMITER $$
CREATE FUNCTION
	room_status_show(rid int)  RETURNS varchar(100)
BEGIN
DECLARE room_stat varchar(100);
select status_name into room_stat from room r inner join status s on r.status_id=s.status_id where room_id=rid;
return room_stat;
END$$
DELIMITER ;

select room_status_show(11);

select * from room;


