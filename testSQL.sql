/* Name - Ahlam Hassen
   StudentID - 103031281 */

--Task 1
/* 
Tour (TourName, Description)
Primary Key (TourName)

Client (ClientID, Surname, GivenName, Gender)
Primary Key (ClientID)

Event (TourName, EventYear, EventMonth, EventDay, fee)
Primary Key (TourName, EventYear, EventMonth, EventDay)
Foreign Key (TourName) References Tour

Booking (ClientID, TourName, EventYear, EventMonth, EventDay, DateBooked, Payment)
Primary Key (ClientID, TourName, EventYear, EventMonth, EventDay)
Foreign Key (ClientID) References Client
Foreign Key (TourName, EventYear, EventMonth, EventDay) References Event */ 


--Task 2

CREATE TABLE Tour (
TourName          NVARCHAR(100),
Description       NVARCHAR(500),
PRIMARY KEY       (TourName)  
);

CREATE TABLE Client (
ClientID            INT,
Surname             NVARCHAR(100) NOT NULL,
GivenName           NVARCHAR(100) NOT NULL,
Gender              NVARCHAR (1) CHECK( Gender IN('M', 'F', 'I')) NULL,
PRIMARY KEY         (ClientID)
);

CREATE TABLE Event (
TourName           NVARCHAR(100),
EventMonth         NVARCHAR(3) CHECK (EventMonth IN('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
EventDay           INT  CHECK (EventDay >=1 AND EventDay <=31),
EventYear          INT  CHECK(LEN(EventYear) = 4),
EventFee           MONEY NOT NULL CHECK (EventFee > 0),
PRIMARY KEY        (TourName, EventYear, EventMonth, EventDay),
FOREIGN KEY        (TourName) References Tour
);

CREATE TABLE Booking (
ClientID              INT,
TourName              NVARCHAR(100),
EventMonth            NVARCHAR(3) CHECK (EventMonth IN('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
EventDay              INT  CHECK (EventDay >=1 AND EventDay <=31),
EventYear             INT  CHECK(LEN(EventYear) = 4),
Payment               MONEY CHECK(Payment >0) NULL,
DateBooked            DATE  NOT NULL,
PRIMARY KEY           (ClientID, TourName, EventYear, EventMonth, EventDay),
FOREIGN KEY           (ClientID) References Client,
FOREIGN KEY           (TourName, EventYear, EventMonth, EventDay) References Event 
);


SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
FROM INFORMATION_SCHEMA.TABLES
GO

--Task 3

INSERT INTO Tour (TourName, [Description]) VALUES
('North',	'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South',	'Tour of wineries and outlets of Mornington Penisula'),
('West',	'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO Client (ClientID, Surname, GivenName, Gender) VALUES
(1,	'Price', 	'Taylor',	'M'),
(2,	'Gamble',	'Ellyse',   'F'),
(3,	'Tan',	    'Tilly', 	'F'),
(103031281, 'Hassen', 'Ahlam', 'F');

INSERT INTO Event (TourName, EventMonth, EventDay, EventYear, EventFee) VALUES
('North',	'Jan',	9,	2016,	200),
('North',	'Feb',	13,	2016,	225),
('South',	'Jan',	9,	2016,	200),
('South',	'Jan',	16,	2016,	200),
('West',	'Jan',	29,	2016,	225);

INSERT INTO Booking (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES
(1,	'North',	'Jan',  9,	2016,	200,	'12/10/2015'),
(2,	'North',    'Jan',  9,	2016,	200,    '12/16/2015'),
(1,	'North',	'Feb',  13,	2016,	225,	'1/8/2016'),
(2,	'North',    'Feb',  13,	2016,	125,	'1/14/2016'),
(3,	'North',	'Feb',  13,	2016,	225,	'2/3/2016'),
(1,	'South',	'Jan',  9,	2016,	200,	'12/10/2015'),
(2,	'South',	'Jan',  16,	2016,	200,	'12/18/2015'),
(3,	'South',	'Jan',  16,	2016,	200,	'1/9/2016'),
(2,	'West',	    'Jan',  29,	2016,	225,	'12/17/2015'),
(3,	'West',	    'Jan',  29,	2016,	200,	'12/18/2015');

SELECT * FROM Client;
