create database TicketBookingSystem;
use TicketBookingSystem;

--Task 1

-- Venu Table
create table Venu (
    venue_id int primary key identity(1,1),
    venue_name varchar(100),
    address varchar(200)
);

-- Booking Table 
create table Booking (
    booking_id int primary key identity(1,1),
    customer_id int,
    event_id int,
    num_tickets int,
    total_cost decimal(10, 2),
    booking_date datetime
);

-- Event Table
create table Event (
    event_id int primary key identity(1,1),
    event_name varchar(100),
    event_date date,
    event_time time,
    venue_id int foreign key references Venu(venue_id),
    total_seats int,
    available_seats int,
    ticket_price decimal(10, 2),
    event_type varchar(20),  -- no enum in SQL Server, use check constraint optionally
    booking_id int foreign key references Booking(booking_id)
);

-- Customer Table
create table Customer (
    customer_id int primary key identity(1,1),
    customer_name varchar(100),
    email varchar(100),
    phone_number varchar(15),
    booking_id int foreign key references Booking(booking_id)
);

);

--Task 2

-- 1. Insert 10 sample records 

insert into Venu (venue_name, address) values
('Sathyam Cinemas', 'Chennai'),
('PVR Mall', 'Bangalore'),
('Lulu Arena', 'Kochi'),
('Phoenix Marketcity', 'Mumbai'),
('Inox', 'Delhi'),
('Jazz Grounds', 'Hyderabad'),
('Royal Stage', 'Kolkata'),
('City Dome', 'Ahmedabad'),
('Grand Theatres', 'Pune'),
('Orbit Hall', 'Jaipur');

insert into Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type)
values
('Movie Night', '2025-05-10', '18:00', 1, 100, 50, 250.00, 'Movie'),
('Rock Concert', '2025-05-12', '19:30', 2, 500, 120, 1500.00, 'Concert'),
('Cricket Cup', '2025-06-01', '14:00', 3, 20000, 18000, 2200.00, 'Sports'),
('Comedy Show', '2025-05-20', '20:00', 4, 300, 100, 800.00, 'Concert'),
('Football Finals', '2025-06-15', '17:00', 5, 25000, 20000, 1800.00, 'Sports'),
('Jazz Fest', '2025-05-25', '21:00', 6, 150, 80, 1200.00, 'Concert'),
('Action Movie', '2025-06-05', '18:30', 7, 200, 60, 300.00, 'Movie'),
('Drama Play', '2025-06-10', '19:00', 8, 350, 200, 950.00, 'Concert'),
('Basketball Match', '2025-06-20', '16:00', 9, 15000, 14500, 1700.00, 'Sports'),
('Musical Night', '2025-05-30', '20:00', 10, 500, 250, 1000.00, 'Concert');

insert into Customer (customer_name, email, phone_number)
values
('Ananya Rao', 'ananya@example.com', '9123450001'),
('Karthik M', 'karthikm@example.com', '9876500002'),
('Meera Iyer', 'meera.iyer@example.com', '9988800003'),
('Rahul Dev', 'rahul.dev@example.com', '9090900004'),
('Sneha Reddy', 'sneha.reddy@example.com', '9887700005'),
('Arjun Patel', 'arjun.patel@example.com', '9345600006'),
('Lakshmi Menon', 'lakshmi.menon@example.com', '9443300007'),
('Ravi Teja', 'ravi.teja@example.com', '9654400008'),
('Divya Singh', 'divya.singh@example.com', '9344200009'),
('Manoj Yadav', 'manoj.yadav@example.com', '9001200000');

insert into Booking (customer_id, event_id, num_tickets, total_cost, booking_date)
values
(1, 1, 2, 500.00, '2025-04-20 10:00:00'),
(2, 2, 4, 6000.00, '2025-04-21 12:30:00'),
(3, 3, 3, 6600.00, '2025-04-22 14:15:00'),
(4, 4, 1, 800.00, '2025-04-23 16:00:00'),
(5, 5, 5, 9000.00, '2025-04-24 17:45:00'),
(6, 6, 2, 2400.00, '2025-04-25 18:20:00'),
(7, 7, 3, 900.00, '2025-04-26 11:10:00'),
(8, 8, 2, 1900.00, '2025-04-27 13:30:00'),
(9, 9, 4, 6800.00, '2025-04-28 15:25:00'),
(10, 10, 5, 5000.00, '2025-04-29 17:50:00');



-- 2. List all Events
select * from Event;

-- 3. Events with available tickets
select * from Event where available_seats > 0;

-- 4. Events with name like 'cup'
select * from Event where event_name like '%cup%';

-- 5. Events with price between 1000 and 2500
select * from Event where ticket_price between 1000 and 2500;

-- 6. Events with dates in a specific range
select * from Event where event_date between '2025-05-01' and '2025-06-01';

-- 7. Concerts with available tickets
select * from Event where available_seats > 0 and event_type = 'Concert';

-- 8. Users in batches of 5 starting from 6th
select * 
from Customer
order by customer_id
offset 5 rows fetch next 5 rows only;


-- 9. Bookings with more than 4 tickets
select * from Booking where num_tickets > 4;

