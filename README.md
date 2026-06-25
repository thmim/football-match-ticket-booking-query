# Football Ticket Booking Database Queries

This repository contains PostgreSQL table schemas and SQL queries for a Football Ticket Booking System.

## Database Tables

* **Users** - Stores customer and manager information.
* **Matches** - Stores football match details, ticket prices, and availability status.
* **Bookings** - Stores ticket booking records and payment information.

## Features

* SQL queries using:

  * Filtering (`WHERE`)
  * Pattern Matching (`ILIKE`)
  * NULL Handling (`COALESCE`)
  * Joins (`INNER JOIN`, `LEFT JOIN`)
  * Aggregate Functions (`AVG`)
  * Subqueries
  * Sorting, `LIMIT`, and `OFFSET`

## Queries Included

1. Retrieve available Champions League matches.
2. Search users by name pattern.
3. Handle NULL payment statuses using `COALESCE`.
4. Display booking details with user and match information.
5. Show all users, including those without bookings.
6. Find bookings with costs above the average booking cost.
7. Retrieve expensive matches using sorting and pagination techniques.




