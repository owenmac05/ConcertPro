-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO COMP421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    BEFORE the ddls to drop the parent tables (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.
DROP TABLE online_purchase;
DROP TABLE in_person_purchase;
DROP TABLE scan;
DROP TABLE Tickets;
DROP TABLE concert;
DROP TABLE venue_genre;
DROP TABLE venues_near_me;
DROP TABLE artist_genre;
DROP TABLE favourite_artist;
DROP TABLE favourite_genre;
DROP TABLE Venue;
DROP TABLE Artist;
DROP TABLE Genre;
DROP TABLE Admin;
DROP TABLE RegularUser;
DROP TABLE Users;
