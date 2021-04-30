--set search_path="hoteldb";

-- In this file, we generate following records:
-- total 6 hotel_brands
-- total 30 hotels
-- total 150 rooms
-- total 8 amenities
-- total 180 employees (30 managers)
-- total 20 customers
-- total 6 office
-- total 174 hotel-amenity mappings
-- total 78 room-amenity mappings
-- total 8 rented bookings, 1 room each booking

insert into hotel_brand(brand_id,hotel_name,number_of_hotels) 
	values 
		(1,'Mariotte',5),
		(2,'Tipton',5),
		(3,'Four Seasons',5),
		(4,'Holiday Inn',5),
		(5,'Westin',5),
		(6,'Hotel Land',5);

insert into office(office_id,address,email,is_main,phone_number,brand_id) 
	values 
		(1,'3642  Lamberts Branch Road, Toronto, Ontario, Canada ','MariotteOfficeEmail@gmail.com',True,'801-223-9724',1),
		(2,'4476  Smith Street, Boston,Massachusetts , Unite-States','TiptonHotelOffice@gmail.com',True,'508-823-7713',2),
		(3,'4194  Twin Oaks Drive, Vancouver, British Columbia, Canada',' OfficeFourSeasons@hotmail.com',True,'231-526-7991',3),
		(4,'1604  Par Drive, Ottawa, Ontario, Canada','OfficeHolidayInn@gmail.com',True,'805-897-9441',4),
		(5,'132  Oak Street, London, Greater London, United Kingdoms','WestinOffice@gmail.com',True,'734-845-6544',5),
		(6,'913  Eagle Drive, Montreal, Quebec, Canada','HotelLandOfficeEmail@hotmail.com',True,'980-621-2280',6);

insert into hotel(hotel_id,address,email,phone_number,stars,total_number_of_rooms,brand_id)
	values 
		(1,'3321 Bronson Road, Toronto, Ontario, Canada','MariotteTorontoHotel@gmail.com','602-356-4242',4,140,1),
		(2,'4123 Birch Road, Ottawa, Ontario, Canada','MariotteOttawaHotel@gmail.com','613-828-3629',5,80,1),
		(3,'9723 Cheril Road, Vancouver, British Colombia, Canada','MariotteVancouverHotel@gmail.com','513-231-9327',2,125,1),
		(4,'1836 Leaf Road, Los Angeles, Calirfornia, United-States','MariotteLAHotel@gmail.com','857-223-6784',1,235,1),
		(5,'1496 Harold Road, Houston, Texas, United-States ','MariotteHoustonHotel@gmail.com','314-234-6544',5,190,1),
		
		(6,'9317 Belle Road, Toronto, Ontario, Canada','TiptonTorontoHotel@gmail.com','412-356-1455',5,160,2),
		(7,'9976 James Road, Ottawa, Ontario, Canada','TiptonOttawaHotel@gmail.com','122-444-2311',4,65,2),
		(8,'241 Bronson Road, Vancouver, British Colombia, Canada','TiptonVancouverHotel@gmail.com','551-233-1231',2,120,2),
		(9,'3130 Bolder Road, Boston, Massachusetts, United-States','BostonHotel@gmail.com','555-123-2311',5,200,2),
		(10,'1222 St-Joseph Street, Montreal, Quebec, Canada','TiptonMontrealHotel@gmail.com','324-456-2211',3,220,2),
		
		(11,'1235 Marshall Road, Ottawa, Ontario, Canada','FourSeasonsOttawa@gmail.com','613-234-3222',5,99,3),
		(12,'5123 Davidson Road, Toronto, Ontario, Canada','FourSeasonsToronto@gmail.com','514-874-9223',4,123,3),
		(13,'315 14 ave, New York, New york, United-States','FourSeasonsNY@gmail.com','332-231-5566',3,150,3),
		(14,'8584 Oak Road, Toronto, Boston, Massachusetts, United-States','FourSeasonsBoston@gmail.com','441-234-5889',2,144,3),
		(15,'8264 Red Lake Road, Montreal, Quebec, Canada','FourSeasonsMontreal@gmail.com','555-352-1100',3,132,3),
		
		(16,'2325 Valley Road, Ottawa, Ontario, Canada','HolidayInnOttawa@gmail.com','123-555-5123',3,68,4),
		(17,'523 Bird Road, Boston, Massachusetts, United-States','HolidayInnBoston@gmail.com','351-556-2315',1,130,4),
		(18,'231 Frog Road,New York, New york, United-States','HolidayInnNY@gmail.com','231-551-3151',3,220,4),
		(19,'443 Lion Road, Houston, Texas, United-States','HolidayInnHouston@gmail.com','123-551-4217',5,185,4),
		(20,'1550 Ram Road, Toronto, Ontario, Canada','HolidayInnToronto@gmail.com','886-231-5781',4,112,4),
		
		(21,'4103 Rogers Street, Ottawa, British Colombia, Canada','WestinOttawa@gmail.com','602-356-4242',5,90,5),
		(22,'22 Steve Road, Vancouver, Ontario, Canada','WestinVancouver@gmail.com','602-356-4242',5,150,5),
		(23,'355 Tony Road, Toronto, Ontario, Canada','WestinToronto@gmail.com','602-356-4242',5,160,5),
		(24,'112 Brodi Road, Montreal, Quebec, Canada','WestinMontreal@gmail.com','602-356-4242',3,220,5),
		(25,'665 Randall Road, Edmonton, Alberta, Canada','WestinEdmonton@gmail.com','602-356-4242',4,70,5),
		
		(26,'1244 Captain Road, Ottawa, Ontario, Canada','HotelLandOttawa@gmail.com','613-424-3333',2,55,6),
		(27,'7765 Private Road, Toronto, Ontario, Canada','HotelLandToronto@gmail.com','514-231-6650',4,70,6),
		(28,'88 General Road, Los Angeles, California, United-States','HotelLandLA@gmail.com','413-231-5512',4,100,6),
		(29,'67 Admiral Road, Houston, Texas, United-States','HotelLandTexas@gmail.com','664-127-7751',4,99,6),
		(30,'889 Leader Road, New York, New York, United-States','HotelLandNY@gmail.com','589-785-5711',4,112,6);

insert into amenity(amenity_id, amenity)
	values
		(1, 'free parking'),
		(2, 'free breakfirst'),
		(3, 'free WIFI Internet'),
		(4, 'celebrity wake-up calls'),
		(5, 'in-room arcade games'),
		(6, 'pie turndown service'),
		(7, 'in-room cocktails stations'),
		(8, 'free gym or fitness center');

