-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO COMP421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the insert for the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.

-- A more complex syntax that saves you typing effort.

INSERT INTO Users (emailAddress, password) VALUES
('john.doe22@anonymous.ca', 'password123'),
('bea.trice@bee.com', 'beasknees!'),
('oceanwaves67@amazon.ca', 'wavezzz88'),
('mike.ike123@mikeike.com', 'mikeike67'),
('harry.potter@hogwarts.com', 'wizard'),
('gandalf@middle.earth.com', 'YOUSHALLNOTPASS'),
('frodo.baggins@hobbit.ca', 'password123'),
('daenerys.targaryen@got.ca', 'ilikedragons!'),
('mrandmssmith@hollywood.com', 'idkANYmore'),
('the.real.rihanna@anti.com', 'shine_bright_likeadiamond'),
('dwayne.johnson@movies.com', 'therockiscooking123456789'),
('scooby.doo@mystery.ca', 'scoobydoobydoo')
;

INSERT INTO RegularUser (emailAddress) VALUES
('john.doe22@anonymous.ca'),
('bea.trice@bee.com'),
('oceanwaves67@amazon.ca'),
('mike.ike123@mikeike.com'),
('harry.potter@hogwarts.com'),
('frodo.baggins@hobbit.ca'),
('mrandmssmith@hollywood.com')
;

INSERT INTO Admin (emailAddress) VALUES
('gandalf@middle.earth.com'),
('daenerys.targaryen@got.ca'),
('the.real.rihanna@anti.com'),
('dwayne.johnson@movies.com'),
('scooby.doo@mystery.ca')
;

INSERT INTO Genre (genreName) VALUES
('classical'),
('pop'),
('rap'),
('rock'),
('rnb'),
('jazz'),
('electronic'),
('ambient'),
('country'),
('90s'),
('80s'),
('2010s'),
('hip hop'),
('punk'),
('disco'),
('funk'),
('metal'),
('folk'),
('70s')
;

INSERT INTO favourite_genre (emailAddress, genreName) VALUES
('frodo.baggins@hobbit.ca', 'rock'),
('bea.trice@bee.com', '70s'),
('harry.potter@hogwarts.com', 'country'),
('mike.ike123@mikeike.com', 'electronic'),
('harry.potter@hogwarts.com', 'disco'),
('frodo.baggins@hobbit.ca', 'electronic'),
('mrandmssmith@hollywood.com', 'pop'),
('harry.potter@hogwarts.com', 'classical')
;

INSERT INTO Artist (artistId, name) VALUES
(10001, 'Madonna'),
(123, 'Mariah Carey'),
(98765, 'Dire Straits'),
(9999, 'Mozart'),
(65432, 'Queen'),
(76423, 'Madonna'),
(416, 'Hozier'),
(74322, 'Alphaville'),
(1298, 'Chopin'),
(12, 'Rihanna'),
(1, 'Doechii'),
(67, 'Fleetwood Mac'),
(12345, 'The Beatles'),
(480, 'Avicii')
;

INSERT INTO favourite_artist (emailAddress, artistId) VALUES
('john.doe22@anonymous.ca', 74322),
('bea.trice@bee.com', 1),
('frodo.baggins@hobbit.ca', 480),
('mike.ike123@mikeike.com', 480),
('harry.potter@hogwarts.com', 123),
('frodo.baggins@hobbit.ca', 98765),
('frodo.baggins@hobbit.ca', 1),
('bea.trice@bee.com', 67)
;

INSERT INTO artist_genre (genreName, artistId) VALUES
('pop', 10001),
('pop', 123),
('rock', 98765),
('classical', 9999),
('rock', 65432),
('80s', 76423),
('folk', 416),
('pop', 74322),
('classical', 1298),
('rnb', 12),
('hip hop', 1),
('rock', 67),
('rock', 12345),
('electronic', 480),
('80s', 10001),
('70s', 67),
('rap', 1),
('rnb', 1)
;

