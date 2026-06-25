




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