insert into customer (custid, brand_id, first_name, last_name, address, password, user_name, registration_date, sin, phone_number) 
	values
		(1, 1, 'Rosabelle', 'Dank', '05574 Forster Road', 'CNY', 'IDR', '2020-09-03', '189-98-8867', '416-123-4567'),
		(2, 2, 'Arabel', 'Wyse', '50949 Sauthoff Place', 'GTQ', 'IDR', '2020-10-09', '171-84-2496', '416-123-4567'),
		(3, 3, 'Burtie', 'Dawes', '60160 Golf View Center', 'CNY', 'RSD', '2020-09-21', '639-48-8172', '416-123-4567'),
		(4, 4, 'Salaidh', 'Simonard', '97616 Starling Lane', 'CUP', 'MXN', '2020-12-21', '324-21-8015', '416-123-4567'),
		(5, 5, 'Marna', 'Altoft', '160 Jenna Park', 'PLN', 'HRK', '2020-08-14', '626-43-8408', '416-123-4567'),
		(6, 6, 'Edsel', 'Ghiron', '869 Northfield Circle', 'EUR', 'PLN', '2020-12-04', '175-60-8538', '416-123-4567'),
		(7, 1, 'Kingsley', 'Dumberell', '23 Dwight Avenue', 'PHP', 'NGN', '2020-12-15', '265-14-6888', '416-123-4567'),
		(8, 2, 'Myrah', 'Chattelaine', '1 Lukken Road', 'PLN', 'EUR', '2020-08-30', '881-34-6782', '416-123-4567'),
		(9, 3, 'Meade', 'Brafield', '42 Melby Plaza', 'CAD', 'CNY', '2020-08-24', '179-29-5318', '416-123-4567'),
		(10, 4, 'Bryan', 'Chiommienti', '24620 Kedzie Crossing', 'NGN', 'ARS', '2020-11-21', '427-52-5799', '416-123-4567'),
		(11, 5, 'Berke', 'Tomas', '1 Commercial Park', 'CNY', 'IDR', '2020-09-03', '189-98-8867', '416-123-4567'),
		(12, 6, 'Stern', 'Pizzey', '50949 Sauthoff Place', 'GTQ', 'IDR', '2020-10-09', '171-84-2496', '416-123-4567'),
		(13, 3, 'Sebastiano', 'Huglin', '60160 Golf View Center', 'CNY', 'RSD', '2020-09-21', '639-48-8172', '416-123-4567'),
		(14, 4, 'Ada', 'Selburn', '97616 Starling Lane', 'CUP', 'MXN', '2020-12-21', '324-21-8015', '416-123-4567'),
		(15, 5, 'Jewell', 'Margaret', '13 Village Road', 'PLN', 'HRK', '2020-08-14', '626-43-8408', '416-123-4567'),
		(16, 6, 'Peinton', 'Won', '82808 Summit Park', 'EUR', 'PLN', '2020-12-04', '175-60-8538', '416-123-4567'),
		(17, 1, 'Dalia', 'Larby', '5 Carioca Park', 'PHP', 'NGN', '2020-12-15', '265-14-6888', '416-123-4567'),
		(18, 2, 'Pilley', 'Koruna', '0204 David Drive', 'PLN', 'EUR', '2020-08-30', '881-34-6782', '416-123-4567'),
		(19, 3, 'MacCumeskey', 'Krona', '118 Hagan Pass', 'CAD', 'CNY', '2020-08-24', '179-29-5318', '416-123-4567'),
		(20, 4, 'Seers', 'Rupiah', '86 Graedel Circle', 'NGN', 'ARS', '2020-11-21', '427-52-5799', '416-123-4567');
		
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (1, 'Berke', 'Tomas', 'Forint', '3 Maryland Trail', 1, 'HUF', 'IDR', 163079, 'Help Desk Operator', null, '575-47-2372');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (2, 'Stern', 'Pizzey', null, '1 Commercial Park', 1, 'MVR', 'PLN', 71274, 'Programmer Analyst IV', null, '787-29-8707');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (3, 'Sebastiano', 'Huglin', null, '0106 Dayton Place', 1, 'ARS', 'THB', 199243, 'Director of Sales', null, '865-12-7583');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (4, 'Ada', 'Selburn', null, '5 Sugar Drive', 1, 'GTQ', 'KWD', 38228, 'Chemical Engineer', null, '613-33-6450');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (5, 'Jewell', 'Margaret', null, '13 Village Road', 1, 'CNY', 'PHP', 185692, 'Accountant IV', null, '492-08-9641');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (6, 'Dalia', 'Larby', null, '5 Carioca Park', 2, 'CZK', 'SYP', 146937, 'Physical Therapy Assistant', null, '247-98-0691');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (7, 'Ahmed', 'MacCumeskey', 'Krona', '118 Hagan Pass', 2, 'SEK', 'IQD', 45854, 'Analog Circuit Design manager', null, '513-32-1759');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (8, 'Garry', 'Peinton', 'Won', '82808 Summit Park', 2, 'KPW', 'BRL', 187333, 'Sales Representative', null, '641-54-6871');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (9, 'Cornela', 'Pilley', 'Koruna', '0204 David Drive', 2, 'CZK', 'CVE', 63899, 'Librarian', null, '757-28-4188');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (10, 'Melba', 'Seers', 'Rupiah', '86 Graedel Circle', 2, 'IDR', 'COP', 71873, 'Social Worker', null, '600-71-3791');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (11, 'Hedwig', 'Drewell', null, '2310 Jenna Alley', 3, 'TZS', 'BAM', 63540, 'Nurse Practicioner', null, '675-28-2853');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (12, 'Yurik', 'Capeloff', null, '97332 Pond Alley', 3, 'KWD', 'CNY', 92291, 'Software Test Engineer IV', null, '244-32-9032');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (13, 'Codee', 'Marquese', null, '59789 Prairie Rose Street', 3, 'CNY', 'UAH', 41930, 'Desktop Support Technician', null, '624-28-4544');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (14, 'Dirk', 'O''Callaghan', null, '72742 Pepper Wood Circle', 3, 'CZK', 'CNY', 147626, 'Office Assistant I', null, '447-36-1492');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (15, 'Moss', 'Rowler', null, '68 Northridge Hill', 3, 'AZN', 'IDR', 174143, 'VP Accounting', null, '152-51-3387');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (16, 'Tommy', 'Fitzsimmons', 'Baht', '73522 Kedzie Point', 4, 'THB', 'CNY', 163096, 'Quality Engineer', null, '470-52-8637');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (17, 'Bartholemy', 'Crathorne', null, '988 Kings Drive', 4, 'COP', 'CNY', 62636, 'Account Representative III', null, '351-74-7828');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (18, 'Myriam', 'Labeuil', 'Yuan Renminbi', '33984 Anderson Plaza', 4, 'CNY', 'EUR', 66796, 'Administrative Officer', null, '821-45-4786');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (19, 'Pamella', 'Sowerby', null, '00505 Crowley Park', 4, 'UAH', 'BYR', 119760, 'Editor', null, '625-24-7710');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (20, 'Averill', 'Frier', null, '76 Meadow Valley Drive', 4, 'CNY', 'CNY', 33012, 'Information Systems Manager', null, '522-41-4135');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (21, 'Wendie', 'Edrich', null, '2771 Portage Court', 5, 'BRL', 'MXN', 99508, 'GIS Technical Architect', null, '512-41-4867');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (22, 'Calvin', 'Gwinnett', 'Euro', '39902 Warbler Terrace', 5, 'EUR', 'RUB', 131236, 'Sales Representative', null, '754-38-0676');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (23, 'Rois', 'Bennough', 'Yuan Renminbi', '8 Ridge Oak Avenue', 5, 'CNY', 'EUR', 103570, 'Legal Assistant', null, '230-75-2275');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (24, 'Elka', 'Attwoull', null, '37 Harper Pass', 5, 'CNY', 'MKD', 123273, 'Programmer Analyst I', null, '169-23-6594');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (25, 'Reta', 'Stanistrete', null, '587 Hauk Center', 5, 'EUR', 'PEN', 104363, 'Junior Executive', null, '796-52-8213');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (26, 'Shayna', 'Cornford', null, '97451 Helena Lane', 6, 'BRL', 'CNY', 101246, 'Research Nurse', null, '195-67-0014');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (27, 'Huey', 'Renish', null, '1919 Waubesa Center', 6, 'PAB', 'BDT', 109440, 'Analyst Programmer', null, '646-75-2362');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (28, 'Minor', 'Everil', 'Yuan Renminbi', '11175 Arizona Parkway', 6, 'CNY', 'IDR', 81757, 'Geologist II', null, '833-55-5407');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (29, 'Dione', 'Norrey', null, '6 Elgar Parkway', 6, 'MMK', 'PHP', 129339, 'Teacher', null, '718-92-2427');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (30, 'Morena', 'Webley', 'Rupiah', '48750 Ruskin Plaza', 6, 'IDR', 'MMK', 85024, 'Safety Technician I', null, '309-91-8757');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (31, 'Nikola', 'Prawle', null, '785 Aberg Street', 7, 'RUB', 'EUR', 77836, 'Graphic Designer', null, '242-21-9032');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (32, 'Willabella', 'Jubb', null, '8204 Dawn Point', 7, 'ARS', 'CNY', 73948, 'Quality Engineer', null, '204-86-0394');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (33, 'Pauline', 'Attwood', null, '621 Arrowood Circle', 7, 'USD', 'CNY', 52293, 'Librarian', null, '482-20-8483');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (34, 'Shea', 'Eplate', null, '41308 Michigan Park', 7, 'EGP', 'IDR', 183808, 'Safety Technician III', null, '563-82-4693');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (35, 'Kary', 'Paiton', null, '636 Jackson Center', 7, 'CNY', 'EUR', 144117, 'Social Worker', null, '869-25-1773');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (36, 'Benetta', 'Capnor', 'Ruble', '441 Talisman Way', 8, 'RUB', 'RUB', 99015, 'Engineer II', null, '819-91-6683');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (37, 'Liza', 'Mitchley', null, '64 Nobel Pass', 8, 'PLN', 'RUB', 60082, 'Analog Circuit Design manager', null, '264-28-6064');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (38, 'Rosaline', 'Cottu', null, '898 Valley Edge Court', 8, 'JPY', 'CNY', 154110, 'Mechanical Systems Engineer', null, '683-63-5826');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (39, 'Dorita', 'De Domenicis', null, '04024 Lien Circle', 8, 'PHP', 'NGN', 102798, 'Help Desk Technician', null, '216-29-9698');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (40, 'Francisca', 'Goodbur', null, '560 Pond Pass', 8, 'BYR', 'SEK', 72558, 'Compensation Analyst', null, '642-46-4359');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (41, 'Brook', 'Hanmer', null, '743 Anhalt Point', 9, 'IDR', 'IDR', 146408, 'Statistician II', null, '586-29-2098');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (42, 'Jamima', 'Filippo', 'Yuan Renminbi', '898 Anhalt Alley', 9, 'CNY', 'EUR', 111985, 'Senior Financial Analyst', null, '561-55-9602');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (43, 'Aurel', 'Hartfield', null, '38 Manitowish Crossing', 9, 'IDR', 'KZT', 164371, 'Teacher', null, '229-57-0817');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (44, 'Pamelina', 'Shaudfurth', null, '410 Jana Trail', 9, 'CNY', 'IDR', 43814, 'Recruiting Manager', null, '746-16-7092');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (45, 'Vonnie', 'Redolfi', null, '6414 Reinke Way', 9, 'MYR', 'HRK', 165838, 'Associate Professor', null, '846-82-9898');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (46, 'Bonny', 'Maffey', null, '62 Fremont Trail', 10, 'CNY', 'MKD', 188371, 'Research Nurse', null, '516-52-9612');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (47, 'Had', 'Gatehouse', null, '7 Express Trail', 10, 'CNY', 'EUR', 180703, 'Geological Engineer', null, '805-89-6811');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (48, 'Mattie', 'Dittson', 'Euro', '7059 Lake View Crossing', 10, 'EUR', 'IDR', 50756, 'Analog Circuit Design manager', null, '878-79-5969');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (49, 'Wendie', 'Daskiewicz', 'Dollar', '9290 Straubel Place', 10, 'NZD', 'MYR', 163985, 'Account Representative I', null, '116-62-4156');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (50, 'Rey', 'Inkpin', null, '305 Elka Pass', 10, 'CNY', 'EUR', 51915, 'Senior Editor', null, '786-88-5565');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (51, 'Viva', 'Storkes', null, '1085 Northwestern Avenue', 11, 'RUB', 'CNY', 48529, 'Programmer I', null, '606-45-2038');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (52, 'Bartholomeo', 'Phethean', null, '3 Kenwood Hill', 11, 'EUR', 'IDR', 72173, 'Marketing Manager', null, '651-34-7392');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (53, 'Aretha', 'Findley', null, '9560 Shoshone Pass', 11, 'RUB', 'EUR', 77797, 'Senior Sales Associate', null, '625-59-4107');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (54, 'Daniele', 'Levett', null, '7020 Scoville Pass', 11, 'PHP', 'RUB', 160784, 'Software Test Engineer II', null, '554-78-9403');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (55, 'Dane', 'Angus', null, '461 Orin Park', 11, 'USD', 'UGX', 154657, 'Account Coordinator', null, '483-38-9904');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (56, 'Lora', 'Kemble', 'Yuan Renminbi', '30 Continental Park', 12, 'CNY', 'JPY', 137894, 'Senior Developer', null, '401-24-1746');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (57, 'Raquel', 'Goldes', 'Peso', '5 Pleasure Hill', 12, 'PHP', 'CZK', 160875, 'Clinical Specialist', null, '195-52-1550');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (58, 'Lorin', 'Connerry', null, '73 Esker Road', 12, 'BRL', 'MAD', 60313, 'Project Manager', null, '569-11-3234');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (59, 'Sanford', 'Chattey', 'Rial', '19 Waxwing Alley', 12, 'SAR', 'CZK', 187448, 'Nurse Practicioner', null, '430-47-2856');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (60, 'Sonia', 'Copnell', null, '20999 Forster Junction', 12, 'CNY', 'THB', 113618, 'Associate Professor', null, '309-58-5128');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (61, 'Rodolfo', 'Creebo', null, '872 Anhalt Way', 13, 'IDR', 'VND', 131888, 'Structural Analysis Engineer', null, '337-54-8981');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (62, 'Abe', 'Byham', null, '7058 American Way', 13, 'IRR', 'RUB', 41194, 'Project Manager', null, '110-60-2425');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (63, 'Glyn', 'Burnsall', null, '76 Caliangt Pass', 13, 'USD', 'IDR', 56610, 'Social Worker', null, '540-04-1042');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (64, 'Emeline', 'Caccavale', null, '236 Westport Crossing', 13, 'CNY', 'IDR', 164349, 'Payment Adjustment Coordinator', null, '340-05-5048');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (65, 'Jana', 'Ickovici', null, '2278 Golf Course Hill', 13, 'EUR', 'HRK', 90499, 'Occupational Therapist', null, '273-04-6471');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (66, 'Bunni', 'Glen', 'Yuan Renminbi', '601 Melrose Parkway', 14, 'CNY', 'JMD', 110541, 'Research Assistant I', null, '338-90-6026');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (67, 'Yolanda', 'Haggata', 'Ruble', '52324 Center Plaza', 14, 'RUB', 'CNY', 106722, 'Junior Executive', null, '110-28-2351');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (68, 'Corrine', 'MacColgan', null, '7 Talisman Avenue', 14, 'CNY', 'PHP', 135691, 'Office Assistant II', null, '714-91-9519');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (69, 'Sebastiano', 'Threlkeld', null, '78 Hazelcrest Trail', 14, 'USD', 'PLN', 106989, 'Administrative Officer', null, '629-47-0357');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (70, 'Cesaro', 'Bloss', 'Peso', '919 Harper Center', 14, 'MXN', 'EUR', 64326, 'Pharmacist', null, '330-76-3521');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (71, 'Nanny', 'Bramford', null, '36214 Division Park', 15, 'USD', 'RUB', 165788, 'Account Executive', null, '221-50-2953');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (72, 'Marie-ann', 'Muffitt', null, '5672 Sundown Circle', 15, 'IDR', 'PHP', 111468, 'Sales Associate', null, '661-65-0477');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (73, 'Dosi', 'Pilfold', null, '8710 Monument Alley', 15, 'SYP', 'CAD', 172639, 'Software Test Engineer II', null, '471-02-8860');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (74, 'Ruth', 'Mussilli', null, '7828 David Avenue', 15, 'EUR', 'CNY', 84096, 'Clinical Specialist', null, '795-82-3833');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (75, 'Janek', 'McVrone', null, '84 Eastlawn Circle', 15, 'JPY', 'PHP', 91540, 'Senior Sales Associate', null, '266-17-4790');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (76, 'Yolane', 'Anthonsen', 'Ruble', '2 8th Way', 16, 'RUB', 'AMD', 58700, 'Food Chemist', null, '390-65-9806');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (77, 'Sunny', 'Phipard-Shears', 'Rupiah', '26473 Lakeland Terrace', 16, 'IDR', 'CNY', 115609, 'Technical Writer', null, '587-60-1272');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (78, 'Delia', 'Stickings', 'Pound', '41 Atwood Pass', 16, 'EGP', 'IRR', 195002, 'Registered Nurse', null, '114-27-9139');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (79, 'Correy', 'Janak', 'Rial', '8889 Hallows Plaza', 16, 'IRR', 'RUB', 34738, 'Compensation Analyst', null, '301-72-6006');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (80, 'Karlotte', 'Walls', null, '672 Twin Pines Road', 16, 'USD', 'CNY', 165066, 'Budget/Accounting Analyst III', null, '410-49-4676');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (81, 'Colette', 'Spottswood', null, '87213 Marquette Plaza', 17, 'CNY', 'CNY', 66379, 'Nurse', null, '347-29-7711');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (82, 'Cristine', 'Corrie', null, '3304 Sunnyside Trail', 17, 'CZK', 'ALL', 194973, 'Civil Engineer', null, '515-86-2920');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (83, 'Martyn', 'Lewis', null, '73299 Hermina Court', 17, 'LTL', 'CNY', 194474, 'Compensation Analyst', null, '214-31-8406');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (84, 'Lonee', 'Lapides', null, '78847 Cambridge Center', 17, 'THB', 'EUR', 91403, 'Systems Administrator III', null, '605-82-3908');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (85, 'Madella', 'Malamore', null, '6931 Bashford Road', 17, 'CNY', 'CNY', 188182, 'Community Outreach Specialist', null, '142-33-1406');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (86, 'Jodee', 'Berston', 'Lek', '4998 Reindahl Trail', 18, 'ALL', 'IDR', 102251, 'Safety Technician III', null, '750-86-7644');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (87, 'Gweneth', 'Pymm', 'Ringgit', '33 Gina Hill', 18, 'MYR', 'XAF', 65250, 'Internal Auditor', null, '600-99-1230');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (88, 'Bonny', 'Geillier', null, '95923 Hallows Hill', 18, 'BAM', 'IDR', 33284, 'Automation Specialist III', null, '711-58-8643');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (89, 'Brandise', 'Rendall', null, '02 Cascade Drive', 18, 'BRL', 'JPY', 53043, 'Quality Engineer', null, '781-33-8022');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (90, 'Marlin', 'McGaughey', 'Peso', '974 Bluestem Alley', 18, 'PHP', 'IDR', 81370, 'Statistician III', null, '158-74-5250');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (91, 'Dagny', 'Guerrin', null, '2698 Pennsylvania Place', 19, 'CNY', 'IDR', 111524, 'Automation Specialist I', null, '134-83-7924');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (92, 'Olav', 'Templeman', null, '11298 Michigan Hill', 19, 'UAH', 'IRR', 89484, 'Recruiter', null, '789-45-4824');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (93, 'Harli', 'Gorst', null, '38 Bartillon Avenue', 19, 'CNY', 'EUR', 52426, 'Administrative Assistant II', null, '257-77-5550');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (94, 'Kara', 'Atling', null, '51134 Badeau Place', 19, 'CZK', 'CNY', 146412, 'Programmer I', null, '430-23-2035');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (95, 'Alyosha', 'MacVay', 'Euro', '4 Bluejay Circle', 19, 'EUR', 'PAB', 99111, 'Administrative Assistant III', null, '733-90-2875');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (96, 'Homere', 'Asplin', null, '5 Bunting Drive', 20, 'KPW', 'PYG', 132649, 'Senior Editor', null, '383-85-4418');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (97, 'Mattie', 'D''Elia', null, '26337 Mockingbird Pass', 20, 'VEF', 'USD', 128896, 'Health Coach III', null, '728-97-5518');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (98, 'Judon', 'Castello', null, '08 Caliangt Junction', 20, 'CNY', 'IDR', 87922, 'Compensation Analyst', null, '856-10-6736');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (99, 'Sherwynd', 'Gilbane', 'Real', '28702 Buena Vista Point', 20, 'BRL', 'BRL', 58998, 'Teacher', null, '673-26-6207');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (100, 'Vincent', 'McCluin', 'Euro', '1 Schmedeman Trail', 20, 'EUR', 'PHP', 91333, 'Programmer IV', null, '430-50-4550');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (101, 'Shayne', 'Drejer', 'Dong', '61056 Drewry Trail', 21, 'VND', 'RUB', 195907, 'Technical Writer', null, '755-70-7656');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (102, 'Margareta', 'Willarton', null, '52 Gina Place', 21, 'USD', 'PLN', 107216, 'Junior Executive', null, '485-48-0923');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (103, 'Mord', 'Solway', 'Hryvnia', '983 Monterey Place', 21, 'UAH', 'BHD', 175946, 'Data Coordiator', null, '266-84-7245');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (104, 'Averil', 'Szymanek', null, '407 Fisk Center', 21, 'CNY', 'XOF', 130103, 'Civil Engineer', null, '446-39-9921');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (105, 'Katherina', 'Haswell', 'Ruble', '47342 Lighthouse Bay Junction', 21, 'RUB', 'CNY', 100697, 'VP Sales', null, '414-80-0442');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (106, 'Ernestus', 'Vevers', null, '04 Blackbird Parkway', 22, 'CZK', 'EUR', 175469, 'Programmer Analyst II', null, '618-58-2644');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (107, 'Pace', 'FitzAlan', null, '2 Forest Dale Pass', 22, 'NGN', 'IDR', 117117, 'Assistant Manager', null, '652-87-6089');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (108, 'Brent', 'Gartin', null, '59 Moulton Center', 22, 'DOP', 'CNY', 194277, 'Financial Advisor', null, '127-57-6774');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (109, 'Corbett', 'Janz', null, '03 Sheridan Road', 22, 'BRL', 'PHP', 178428, 'Director of Sales', null, '741-87-6206');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (110, 'Jenelle', 'Reynalds', null, '2 Cambridge Trail', 22, 'ZAR', 'MXN', 198554, 'Assistant Manager', null, '814-60-3832');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (111, 'Gregoor', 'Feares', 'Dollar', '916 Arapahoe Way', 23, 'USD', 'THB', 108890, 'Editor', null, '273-90-3983');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (112, 'Jaclin', 'Devanny', null, '855 Northridge Alley', 23, 'CNY', 'CNY', 192316, 'Registered Nurse', null, '748-59-9690');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (113, 'Perry', 'Dainter', null, '939 Merchant Drive', 23, 'NZD', 'RUB', 47868, 'Developer IV', null, '354-78-2834');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (114, 'Efrem', 'Baptista', null, '5881 East Plaza', 23, 'CNY', 'RUB', 154804, 'Mechanical Systems Engineer', null, '338-96-8608');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (115, 'Baudoin', 'McKerlie', 'Peso', '700 Summit Alley', 23, 'MXN', 'PHP', 119664, 'Business Systems Development Analyst', null, '491-16-6273');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (116, 'Darius', 'Maryman', null, '288 Karstens Place', 24, 'PHP', 'IDR', 132537, 'Research Associate', null, '612-62-7435');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (117, 'Dar', 'Lilleyman', 'Tugrik', '47967 Northland Crossing', 24, 'MNT', 'CRC', 140420, 'Quality Engineer', null, '518-48-1650');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (118, 'Dieter', 'Edscer', null, '595 Miller Road', 24, 'CNY', 'IDR', 127302, 'Marketing Manager', null, '309-71-9212');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (119, 'Katha', 'Sporle', null, '5 Birchwood Point', 24, 'EUR', 'EUR', 71205, 'Software Engineer IV', null, '746-94-9596');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (120, 'Arlie', 'Cordsen', 'Lev', '2061 Stuart Park', 24, 'BGN', 'UAH', 58049, 'Product Engineer', null, '397-57-0461');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (121, 'Chariot', 'Solomonides', null, '71 American Ash Parkway', 25, 'BRL', 'RUB', 186016, 'Senior Cost Accountant', null, '705-77-7317');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (122, 'Kelsey', 'Evenett', null, '6 Westport Drive', 25, 'CNY', 'BRL', 116108, 'Account Coordinator', null, '168-55-2662');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (123, 'Kathlin', 'Greber', null, '7 Bartelt Avenue', 25, 'CNY', 'EUR', 181028, 'Database Administrator I', null, '399-94-3401');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (124, 'Debera', 'Oger', null, '944 Continental Pass', 25, 'JPY', 'CNY', 78557, 'Analyst Programmer', null, '829-68-2524');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (125, 'Marie-jeanne', 'Eisig', null, '5 Westport Junction', 25, 'SYP', 'IDR', 79052, 'Teacher', null, '678-80-9296');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (126, 'Hettie', 'Rodden', 'Euro', '592 Michigan Hill', 26, 'EUR', 'USD', 67695, 'Statistician II', null, '168-68-7545');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (127, 'Hendrik', 'Rhodes', null, '521 Granby Plaza', 26, 'UGX', 'EUR', 86284, 'Help Desk Operator', null, '308-34-3529');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (128, 'Boniface', 'Phillins', null, '473 Red Cloud Park', 26, 'UAH', 'THB', 62049, 'Database Administrator III', null, '427-54-0014');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (129, 'Brittney', 'Kowalski', null, '50860 Eastlawn Street', 26, 'CNY', 'UZS', 62605, 'Programmer II', null, '258-77-7623');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (130, 'Jaimie', 'Featherstonehaugh', null, '2 Schiller Place', 26, 'BRL', 'CNY', 176879, 'Account Representative I', null, '579-46-0610');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (131, 'Evania', 'Ezzell', null, '269 Elmside Street', 27, 'PLN', 'EUR', 190035, 'VP Accounting', null, '225-06-5137');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (132, 'Lurlene', 'Berends', null, '78282 Dixon Pass', 27, 'MXN', 'IDR', 161863, 'Engineer III', null, '239-83-7775');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (133, 'Gradey', 'McBeath', null, '597 Portage Way', 27, 'MXN', 'USD', 194117, 'Statistician III', null, '199-70-6929');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (134, 'Fanya', 'Bofield', null, '13 Dakota Road', 27, 'HNL', 'BRL', 103804, 'VP Accounting', null, '788-58-4938');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (135, 'Buddy', 'Antosch', null, '8 Fallview Point', 27, 'PHP', 'EUR', 101000, 'Data Coordiator', null, '713-52-5849');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (136, 'Stella', 'Dusting', null, '9824 School Point', 28, 'CZK', 'EUR', 83270, 'Account Executive', null, '261-09-6759');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (137, 'Shirleen', 'Rittelmeyer', null, '33 Independence Plaza', 28, 'RUB', 'UAH', 33565, 'Software Engineer I', null, '856-56-1354');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (138, 'Gennie', 'Glyde', 'Yuan Renminbi', '73737 Anthes Avenue', 28, 'CNY', 'UAH', 166772, 'Junior Executive', null, '111-26-5027');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (139, 'Cooper', 'Griffith', null, '46 Straubel Center', 28, 'THB', 'EUR', 33693, 'Associate Professor', null, '124-78-6939');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (140, 'Dorice', 'Smitham', null, '51 Ridgeview Way', 28, 'UAH', 'XAF', 144895, 'Dental Hygienist', null, '774-57-4750');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (141, 'Katie', 'Kubik', null, '3552 Knutson Hill', 29, 'CNY', 'COP', 62978, 'Financial Advisor', null, '554-36-8816');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (142, 'Rosamond', 'Ravenshear', null, '39580 Center Trail', 29, 'CNY', 'KES', 38312, 'Graphic Designer', null, '608-66-6918');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (143, 'Mureil', 'Senussi', null, '289 Springs Park', 29, 'VND', 'KES', 78632, 'Marketing Assistant', null, '811-43-1204');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (144, 'Arthur', 'Rummer', null, '615 Bellgrove Park', 29, 'IDR', 'SEK', 163746, 'Structural Engineer', null, '853-51-6270');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (145, 'Hymie', 'Davidson', null, '7 Transport Street', 29, 'JPY', 'JPY', 48701, 'Media Manager III', null, '221-43-0821');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (146, 'Dilan', 'Blodg', null, '63 Northwestern Point', 30, 'EUR', 'IQD', 85619, 'Internal Auditor', null, '894-44-7535');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (147, 'Ramsey', 'Brockton', null, '1 Fair Oaks Junction', 30, 'EGP', 'PEN', 198480, 'Biostatistician II', null, '364-09-3813');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (148, 'Nance', 'Breward', null, '9 Heffernan Street', 30, 'CNY', 'VND', 128547, 'Assistant Media Planner', null, '884-53-7811');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (149, 'Marcello', 'Troughton', 'Rial', '1650 Granby Alley', 30, 'YER', 'PLN', 89029, 'VP Quality Control', null, '508-36-3422');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (150, 'Fredrick', 'Opie', 'Yen', '39368 Schmedeman Way', 30, 'JPY', 'RUB', 52628, 'Payment Adjustment Coordinator', null, '313-44-5259');

insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (160, 'Wilbur', 'Pashenkov', null, '62 Oriole Center', 1, 'IDR', 'PKR', 176295, 'Manager', null, '138-51-7500');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (161, 'Heindrick', 'Ricold', null, '072 Oneill Trail', 2, 'MYR', 'PLN', 185934, 'Manager', null, '456-86-3804');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (162, 'Sandor', 'Averall', 'EUR', '416 Dixon Parkway', 3, 'RUB', 'CNY', 146738, 'Manager', null, '283-62-1451');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (163, 'Gary', 'Tottman', 'CNY', '41 Mcbride Drive', 4, 'IDR', 'ILS', 152963, 'Manager', null, '753-13-2295');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (164, 'Ravid', 'Simmonds', null, '58 Pierstorff Alley', 5, 'IDR', 'USD', 134322, 'Manager', null, '520-07-9447');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (165, 'Cynthea', 'Sprulls', null, '51168 Kingsford Court', 6, 'CNY', 'UGX', 131431, 'Manager', null, '296-97-9497');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (166, 'Reinold', 'Cassell', null, '5175 Schlimgen Pass', 7, 'IDR', 'BRL', 169249, 'Manager', null, '848-06-4579');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (167, 'Alvin', 'Varga', 'IDR', '5244 La Follette Plaza', 8, 'EUR', 'USD', 191703, 'Manager', null, '794-35-9438');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (168, 'Yalonda', 'Moreno', null, '284 Moose Crossing', 9, 'IRR', 'ILS', 174795, 'Manager', null, '311-11-9001');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (169, 'Baird', 'Janton', null, '55 Mesta Court', 10, 'USD', 'XOF', 192292, 'Manager', null, '278-78-3591');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (170, 'Glynn', 'Littlejohn', null, '50 Loftsgordon Pass', 11, 'IDR', 'IDR', 135102, 'Manager', null, '806-77-4536');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (171, 'Hart', 'Ordish', null, '7 Service Park', 12, 'IDR', 'ALL', 142528, 'Manager', null, '613-28-7725');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (172, 'Neron', 'Goudie', null, '9834 Tomscot Center', 13, 'CNY', 'CNY', 171507, 'Manager', null, '687-43-5329');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (173, 'Nola', 'Bolduc', null, '41 Clemons Court', 14, 'EUR', 'USD', 128228, 'Manager', null, '203-62-8544');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (174, 'Terri', 'Seaborne', null, '3572 Warbler Avenue', 15, 'AOA', 'USD', 195636, 'Manager', null, '818-44-0954');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (175, 'Shandeigh', 'Rabbitts', null, '232 Buena Vista Crossing', 16, 'CNY', 'IDR', 137777, 'Manager', null, '298-34-0809');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (176, 'Bethany', 'Kurdani', null, '98 Truax Avenue', 17, 'BRL', 'SEK', 114260, 'Manager', null, '585-71-1407');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (177, 'Francene', 'McNerlin', null, '531 Heffernan Place', 18, 'PLN', 'ILS', 198115, 'Manager', null, '283-52-5929');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (178, 'Caroljean', 'Moatt', null, '7842 Elka Plaza', 19, 'RUB', 'CNY', 125081, 'Manager', null, '794-63-6647');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (179, 'Hersh', 'Kembrey', 'EUR', '00232 Fallview Way', 20, 'CNY', 'XOF', 185333, 'Manager', null, '195-86-2227');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (180, 'Latisha', 'Rate', null, '098 Carioca Hill', 21, 'EUR', 'XPF', 100327, 'Manager', null, '473-61-6053');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (181, 'Trev', 'Esch', null, '3 Pawling Junction', 22, 'SEK', 'IDR', 183216, 'Manager', null, '684-83-1507');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (182, 'Lenee', 'Devil', 'IDR', '30270 Moulton Trail', 23, 'IDR', 'USD', 159931, 'Manager', null, '861-72-4316');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (183, 'Kirbie', 'Soitoux', 'CNY', '810 Schurz Alley', 24, 'EGP', 'IDR', 199651, 'Manager', null, '410-41-9073');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (184, 'Ardelle', 'Pidgin', null, '7913 Memorial Center', 25, 'CNY', 'ARS', 145233, 'Manager', null, '639-47-3108');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (185, 'Sallie', 'Burfield', 'EGP', '31 Hanover Circle', 26, 'COP', 'EUR', 157122, 'Manager', null, '743-31-0500');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (186, 'Gerti', 'Stern', null, '411 Comanche Center', 27, 'COP', 'CZK', 113939, 'Manager', null, '507-49-7391');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (187, 'Cami', 'Fowley', null, '5 Goodland Street', 28, 'CAD', 'IDR', 163279, 'Manager', null, '643-96-4054');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (188, 'Sheba', 'Dagworthy', 'SEK', '494 Elgar Point', 29, 'CZK', 'AFN', 152212, 'Manager', null, '136-24-2276');
insert into employee (employee_id, first_name, last_name, middle_name, home_address, hotel_id, password, user_name, salary, role, manager_id, sin) values (189, 'Donnajean', 'Aspinell', null, '4600 Milwaukee Place', 30, 'GBP', 'PEN', 178061, 'Manager', null, '374-75-7174');

insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('490', 8, false, '461', 'sea view', 1);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('049', 5, false, '367', 'mountain view', 1);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('461', 6, false, '238', 'sea view', 1);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('967', 3, true, '437', 'mountain view', 1);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('635', 4, true, '410', 'sea view', 1);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('397', 5, true, '574', 'sea view', 2);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('989', 7, false, '907', 'sea view', 2);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('021', 2, true, '449', 'mountain view', 2);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('709', 8, true, '898', 'sea view', 2);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('999', 2, false, '637', 'sea view', 2);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('782', 2, false, '825', 'sea view', 3);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('032', 4, true, '533', 'sea view', 3);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('199', 2, true, '752', 'sea view', 3);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('206', 8, false, '486', 'sea view', 3);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('734', 3, false, '890', 'sea view', 3);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('873', 3, true, '866', 'sea view', 4);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('573', 4, false, '162', 'sea view', 4);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('651', 4, true, '798', 'mountain view', 4);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('372', 2, true, '458', 'mountain view', 4);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('535', 5, false, '984', 'sea view', 4);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('734', 8, false, '194', 'sea view', 5);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('072', 2, false, '835', 'mountain view', 5);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('423', 6, false, '536', 'sea view', 5);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('371', 5, true, '751', 'mountain view', 5);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('641', 3, false, '784', 'mountain view', 5);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('436', 7, false, '645', 'mountain view', 6);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('101', 2, true, '675', 'sea view', 6);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('445', 2, true, '954', 'sea view', 6);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('183', 3, false, '223', 'sea view', 6);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('247', 5, false, '075', 'mountain view', 6);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('826', 7, false, '856', 'sea view', 7);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('058', 2, true, '899', 'sea view', 7);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('795', 2, false, '776', 'mountain view', 7);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('360', 8, true, '756', 'mountain view', 7);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('262', 8, true, '478', 'sea view', 7);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('903', 6, false, '309', 'sea view', 8);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('506', 5, false, '962', 'sea view', 8);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('761', 3, false, '382', 'mountain view', 8);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('607', 6, true, '863', 'mountain view', 8);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('743', 4, true, '208', 'sea view', 8);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('454', 4, true, '706', 'sea view', 9);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('811', 3, true, '065', 'mountain view', 9);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('046', 7, false, '490', 'mountain view', 9);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('572', 5, true, '034', 'mountain view', 9);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('524', 8, false, '598', 'sea view', 9);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('074', 3, true, '402', 'sea view', 10);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('876', 2, false, '016', 'mountain view', 10);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('318', 7, true, '505', 'mountain view', 10);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('641', 7, false, '775', 'sea view', 10);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('426', 7, true, '552', 'mountain view', 10);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('094', 7, true, '257', 'sea view', 11);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('427', 7, true, '896', 'sea view', 11);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('733', 5, true, '837', 'sea view', 11);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('300', 3, false, '710', 'mountain view', 11);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('992', 7, false, '828', 'sea view', 11);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('968', 7, true, '207', 'sea view', 12);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('555', 7, false, '805', 'sea view', 12);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('401', 7, true, '629', 'sea view', 12);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('259', 8, false, '485', 'sea view', 12);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('355', 4, false, '222', 'sea view', 12);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('584', 8, false, '789', 'sea view', 13);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('639', 7, true, '051', 'sea view', 13);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('460', 3, true, '200', 'sea view', 13);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('501', 6, true, '969', 'sea view', 13);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('325', 4, false, '339', 'sea view', 13);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('747', 7, false, '648', 'sea view', 14);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('419', 4, true, '359', 'mountain view', 14);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('360', 7, true, '409', 'mountain view', 14);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('339', 2, false, '418', 'sea view', 14);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('019', 7, false, '842', 'sea view', 14);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('068', 8, false, '643', 'sea view', 15);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('194', 5, true, '527', 'sea view', 15);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('035', 7, true, '846', 'sea view', 15);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('373', 6, true, '474', 'sea view', 15);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('079', 8, true, '136', 'sea view', 15);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('454', 5, false, '618', 'sea view', 16);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('060', 7, true, '375', 'sea view', 16);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('108', 7, true, '770', 'mountain view', 16);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('075', 7, true, '322', 'sea view', 16);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('333', 3, true, '428', 'sea view', 16);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('031', 6, false, '020', 'mountain view', 17);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('486', 4, true, '160', 'mountain view', 17);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('070', 2, true, '282', 'sea view', 17);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('185', 3, true, '628', 'sea view', 17);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('255', 7, false, '635', 'mountain view', 17);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('447', 7, false, '776', 'sea view', 18);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('397', 4, false, '944', 'sea view', 18);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('278', 4, false, '481', 'mountain view', 18);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('443', 7, false, '657', 'mountain view', 18);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('018', 2, false, '857', 'mountain view', 18);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('615', 5, true, '520', 'sea view', 19);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('598', 5, false, '948', 'sea view', 19);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('950', 5, false, '582', 'mountain view', 19);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('656', 3, true, '813', 'sea view', 19);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('036', 2, false, '683', 'mountain view', 19);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('590', 7, false, '963', 'mountain view', 20);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('953', 2, true, '497', 'sea view', 20);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('020', 6, true, '932', 'mountain view', 20);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('147', 8, false, '371', 'sea view', 20);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('840', 3, true, '226', 'mountain view', 20);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('252', 7, true, '570', 'sea view', 21);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('610', 4, false, '340', 'sea view', 21);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('299', 8, true, '428', 'sea view', 21);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('606', 5, false, '700', 'sea view', 21);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('029', 4, false, '147', 'mountain view', 21);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('255', 4, false, '717', 'sea view', 22);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('964', 3, false, '157', 'mountain view', 22);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('618', 5, true, '965', 'sea view', 22);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('526', 6, true, '121', 'mountain view', 22);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('968', 7, true, '938', 'sea view', 22);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('310', 8, false, '502', 'sea view', 23);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('085', 6, true, '406', 'sea view', 23);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('452', 3, false, '205', 'sea view', 23);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('217', 3, true, '643', 'mountain view', 23);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('753', 6, false, '443', 'mountain view', 23);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('378', 4, false, '629', 'mountain view', 24);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('102', 2, false, '282', 'mountain view', 24);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('998', 7, false, '055', 'mountain view', 24);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('667', 4, true, '661', 'mountain view', 24);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('039', 3, false, '072', 'mountain view', 24);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('556', 2, false, '912', 'mountain view', 25);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('524', 6, false, '023', 'sea view', 25);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('565', 2, true, '919', 'sea view', 25);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('895', 6, false, '041', 'sea view', 25);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('281', 7, false, '429', 'mountain view', 25);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('143', 3, false, '081', 'sea view', 26);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('130', 4, true, '428', 'mountain view', 26);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('597', 5, false, '688', 'sea view', 26);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('144', 5, false, '263', 'sea view', 26);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('953', 2, false, '613', 'mountain view', 26);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('272', 5, true, '394', 'sea view', 27);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('993', 8, true, '608', 'sea view', 27);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('139', 6, true, '812', 'mountain view', 27);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('635', 6, true, '500', 'sea view', 27);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('292', 2, false, '230', 'mountain view', 27);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('160', 6, false, '511', 'sea view', 28);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('444', 6, true, '789', 'mountain view', 28);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('078', 4, true, '053', 'sea view', 28);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('349', 6, true, '474', 'sea view', 28);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('634', 8, true, '280', 'mountain view', 28);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('195', 3, false, '282', 'sea view', 29);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('625', 6, true, '870', 'sea view', 29);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('384', 5, false, '133', 'sea view', 29);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('374', 2, false, '082', 'mountain view', 29);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('327', 2, true, '008', 'sea view', 29);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('664', 6, true, '891', 'mountain view', 30);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('202', 5, true, '238', 'sea view', 30);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('119', 5, false, '508', 'sea view', 30);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('890', 5, false, '458', 'sea view', 30);
insert into room (room_number, capacity, extendable, price, view, hotel_id) values ('947', 3, true, '581', 'mountain view', 30);

