

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
    seat_number varchar(20),
    payment_status varchar(50) check (payment_status in ('Pending', 'Confirmed','Cancelled','Refunded')),
    total_cost int not null check (total_cost > 0)
);


-- insert data in user table

INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);



INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');


INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);


-- query-1
select 
match_id,
fixture,
base_ticket_price
 from matches where match_status='Available' and tournament_category='Champions League';

-- query-2
select user_id,full_name,email from users where full_name ilike 'Tanvir%' or full_name ilike '%haque%';

-- query-3
select booking_id,user_id,match_id, coalesce(payment_status, 'Action Required') as systematic_status
  from bookings
  where payment_status is null;

-- query-4
select b.booking_id, u.full_name, m.fixture, b.total_cost
from bookings as b
join users as u
    on b.user_id = u.user_id
join matches as m
    on b.match_id = m.match_id;

    -- query-5
select u.user_id, u.full_name, b.booking_id
from users as u
left join bookings as b
    on u.user_id = b.user_id;

-- query-6
select booking_id,match_id,total_cost
from bookings
where total_cost >
(
    select avg(total_cost)
    from bookings
);

-- query-7
select match_id,fixture,base_ticket_price
from matches
order by base_ticket_price desc
offset 1
limit 2;








