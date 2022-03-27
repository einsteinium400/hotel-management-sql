-- data insertion


-- INTO CITY
insert into city (name) values ("holon");
insert into city (name) values ("tel aviv");
insert into city (name) values ("jerusalem");
insert into city (name) values ("herzliya");
insert into city (name) values ("givatayim");
insert into city (name) values ("dimona");
insert into city (name) values ("arad");
insert into city (name) values ("afula");
insert into city (name) values ("bat yam");
insert into city (name) values ("natanya");
 
-- INTO ADDRESS
insert into address (city_id, street, street_number) values (1, "haroe", 13);
insert into address (city_id, street, street_number) values (2, "dizengoff", 12);
insert into address (city_id, street, street_number) values (3, "weizmann", 23);
insert into address (city_id, street, street_number) values (4, "nitzanim", 29);
insert into address (city_id, street, street_number) values (5, "prahim", 34);
insert into address (city_id, street, street_number) values (6, "yonim", 83);
insert into address (city_id, street, street_number) values (7, "ben gurion", 90);
insert into address (city_id, street, street_number) values (8, "anne frank", 23);
insert into address (city_id, street, street_number) values (9, "haezel", 20);
insert into address (city_id, street, street_number) values (10, "krinitzky", 90);

insert into address (city_id, street, street_number) values (1, "avshalom", 53);
insert into address (city_id, street, street_number) values (2, "jabotinsky", 42);
insert into address (city_id, street, street_number) values (3, "rabi akiva", 55);
insert into address (city_id, street, street_number) values (4, "arazim", 90);
insert into address (city_id, street, street_number) values (5, "melacha", 74);
insert into address (city_id, street, street_number) values (6, "yona hanavi", 100);
insert into address (city_id, street, street_number) values (7, "orim", 99);
insert into address (city_id, street, street_number) values (8, "avivim", 10);
insert into address (city_id, street, street_number) values (9, "zait", 20);
insert into address (city_id, street, street_number) values (10, "teena", 97);

-- select * from address a inner join city c on a.city_id=c.city_id order by address_id;

--  INTO CUSTOMER
insert into customer (first_name, last_name, phone_number, address_id) values ("aviv", "barazani", "0501726348",1);
insert into customer (first_name, last_name, phone_number, address_id) values ("moshe", "raviv", "0501787648",2);
insert into customer (first_name, last_name, phone_number, address_id) values ("nava", "avshalom", "0544178999",3);
insert into customer (first_name, last_name, phone_number, address_id) values ("limor", "israeli", "0543726394",4);
insert into customer (first_name, last_name, phone_number, address_id) values ("evyatar", "morel", "0543725555",5);
insert into customer (first_name, last_name, phone_number, address_id) values ("liri", "cohen", "0529876598",6);
insert into customer (first_name, last_name, phone_number, address_id) values ("miri", "cohen", "0529876999",7);
insert into customer (first_name, last_name, phone_number, address_id) values ("or", "levi", "0529876999",8);
insert into customer (first_name, last_name, phone_number, address_id) values ("ben", "amin", "0529867459",9);
insert into customer (first_name, last_name, phone_number, address_id) values ("lior", "moshe", "0529868877",10);


-- INTO JOBS
insert into jobs (title) values ("cleaner");
insert into jobs (title) values ("receptionist");


-- INTO EMPLOYEE
insert into employee (first_name, last_name, phone_number, address_id) values ("svetlana", "kirovsky", "0529868877",11);
insert into employee (first_name, last_name, phone_number, address_id) values ("kokhava", "shavit", "0521234536",12);
insert into employee (first_name, last_name, phone_number, address_id) values ("amnon", "titinsky", "0521629384",13);
insert into employee (first_name, last_name, phone_number, address_id) values ("anatoly", "kirilienko", "0528764983",14);
insert into employee (first_name, last_name, phone_number, address_id) values ("shira", "steinbuch", "0522638405",15);
insert into employee (first_name, last_name, phone_number, address_id) values ("isaskhar", "shkedi", "0521736492",16);
insert into employee (first_name, last_name, phone_number, address_id) values ("liat", "bismanovsky", "0526590543",17);
insert into employee (first_name, last_name, phone_number, address_id) values ("faid", "rash", "0529387492",18);
insert into employee (first_name, last_name, phone_number, address_id) values ("miri", "gotman", "0528776509",19);
insert into employee (first_name, last_name, phone_number, address_id) values ("liona", "shreder", "0528765999",20);