update hotel set total_number_of_rooms = 5;

insert into hotel_amenity (amenity_id, hotel_id) values (8, 14);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 22);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 13);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 6);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 26);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 22);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 6);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 6);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 3);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 11);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 10);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 26);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 10);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 19);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 12);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 10);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 26);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 23);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 12);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 9);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 12); 
insert into hotel_amenity (amenity_id, hotel_id) values (6, 9);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 20);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 18);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 7);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 21);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 4);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 4);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 15);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 23);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 26);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 22);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 25);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 26);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 15);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 27);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 27);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 9);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 21);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 22);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 15);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 17);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 21);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 14);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 3);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 6);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 2);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 12);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 2); 
insert into hotel_amenity (amenity_id, hotel_id) values (8, 3);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 17);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 1);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 30);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 15);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 29);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 9);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 27);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 28);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 24);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 19);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 10);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 24);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 15);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 4);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 18);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 1);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 8);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 12); 
insert into hotel_amenity (amenity_id, hotel_id) values (1, 2); 
insert into hotel_amenity (amenity_id, hotel_id) values (7, 24);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 22);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 7);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 21);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 19);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 16);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 1);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 30); 
insert into hotel_amenity (amenity_id, hotel_id) values (4, 28);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 7); 
insert into hotel_amenity (amenity_id, hotel_id) values (1, 12);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 23);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 12);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 4);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 4);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 13);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 4);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 6);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 28);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 16);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 9);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 30);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 6);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 16);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 29);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 17);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 6);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 21);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 22); 
insert into hotel_amenity (amenity_id, hotel_id) values (7, 27);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 13);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 9);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 20);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 24);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 8);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 29);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 8);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 17);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 7);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 9);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 13);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 11);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 13);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 14);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 26);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 8);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 15);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 16);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 1);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 19);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 7);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 3);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 1);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 3);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 24);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 21);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 4);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 11);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 29);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 28);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 3);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 3);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 22);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 13);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 24);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 1);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 10);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 8);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 7);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 28);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 20);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 2);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 28);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 18);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 25);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 25);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 2);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 24);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 23);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 18);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 18);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 5);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 27);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 26);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 29);
insert into hotel_amenity (amenity_id, hotel_id) values (2, 18);
insert into hotel_amenity (amenity_id, hotel_id) values (5, 13);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 27);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 2);
insert into hotel_amenity (amenity_id, hotel_id) values (7, 21);
insert into hotel_amenity (amenity_id, hotel_id) values (8, 22);
insert into hotel_amenity (amenity_id, hotel_id) values (3, 17);
insert into hotel_amenity (amenity_id, hotel_id) values (6, 12);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 25);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 11);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 14);
insert into hotel_amenity (amenity_id, hotel_id) values (4, 18);
insert into hotel_amenity (amenity_id, hotel_id) values (1, 30);

insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '049', 6);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '049', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '635', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '049', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '461', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '967', 6);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '635', 6);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '461', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '635', 5);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '049', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '490', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '490', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '461', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '635', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '049', 5);
insert into room_amenity (hotel_id, room_number, amenity_id) values (1, '967', 1);

insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '709', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '397', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '989', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '999', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '397', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '021', 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '021', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '397', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '999', 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '989', 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '989', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '999', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '989', 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '709', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '397', 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (2, '709', 7);

insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '734', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '199', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '206', 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '032', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '782', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '199', 4);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '734', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '734', 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '734', 4);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '032', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '782', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '206', 5);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '734', 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '206', 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '782', 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '782', 4);
insert into room_amenity (hotel_id, room_number, amenity_id) values (3, '199', 3);

insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 573, 5);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 535, 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 573, 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 535, 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 535, 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 873, 5);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 573, 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 573, 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 873, 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 535, 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 372, 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 573, 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 873, 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 651, 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (4, 873, 7);

insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '641', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '423', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '371', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '641', 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '072', 3);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '371', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '641', 5);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '072', 2);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '641', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '641', 7);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '734', 5);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '641', 1);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '371', 8);
insert into room_amenity (hotel_id, room_number, amenity_id) values (5, '423', 4);