INSERT INTO Venue (address, venueName, capacity) VALUES
('1500 Berry Avenue, Toronto, Canada', 'Some Music Venue', 18090),
('1909 Avenue des Canadien-de-Montreal, Montreal, Canada', 'Centre Bell', 21000),
('7506 Rue Mouton, Quebec, Canada', 'Mouton Concert Hall', 12505),
('319 Blues Road, London, Canada', 'Blues Rule Venue', 2500),
('456 South Mountain Boulevard, Vancouver, Canada', 'Big Rock Music Centre', 17600),
('1532 Classical Drive, Halifax, Canada', 'Lobster Hall', 9950),
('164 Sunnyside Road, Ottawa, Canada', 'Sun Music', 3450),
('8739 Berry Avenue, Toronto, Canada', 'Some Other Music Venue', 1500),
('164 Sunnyside Road, Winnipeg, Canada', 'Sun Music', 3450)
;

INSERT INTO venues_near_me (emailAddress, address) VALUES
('john.doe22@anonymous.ca', '1500 Berry Avenue, Toronto, Canada'),
('bea.trice@bee.com', '7506 Rue Mouton, Quebec, Canada'),
('oceanwaves67@amazon.ca', '1909 Avenue des Canadien-de-Montreal, Montreal, Canada'),
('mike.ike123@mikeike.com', '319 Blues Road, London, Canada'),
('harry.potter@hogwarts.com', '456 South Mountain Boulevard, Vancouver, Canada'),
('frodo.baggins@hobbit.ca', '1909 Avenue des Canadien-de-Montreal, Montreal, Canada'),
('mrandmssmith@hollywood.com', '164 Sunnyside Road, Winnipeg, Canada'),
('john.doe22@anonymous.ca', '8739 Berry Avenue, Toronto, Canada'),
('john.doe22@anonymous.ca', '319 Blues Road, London, Canada'),
('frodo.baggins@hobbit.ca', '7506 Rue Mouton, Quebec, Canada')
;

INSERT INTO venue_genre (address, genreName) VALUES
('1500 Berry Avenue, Toronto, Canada', 'pop'),
('164 Sunnyside Road, Ottawa, Canada', 'hip hop'),
('7506 Rue Mouton, Quebec, Canada', 'classical'),
('319 Blues Road, London, Canada', 'classical'),
('456 South Mountain Boulevard, Vancouver, Canada', 'rock'),
('1532 Classical Drive, Halifax, Canada', 'classical'),
('164 Sunnyside Road, Ottawa, Canada', 'electronic'),
('8739 Berry Avenue, Toronto, Canada', 'country'),
('456 South Mountain Boulevard, Vancouver, Canada', 'folk'),
('319 Blues Road, London, Canada', 'jazz'),
('1500 Berry Avenue, Toronto, Canada', 'rnb')
;

INSERT INTO concert (artistId, address, concertDate) VALUES
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20'),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27'),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13'),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23'),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28'),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01'),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12'),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12'),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27')
;

