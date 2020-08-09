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

SELECT * FROM -- Get a list of tables and views in the current database
SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
FROM INFORMATION_SCHEMA.TABLES
GO