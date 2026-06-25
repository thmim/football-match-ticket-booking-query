

CREATE TABLE Users (
    user_id serial primary key,
    full_name varchar(50) not null,
    email varchar(100) unique,
    role varchar(20) check (role in ('Football Fan', 'Ticket Manager')),
    phone_number varchar(20)
    
    
);

-- create matches table


CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(255) not null,
    tournament_category varchar(150) not null,
    base_ticket_price int not null check (base_ticket_price > 0),
    match_status varchar(50) not null check (match_status in ('Available', 'Selling Fast','Sold Out','Postponed'))
    
   
);

-- bookings table
CREATE TABLE Bookings (
    booking_id serial primary key,
    user_id int references "users"(user_id),
    match_id int references "matches"(match_id),
    seat_number int,
    payment_status varchar(50) check (payment_status in ('Pending', 'Confirmed','Cancelled','Refunded')),
    total_cost int not null check (total_cost > 0)
    
);

-- query-1
select match_id,fixture,base_ticket_price from matches where match_status='Available' and tournament_category='Champions League';

-- query-2
select user_id,full_name,email from users where full_name ilike 'Tanvir%' or full_name ilike '%haque%';

-- query-3
select booking_id,user_id,match_id, coalesce(payment_status, 'Action Required') as systematic_status
  from bookings
  where payment_status is null;

-- query-4
select
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
from bookings as b
join users as u
    on b.user_id = u.user_id
join matches as m
    on b.match_id = m.match_id;