-- Following data is for 10th day question.
--   there are total 8 renting records, 6 of them are rented on April 10th.
-- 
insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (1, 'Renting', '2', '1020', '2020-04-11', '2020-04-09', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (1, 'Renting', '490', 8, false, '461', 'sea view', 1, 2);

insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (2, 'Renting', '3', '1020', '2020-04-10', '2020-04-09', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (2, 'Renting', '461', 6, false, '238', 'sea view', 1, 2);

insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (3, 'Renting', '4', '1020', '2020-04-15', '2020-04-10', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (3, 'Renting', '967', 3, true, '437', 'mountain view', 1, 2);

insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (4, 'Renting', '5', '1020', '2020-04-12', '2020-04-07', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (4, 'Renting', '795', 2, false, '776', 'mountain view', 7, 2);

insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (5, 'Renting', '6', '1020', '2020-04-16', '2020-04-11', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (5, 'Renting', '360', 8, true, '756', 'mountain view', 7, 2);

insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (6, 'Renting', '7', '1020', '2020-05-12', '2020-05-07', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (6, 'Renting', '262', 8, true, '478', 'sea view', 7, 2);

insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (7, 'Renting', '8', '1020', '2020-04-12', '2020-04-10', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (7, 'Renting', '903', 6, false, '309', 'sea view', 8, 2);

insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp) 
values (8, 'Renting', '9', '1020', '2020-04-10', '2020-04-07', '2020-01-01');
insert into booked_room (booking_id, state, room_number, capacity, extendable, price, view, hotel_id, occupancy)
values (8, 'Renting', '811', 3, true, '065', 'mountain view', 9, 2);