INSERT INTO Tickets (artistId, address, concertDate, section, seatNumber, price) VALUES
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '202', 13, 110.53),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '210', 23, 210.89),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '310', 30, 80.9),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', 'General Admission', 12, 235.45),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '202', 13, 110.53),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '202', 12, 110.53),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '101', 1, 305.89),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '230', 13, 97),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '230', 15, 97),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '130', 13, 130.13),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', 'General Admission', 1, 856.15),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '402', 30, 456.89),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '204', 28, 188.6),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '323', 7, 100.42),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '209', 4, 167.95),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '430', 20, 73.19),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '209', 17, 153.1),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '101', 2, 273.55),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '417', 20, 65.88),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '113', 27, 217.41),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '123', 25, 298.03),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '124', 23, 294.21),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '211', 20, 176.39),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '322', 6, 126.55),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '301', 13, 108.34),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '203', 11, 173.42),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '105', 13, 209.57),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '122', 6, 285.92),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '116', 13, 271.0),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '230', 30, 158.68),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '310', 16, 132.93),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '119', 22, 200.51),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '326', 26, 136.23),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '322', 23, 139.27),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '423', 25, 74.67),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '414', 7, 59.32),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '410', 9, 74.28),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '102', 4, 251.32),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '318', 11, 135.99),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '427', 15, 53.03),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '312', 11, 143.92),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '219', 19, 169.83),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '413', 6, 94.83),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '413', 16, 97.17),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '224', 30, 187.34),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '205', 25, 168.88),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', 'VIP', 22, 491.32),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '327', 25, 101.48),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '315', 10, 147.89),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '112', 15, 281.63),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '122', 2, 253.63),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '106', 5, 232.42),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '223', 21, 185.61),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '419', 11, 79.23),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '404', 16, 54.6),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '408', 19, 59.88),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '428', 30, 64.87),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '327', 10, 105.99),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '318', 9, 102.83),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '224', 1, 163.77),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '109', 3, 232.14),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '330', 26, 127.75),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '208', 14, 150.58),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '230', 20, 166.51),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '224', 12, 176.24),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '401', 30, 56.9),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '103', 28, 242.67),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '430', 18, 98.83),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '204', 5, 162.58),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '101', 4, 261.4),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '130', 23, 262.28),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '113', 15, 277.39),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '117', 19, 265.82),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '304', 16, 130.53),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '326', 29, 119.4),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '311', 15, 105.6),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '219', 9, 187.59),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '327', 1, 107.91),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '311', 16, 111.98),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '308', 22, 136.44),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '328', 22, 119.3),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '316', 7, 130.93),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '210', 4, 175.07),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '127', 8, 215.11),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '414', 23, 94.38),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '207', 30, 162.35),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '105', 16, 266.85),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '204', 30, 155.14),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '103', 8, 210.58),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '119', 1, 272.36),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '418', 4, 76.22),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '212', 12, 191.17),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '125', 29, 215.37),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '125', 1, 206.06),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '401', 5, 57.11),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '412', 24, 69.16),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '104', 20, 247.74),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '428', 14, 82.39),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '212', 20, 172.19),
(416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01', '409', 2, 89.21),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '306', 29, 143.31),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '306', 17, 119.96),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '405', 7, 57.1),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '301', 5, 127.92),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27', '113', 21, 212.05),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '227', 20, 159.16),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '223', 1, 191.93),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '417', 8, 85.89),
(480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27', '223', 25, 151.23),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '224', 8, 162.61),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '313', 26, 111.13),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '324', 7, 129.5)
;

INSERT INTO online_purchase (artistId, address, concertDate, section, seatNumber, emailAddress) VALUES
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '202', 13, 'mrandmssmith@hollywood.com'),
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '210', 23, 'frodo.baggins@hobbit.ca'),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', '310', 30, 'mrandmssmith@hollywood.com'),
(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20', 'General Admission', 12, 'oceanwaves67@amazon.ca'),
(416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28', '202', 13, 'harry.potter@hogwarts.com')
;

INSERT INTO in_person_purchase (artistId, address, concertDate, section, seatNumber, emailAddress) VALUES
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '101', 1, 'gandalf@middle.earth.com'),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '230', 13, 'daenerys.targaryen@got.ca'),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '230', 15, 'daenerys.targaryen@got.ca'),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '130', 13, 'gandalf@middle.earth.com'),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', 'General Admission', 1, 'the.real.rihanna@anti.com'),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '402', 30, 'daenerys.targaryen@got.ca')
;

INSERT INTO scan (artistId, address, concertDate, section, seatNumber, emailAddress) VALUES
(98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13', '101', 1, 'daenerys.targaryen@got.ca'),
(9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23', '230', 13, 'scooby.doo@mystery.ca'),
(67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12', '130', 13, 'daenerys.targaryen@got.ca'),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', 'General Admission', 1, 'the.real.rihanna@anti.com'),
(480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12', '402', 30, 'the.real.rihanna@anti.com')
;
