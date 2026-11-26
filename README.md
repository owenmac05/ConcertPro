# ConcertPro

A concert ticketing and management system: a relational database design in Db2 plus a command-line Java application (JDBC) for buying tickets, recommending concerts, and managing accounts.

![ER diagram](<part 1/project1-ER.pdf>)

*Course project, COMP 421 (Database Systems), Winter 2026, McGill University. Team of 4.*

## Overview

ConcertPro models a ticketing platform like Ticketmaster: users, artists, venues, concerts, and individual seats. Regular users buy tickets online and get concert recommendations from their favourite artists and genres. Admins sell tickets in person at a counter and scan tickets at entry.

The project was built in three phases: requirements and ER design, relational schema and SQL, and a Java application on top of the database.

## My contributions

- **Relational model:** I mapped the ER model to the relational schema (Part 1) and co-designed the entity sets and relationships.
- **Data loading and generation:** I loaded the data into Db2 (Part 2) and wrote the Python script that generates 100 unique, price-tiered ticket records in [tupleGenerator.py](<part 2/tupleGenerator.py>).
- **CHECK constraints:** I added two constraints, a minimum concert date and non-negative venue capacity.
- **Show Recommended Concerts (Java/JDBC):** I wrote this feature in [ShowRecConcertsService.java](<part 3/ShowRecConcertsService.java>). It takes a user's email address and returns concerts by their favourite artists or by artists in their favourite genres, using a parameterized query with nested subqueries.
- **Data visualization:** I exported ticket sales from Db2 to CSV and charted the top artists by tickets sold.
- I also wrote my parts in the reports.

My teammates built the remaining parts.

## Features

1. **Buy ticket (regular users):** login, seat lookup, sold-seat check, and age verification for age-restricted artists
2. **Admin buy ticket:** in-person sale to a walk-in customer, with no customer account needed
3. **Add favourite artist**
4. **Show recommended concerts:** by favourite artists and favourite genres
5. **Create user account:** regular or admin, with a favourite-genre sub-menu built from the database

On the database side, the project also includes five analytical queries, data modifications, views, CHECK constraints, a stored procedure with a cursor ApplyGenreDiscount, two indexes, and a window-function query.

## Tech stack

Db2, SQL, Java (JDBC), Python

## Database design

16 tables, all in [createtbl.sql](<part 2/createtbl.sql>):

| Group | Tables |
|-------|--------|
| Users | Users, RegularUser, Admin (a non-overlapping, covering ISA hierarchy) |
| Music | Artist, Genre, artist_genre |
| Venues | Venue, venue_genre, venues_near_me |
| Preferences | favourite_artist, favourite_genre |
| Events | concert, Tickets (identified by concert, section, and seat) |
| Sales | online_purchase, in_person_purchase, scan |

## Running it

ConcertPro ran against McGill's Db2 server for the course, so it can't be run directly outside that environment. The report screenshots show it working.

To run it against your own Db2 instance (steps not tested outside the course setup):

1. Run [createtbl.sql](<part 2/createtbl.sql>), then [loaddata.sql](<part 2/loaddata.sql>).
2. Set the SOCSUSER and SOCSPASSWD environment variables.
3. Update the connection URL in [ConcertPro.java](<part 3/ConcertPro.java>) and put the Db2 JDBC driver on the classpath.
4. Compile and run ConcertPro.

## Documentation (reports)

- [Part 1: requirements and ER design](<part 1/project1.pdf>)
- [Part 2: relational schema, queries, views, and constraints](<part 2/project2.pdf>)
- [Part 3: application program, stored procedure, indexes, and visualization](<part 3/project3.pdf>)

## Known limitations

- **Plaintext passwords:** passwords are stored and compared in SQL.
- **The concert-date CHECK:** hardcoded to a fixed date.
- **Small test data:** only a few artists have ticket sales, and ticket prices follow section tiers, not artist demand.

## Team

Owen MacDonald, Laurier Lefebvre, Johnny Weng Lin, Ayush Srivastava.
