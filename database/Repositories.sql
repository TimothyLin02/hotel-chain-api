-- Room Repository

select * from room where hotel_id=1 order by room_number;

select * from room_amenity where hotel_id = 1;

insert into room (room_number, capacity, extendable, price, view, hotel_id)
values ('490', 8, false, '461', 'sea view', 1);

-- RoomAmenity Repository

insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '049', 6);


-- Office Repository

select * from office where brand_id = 1;

	-- office_id is generated by database
	-- This is different from insert we use to setup database
insert into office (address, email, is_main, phone_number, brand_id) 
values ('3642  Lamberts Branch Road, Toronto, Ontario, Canada ','MariotteOfficeEmail@gmail.com',True,'801-223-9724',1);


-- Hotel Repository

select * from hotel where brand_id = 1 order by hotel_id;

select * from hotel where hotel_id = 1;


	-- hotel_id is generated by database
	-- This is different from insert we use to setup database
insert into hotel (address, email, brand_id, phone_number, stars, total_number_of_rooms)
values ('3321 Bronson Road, Toronto, Ontario, Canada','MariotteTorontoHotel@gmail.com',1,'602-356-4242',4,140),


update hotel set total_number_of_rooms = (select count(*) from room where hotel_id = 1) where hotel_id = 1;


-- HotelBrand Repository

SELECT * FROM hotel_brand;

select * from hotel_brand where brand_id = 1;

	-- brand_id is generated by database
	-- This is different from insert we use to setup database
insert into hotel_brand (hotel_name, number_of_hotels)
values ('Mariotte',5);



-- Employee Repository

select * from employee where hotel_id = 1 order by employee_id;

select * from employee order by employee_id;

select * from employee where employee_id = 1;

	-- employee_id is generated by database
	-- This is different from insert we use to setup database
insert into employee (home_address, first_name, last_name, middle_name, password, hotel_id, sin, user_name, salary, manager_id, role) 
values ('3 Maryland Trail', 'Berke', 'Tomas', 'Forint', 'HUF', 1, '575-47-2372', 'IDR', 163079, null, 'Help Desk Operator');


-- Customer Repository

SELECT * FROM customer order by custid;

select * from customer where custid = 1;

	-- custid is generated by database
	-- This is different from insert we use to setup database
insert into customer (address, first_name, last_name, password, registration_date, sin, user_name, brand_id, phone_number) 
values ('05574 Forster Road', 'Rosabelle', 'Dank', 'CNY', '2020-09-03', '189-98-8867', 'IDR', 1, '416-123-4567');


-- Booking Repository

	-- booking_id is generated by database
	-- This is different from insert we use to setup database
insert into booking (state, custid, cost, end_date, start_date, time_stamp, employee_id) 
values ('Booking', '2', '1020', '2020-04-11', '2020-04-09', '2020-01-01', 1);

	-- later, when we insert same booking_id but different state:
insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp, employee_id) 
values (1, 'Renting', '2', '1020', '2020-04-11', '2020-04-09', '2020-01-01', 1);


select * from booking;

select * from booking where booking_id = 1;

select * from booking where booking_id = 1 and state = 'Booking';


-- BookedRoom Repository

insert into booked_room (booking_id, hotel_id, state, room_number, capacity, extendable, occupancy, price, view)
values (1, 1, 'Renting', '490', 8, false, 2, '461', 'sea view');

select * from booked_room where booking_id = 1 and state = 'Booking';


-- BookedAmenity Repository

insert into booked_amenity(booking_id, hotel_id, state, room_number, amenity_id, amenity)
values (1, 1, 'Renting', '490', 6, 'pie turndown service');

select * from booked_amenity where booking_id = 1 and state = 'Renting' and hotel_id = 1 and room_number = '490';


-- Amenity Repository

SELECT * FROM amenity;

select * from amenity where amenity_id IN (1,3,5);

select * from hotel_amenity where hotel_id = 1;

	-- amenity_id is generated by database
	-- This is different from insert we use to setup database
insert into amenity (amenity) values ('pie turndown service');

