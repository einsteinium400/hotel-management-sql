
-- check if a given employee is a receptionist. (needs to be a check constraint for order)

drop function IF EXISTS is_recept; 
DELIMITER $$
CREATE FUNCTION
	is_recept(empl_id int)  RETURNS integer
BEGIN
declare query_res int default 0;
select count(*) into query_res from employee_job where employee_id=empl_id and job_id=2;
return query_res;
END$$
DELIMITER ;


-- check if a given employee is a cleaner (needs to be a check constraint for clean log)

drop function IF EXISTS is_cleaner; 
DELIMITER $$
CREATE FUNCTION
	is_cleaner(empl_id int)  RETURNS integer
BEGIN
declare query_res int default 0;
select count(*) into query_res from employee_job where employee_id=empl_id and job_id=1;
return query_res;
END$$
DELIMITER ;

select is_recept(9);
select is_recept(4);

select is_cleaner(9);
select is_cleaner(4);

-- a function that checks if a room is available in a given date period (needs to be a check constraint for order)
drop procedure if exists is_room_avail;

delimiter $$
CREATE PROCEDURE is_room_avail(
in room_id_in int,
in start_date datetime,
in end_date datetime,
out is_not_avail int
)
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
declare start_t datetime;
declare end_t datetime;
declare room int;
declare flag_avail int default 0;

SELECT COUNT(*) FROM orders INTO n;
SET i=0;
WHILE i<n DO 
    select end_date from orders limit i,1 into end_t;
    select start_date from orders limit i,1 into start_t;
    select room_id from orders limit i,1 into room;
	-- insert into tst (st_date, en_date) values (end_t, start_t);
    if (
	((start_date<= end_t and start_t<=end_date)
    or (start_date<= start_t and start_t<=end_date)
    )
    and (room=room_id_in)
    )
    then set flag_avail=1;
    end if;
  SET i = i + 1;
END WHILE;
set is_not_avail=flag_avail;
End$$
-- delimiter;

select * from orders;

call is_room_avail(10, '2021-08-03 10:46:53', '2021-08-07 12:00:00', @flag);
select @flag;

call is_room_avail(12, '2021-08-03 10:46:53', '2021-08-07 12:00:00', @flag);
select @flag;