-- 10. Customers whose phone ends with '000'
select * from Customer where phone_number like '%000';

-- 11. Events with seat capacity > 15000
select * from Event where total_seats > 15000 order by total_seats;

-- 12. Events not starting with x, y, z
select * from Event where event_name not like 'x%' and event_name not like 'y%' and event_name not like 'z%';

--Task 3

-- 1. Events and average ticket prices
select event_name, avg(ticket_price) as avg_price from Event group by event_name;

-- 2. Total revenue by events
select e.event_name, sum(b.total_cost) as total_revenue 
from Booking b join Event e on b.event_id = e.event_id 
group by e.event_name;

-- 3. Event with highest ticket sales
select top 1 event_id, sum(num_tickets) as tickets_sold
from Booking
group by event_id
order by tickets_sold desc;


-- 4. Tickets sold per event
select event_id, sum(num_tickets) as total_sold from Booking group by event_id;

-- 5. Events with no ticket sales
select * from Event 
where event_id not in (select distinct event_id from Booking);

-- 6. User who booked the most tickets
select top 1 customer_id, sum(num_tickets) as total_tickets
from Booking
group by customer_id
order by total_tickets desc;

-- 7. Events & tickets sold per month
select 
    format(booking_date, 'yyyy-MM') as booking_month,
    event_id,
    sum(num_tickets) as total_tickets
from Booking
group by format(booking_date, 'yyyy-MM'), event_id
order by booking_month;


-- 8. Avg ticket price per venue
select v.venue_name, avg(e.ticket_price) as avg_price 
from Event e join Venu v on e.venue_id = v.venue_id group by v.venue_name;

-- 9. Tickets sold per event type
select event_type, sum(b.num_tickets) as total_sold 
from Event e join Booking b on e.event_id = b.event_id 
group by event_type;

-- 10. Revenue per year
select year(booking_date) as [year], sum(total_cost) as revenue
from Booking
group by year(booking_date)
order by [year];


-- 11. Users who booked for multiple events
select customer_id from Booking group by customer_id having count(distinct event_id) > 1;

-- 12. Revenue per user
select c.customer_id, c.customer_name, sum(b.total_cost) as total_spent
from Customer c
join Booking b on c.customer_id = b.customer_id
group by c.customer_id, c.customer_name
order by total_spent desc;


-- 13. Avg ticket price per category and venue
select event_type, v.venue_name, avg(e.ticket_price) as avg_price 
from Event e join Venu v on e.venue_id = v.venue_id 
group by event_type, v.venue_name;

-- 14. Users & tickets in last 30 days
select c.customer_id, c.customer_name, sum(b.num_tickets) as recent_tickets 
from Customer c 
join Booking b on c.customer_id = b.customer_id 
where booking_date >= dateadd(day, -30, getdate())
group by c.customer_id, c.customer_name
order by recent_tickets desc;


--Task 4

-- 1. Avg ticket price per venue (subquery)
select venue_id, (select avg(ticket_price) from Event e2 where e2.venue_id = e1.venue_id) as avg_price 
from Event e1 group by venue_id;

-- 2. Events with > 50% tickets sold
select * 
from Event 
where event_id in (
    select e.event_id 
    from Event e 
    join Booking b on e.event_id = b.event_id 
    group by e.event_id, e.total_seats
    having sum(b.num_tickets) > e.total_seats / 2
);


-- 3. Total tickets sold per event
select event_id, (select sum(num_tickets) from Booking b where b.event_id = e.event_id) as total_sold 
from Event e;

-- 4. Users with no bookings
select * from Customer 
where not exists (
    select * from Booking b where b.customer_id = Customer.customer_id
);

-- 5. Events with no ticket sales
select * from Event 
where event_id not in (select distinct event_id from Booking);

-- 6. Tickets per event type using FROM subquery
select event_type, sum(total_tickets) from (
    select e.event_type, sum(b.num_tickets) as total_tickets 
    from Event e join Booking b on e.event_id = b.event_id 
    group by e.event_type
) as t group by event_type;

-- 7. Events with price > avg price
select * from Event 
where ticket_price > (select avg(ticket_price) from Event);

-- 8. Revenue per user (correlated subquery)
select customer_id, (
    select sum(b2.total_cost) from Booking b2 where b2.customer_id = b1.customer_id
) as total_spent from Booking b1 group by customer_id;

-- 9. Users who booked in a specific venue (say ID = 2)
select * from Customer 
where customer_id in (
    select b.customer_id from Booking b 
    join Event e on b.event_id = e.event_id 
    where e.venue_id = 2
);

-- 10. Tickets per event category
select e.event_type, 
       sum(b.num_tickets) as tickets_sold
from Event e
left join Booking b on e.event_id = b.event_id
group by e.event_type;

-- 11. Users booking per month
select distinct customer_id 
from Booking 
where month(booking_date) = month(GETDATE());


-- 12. (Repeated) Avg ticket price per venue
select venue_id, (
    select avg(ticket_price) from Event e2 where e2.venue_id = e1.venue_id
) as avg_price from Event e1 group by venue_id;
