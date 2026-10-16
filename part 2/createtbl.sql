-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO COMP421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables have already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE Users
(
    emailAddress VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    PRIMARY KEY(emailAddress)
);

CREATE TABLE RegularUser
(
    emailAddress VARCHAR(30) NOT NULL,
    PRIMARY KEY (emailAddress),
    FOREIGN KEY (emailAddress) REFERENCES Users(emailAddress)
);

CREATE TABLE Admin
(
    emailAddress VARCHAR(30) NOT NULL,
    PRIMARY KEY (emailAddress),
    FOREIGN KEY (emailAddress) REFERENCES Users(emailAddress)
);

CREATE TABLE Genre
(
    genreName VARCHAR(52) NOT NULL,
    PRIMARY KEY (genreName)
);

CREATE TABLE favourite_genre
(
    emailAddress VARCHAR(30) NOT NULL,
    genreName VARCHAR(52) NOT NULL,
    PRIMARY KEY (emailAddress, genreName),
    FOREIGN KEY (emailAddress) REFERENCES Users(emailAddress),
    FOREIGN KEY (genreName) REFERENCES Genre(genreName)
);

CREATE TABLE Artist
(
    artistId INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (artistId)
);

CREATE TABLE favourite_artist
(
    emailAddress VARCHAR(30) NOT NULL,
    artistId INTEGER NOT NULL,
    PRIMARY KEY (emailAddress, artistId),
    FOREIGN KEY (emailAddress) REFERENCES Users(emailAddress),
    FOREIGN KEY (artistId) REFERENCES Artist(artistId)
);

CREATE TABLE artist_genre
(
    genreName VARCHAR(52) NOT NULL,
    artistId INTEGER NOT NULL,
    PRIMARY KEY (genreName, artistId),
    FOREIGN KEY (genreName) REFERENCES Genre(genreName),
    FOREIGN KEY (artistId) REFERENCES Artist(artistId)
);

CREATE TABLE Venue
(
    address VARCHAR(255) NOT NULL,
    venueName VARCHAR(30) NOT NULL,
    capacity INTEGER NOT NULL,
    PRIMARY KEY (address)
);

CREATE TABLE venues_near_me
(
    emailAddress VARCHAR(30) NOT NULL,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (emailAddress, address),
    FOREIGN KEY (emailAddress) REFERENCES Users(emailAddress),
    FOREIGN KEY (address) REFERENCES Venue(address)
);

CREATE TABLE venue_genre
(
    address VARCHAR(255) NOT NULL,
    genreName VARCHAR(52) NOT NULL,
    PRIMARY KEY (address, genreName),
    FOREIGN KEY (address) REFERENCES Venue(address),
    FOREIGN KEY (genreName) REFERENCES Genre(genreName)
);

CREATE TABLE concert
(
    artistId INTEGER NOT NULL,
    address VARCHAR(255) NOT NULL,
    concertDate DATE NOT NULL,
    PRIMARY KEY (artistId, address, concertDate),
    FOREIGN KEY (artistId) REFERENCES Artist(artistId),
    FOREIGN KEY (address) REFERENCES Venue(address)
);

CREATE TABLE Tickets
(
    artistId INTEGER NOT NULL,
    address VARCHAR(255) NOT NULL,
    concertDate DATE NOT NULL,
    section VARCHAR(20) NOT NULL,
    seatNumber INTEGER NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (artistId, address, concertDate, section, seatNumber),
    FOREIGN KEY (artistId, address, concertDate) REFERENCES concert(artistId, address, concertDate)
);

CREATE TABLE online_purchase
(
    artistId INTEGER NOT NULL,
    address VARCHAR(255) NOT NULL,
    concertDate DATE NOT NULL,
    section VARCHAR(20) NOT NULL,
    seatNumber INTEGER NOT NULL,
    emailAddress VARCHAR(30) NOT NULL,
    PRIMARY KEY (artistId, address, concertDate, section, seatNumber),
    FOREIGN KEY (artistId, address, concertDate, section, seatNumber) REFERENCES Tickets(artistId, address, concertDate, section, seatNumber),
    FOREIGN KEY (emailAddress) REFERENCES RegularUser(emailAddress)
);

CREATE TABLE in_person_purchase
(
    artistId INTEGER NOT NULL,
    address VARCHAR(255) NOT NULL,
    concertDate DATE NOT NULL,
    section VARCHAR(20) NOT NULL,
    seatNumber INTEGER NOT NULL,
    emailAddress VARCHAR(30) NOT NULL,
    PRIMARY KEY (artistId, address, concertDate, section, seatNumber),
    FOREIGN KEY (artistId, address, concertDate, section, seatNumber) REFERENCES Tickets(artistId, address, concertDate, section, seatNumber),
    FOREIGN KEY (emailAddress) REFERENCES Admin(emailAddress)
);

CREATE TABLE scan
(
    artistId INTEGER NOT NULL,
    address VARCHAR(255) NOT NULL,
    concertDate DATE NOT NULL,
    section VARCHAR(20) NOT NULL,
    seatNumber INTEGER NOT NULL,
    emailAddress VARCHAR(30) NOT NULL,
    PRIMARY KEY (artistId, address, concertDate, section, seatNumber),
    FOREIGN KEY (artistId, address, concertDate, section, seatNumber) REFERENCES Tickets(artistId, address, concertDate, section, seatNumber),
    FOREIGN KEY (emailAddress) REFERENCES Admin(emailAddress)
);
