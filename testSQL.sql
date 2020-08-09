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