-- INTO EMPLOYEE_JOB
insert into employee_job (employee_id, job_id) values (10,2);
insert into employee_job (employee_id, job_id) values (9,1);
insert into employee_job (employee_id, job_id) values (8,2);
insert into employee_job (employee_id, job_id) values (7,1);
insert into employee_job (employee_id, job_id) values (6,2);
insert into employee_job (employee_id, job_id) values (5,1);
insert into employee_job (employee_id, job_id) values (4,2);
insert into employee_job (employee_id, job_id) values (3,1);
insert into employee_job (employee_id, job_id) values (3,2);
insert into employee_job (employee_id, job_id) values (2,2);
insert into employee_job (employee_id, job_id) values (1,1);


select * from employee_job;

-- INTO STATUS
insert into status (status_name) values ("availble");
insert into status (status_name) values ("unavaliable");
insert into status (status_name) values ("available await cleaning");


-- INTO BUILDING
insert into building(building_name) values ("roses");
insert into building(building_name) values ("orchid");
insert into building(building_name) values ("sunflower");
insert into building(building_name) values ("daisy");
insert into building(building_name) values ("iris");
insert into building(building_name) values ("tulip");

-- INTO ROOMS
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (100,4,1,1,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (300,3,2,2,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (200,2,4,5,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (500,2,4,4,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (700,5,4,6,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (500,2,3,4,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (700,5,2,3,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (300,2,4,3,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (400,2,3,1,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (500,2,2,2,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (650,2,1,3,1);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (780,2,2,4,1);

insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (350,2,4,6,3);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (440,3,3,6,3);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (570,4,2,5,3);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (850,5,1,4,3);
insert into room(daily_price, beds_quantity, floor, building_id, status_id) values (980,6,2,1,3);



-- INTO ORDERS

insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (1,2,3,"2021-07-22 18:07:20",now());
call price_upd(1);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (4,2,3,"2021-07-22 18:07:20",now());
call price_upd(2);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (3,8,10,"2021-07-29 13:27:02","2021-07-31 11:01:12");
call price_upd(3);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (12,6,4,"2021-08-03 10:46:53","2021-08-7 12:00:00");
call price_upd(4);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (11,7,8,"2021-05-12 08:24:31",null);
call price_upd(5);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (7,9,8,"2021-05-10 09:22:19","2021-05-016 11:04:07");
call price_upd(6);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (5,1,8,"2021-05-09 08:13:57","2021-05-14 14:37:11");
call price_upd(7);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (16,3,2,"2021-05-22 09:33:41","2021-05-26 15:10:05");
call price_upd(8);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (17,3,2,"2021-05-22 09:38:02","2021-05-24 11:32:19");
call price_upd(9);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (1,6,7,"2021-05-27 10:08:43","2021-05-29 10:21:22");
call price_upd(10);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (17,9,7,"2021-08-01 11:28:53","2021-08-14 10:01:02");
call price_upd(11);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (16,8,5,"2021-08-05 09:01:22","2021-08-25 13:34:21");
call price_upd(12);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (3,3,1,"2021-08-09 08:21:31","2021-08-29 11:11:01");
call price_upd(13);
insert into orders (room_id, customer_id, employee_id, start_date, end_date) values (5,5,5,"2021-08-010 08:21:31","2021-08-30 14:12:59");
call price_upd(14);

select * from employee_job;

call clean_log_update (1,3,"start");
call clean_log_update (1,3,"end");

call clean_log_update (2,3,"start");
call clean_log_update (2,3,"end");

call clean_log_update (5,3,"start");
call clean_log_update (5,3,"end");

call clean_log_update (9,7,"start");
call clean_log_update (9,7,"end");

call clean_log_update (11,7,"start");

call clean_log_update (15,5,"start");
call clean_log_update (15,5,"end");

call clean_log_update (16,9,"start");
call clean_log_update (16,9,"end");

call clean_log_update (17,9,"start");

-- select * from orders;

-- select * from status_log;

