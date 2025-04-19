--Task 1:Database Design

create database Courier_Management_System ;
use Courier_Management_System;

--Defining schemas
-- user table
create table [user] (
  userid int primary key,
  name varchar(255),
  email varchar(255) unique,
  password varchar(255),
  contactnumber varchar(20),
  address text
);

--courier table
create table courier (
  courierid int primary key,
  sendername varchar(255),
  senderaddress text,
  receivername varchar(255),
  receiveraddress text,
  weight decimal(5,2),
  status varchar(50),
  trackingnumber varchar(20) unique,
  deliverydate date
  );

--courierservices table
create table courierservices (
  serviceid int primary key,
  servicename varchar(100),
  cost decimal(8,2)
);

--employee table
create table employee (
  employeeid int primary key,
  name varchar(255),
  email varchar(255) unique,
  contactnumber varchar(20),
  role varchar(50),
  salary decimal(10,2)
);

--location table
create table location (
  locationid int primary key,
  locationname varchar(100),
  address text
);

--payment table
create table payment (
  paymentid int primary key,
  courierid int,
  locationid int,
  amount decimal(10,2),
  paymentdate date,
  foreign key (courierid) references courier(courierid),
  foreign key (locationid) references location(locationid)
);
--inserting values into tables
insert into [user] values (1, 'Arun Kumar', 'arun@gmail.com', 'pass123', '9876543210', 'Chennai');
insert into [user] values (2, 'Deepa Rani', 'deepa@gmail.com', 'deepa@321', '9999888877', 'Madurai');
insert into [user] values (3, 'Rahul Das', 'rahul@gmail.com', 'rahul@123', '9012345678', 'Trichy');
insert into [user] values (4, 'Swetha Nandhan', 'swetha@gmail.com', 'swetha@pass', '9090909090', 'Salem');
insert into [user] values (5, 'Ajay Singh', 'ajay@gmail.com', 'ajay!@#', '8899776655', 'Coimbatore');
insert into [user] values (6, 'Nisha Patel', 'nisha@gmail.com', 'nisha@123', '9123456780', 'Vellore');
insert into [user] values (7, 'Karthik Vijay', 'karthik@gmail.com', 'karthik123', '9876501234', 'Theni');
insert into [user] values (8, 'Meena Lakshman', 'meena@gmail.com', 'meena@me', '9988776655', 'Thanjavur');
insert into [user] values (9, 'Suresh Ravi', 'suresh@gmail.com', 'suresh321', '9123450098', 'Erode');
insert into [user] values (10, 'Lavanya Sidhu', 'lavanya@gmail.com', 'lava@pass', '9000088888', 'Kanyakumari');

insert into courier values (101, 'Arun Kumar', 'Chennai', 'Rahul Das', 'Trichy', 2.5, 'in transit', 'TRK001', '2025-04-14');
insert into courier values (102, 'Deepa Rani', 'Madurai', 'Ajay Singh', 'Coimbatore', 4.1, 'delivered', 'TRK002', '2025-04-10');
insert into courier values (103, 'Rahul Das', 'Trichy', 'Nisha Patel', 'Vellore', 3.2, 'processing', 'TRK003', '2025-04-15');
insert into courier values (104, 'Swetha Nandhan', 'Salem', 'Deepa Rani', 'Madurai', 1.9, 'delivered', 'TRK004', '2025-04-12');
insert into courier values (105, 'Ajay Singh', 'Coimbatore', 'Karthik Vijay', 'Theni', 2.0, 'in transit', 'TRK005', '2025-04-16');
insert into courier values (106, 'Nisha Patel', 'Vellore', 'Meena Lakshman', 'Thanjavur', 3.5, 'processing', 'TRK006', '2025-04-18');
insert into courier values (107, 'Karthik Vijay', 'Theni', 'Swetha Nandhan', 'Salem', 4.2, 'cancelled', 'TRK007', '2025-04-13');
insert into courier values (108, 'Meena Lakshman', 'Thanjavur', 'Suresh Ravi', 'Erode', 1.7, 'delivered', 'TRK008', '2025-04-11');
insert into courier values (109, 'Suresh Ravi', 'Erode', 'Lavanya Sidhu', 'Kanyakumari', 2.9, 'in transit', 'TRK009', '2025-04-15');
insert into courier values (110, 'Lavanya Sidhu', 'Kanyakumari', 'Arun Kumar', 'Chennai', 5.0, 'processing', 'TRK010', '2025-04-17');

insert into courierservices values (1, 'standard delivery', 100.00);
insert into courierservices values (2, 'express delivery', 250.00);
insert into courierservices values (3, 'overnight delivery', 400.00);
insert into courierservices values (4, 'same day delivery', 350.00);
insert into courierservices values (5, 'economy delivery', 80.00);
insert into courierservices values (6, 'premium service', 500.00);
insert into courierservices values (7, 'local delivery', 60.00);
insert into courierservices values (8, 'bulk shipping', 700.00);
insert into courierservices values (9, 'fragile item handling', 300.00);
insert into courierservices values (10, 'international shipping', 1000.00);

insert into employee values (1, 'Mohan Raj', 'mohan@gmail.com', '9000000001', 'delivery boy', 20000);
insert into employee values (2, 'Shreya', 'shreya@gmail.com', '9000000002', 'support staff', 25000);
insert into employee values (3, 'Kavin', 'kavin@gmail.com', '9000000003', 'delivery boy', 22000);
insert into employee values (4, 'Sahana', 'sahana@gmail.com', '9000000004', 'manager', 40000);
insert into employee values (5, 'Ravi', 'ravi@gmail.com', '9000000005', 'admin', 35000);
insert into employee values (6, 'Dinesh', 'dinesh@gmail.com', '9000000006', 'delivery boy', 21000);
insert into employee values (7, 'Anu', 'anu@gmail.com', '9000000007', 'support staff', 23000);
insert into employee values (8, 'Rajiv', 'rajiv@gmail.com', '9000000008', 'manager', 45000);
insert into employee values (9, 'Preethi', 'preethi@gmail.com', '9000000009', 'delivery boy', 24000);
insert into employee values (10, 'Vijay', 'vijay@gmail.com', '9000000010', 'admin', 36000);

insert into location values (1, 'chennai hub', 'Chennai');
insert into location values (2, 'madurai center', 'Madurai');
insert into location values (3, 'trichy branch', 'Trichy');
insert into location values (4, 'salem zone', 'Salem');
insert into location values (5, 'coimbatore depot', 'Coimbatore');
insert into location values (6, 'vellore point', 'Vellore');
insert into location values (7, 'theni node', 'Theni');
insert into location values (8, 'thanjavur line', 'Thanjavur');
insert into location values (9, 'erode sub', 'Erode');
insert into location values (10, 'kanyakumari stop', 'Kanyakumari');

insert into payment values (1, 101, 1, 120.00, '2025-04-10');
insert into payment values (2, 102, 2, 250.00, '2025-04-10');
insert into payment values (3, 103, 3, 150.00, '2025-04-11');
insert into payment values (4, 104, 4, 130.00, '2025-04-12');
insert into payment values (5, 105, 5, 220.00, '2025-04-13');
insert into payment values (6, 106, 6, 180.00, '2025-04-14');
insert into payment values (7, 107, 7, 210.00, '2025-04-15');
insert into payment values (8, 108, 8, 190.00, '2025-04-15');
insert into payment values (9, 109, 9, 240.00, '2025-04-16');
insert into payment values (10, 110, 10, 260.00, '2025-04-16');

--Task 2: Select,Where 

--1. List all customers:  
select * from [user];

--2. List all orders for a specific customer:
alter table courier add userid int;

update courier set userid = 1 where courierid = 101;
update courier set userid = 2 where courierid = 102;
update courier set userid = 3 where courierid = 103;
update courier set userid = 4 where courierid = 104;
update courier set userid = 5 where courierid = 105;
update courier set userid = 6 where courierid = 106;
update courier set userid = 7 where courierid = 107;
update courier set userid = 8 where courierid = 108;
update courier set userid = 9 where courierid = 109;
update courier set userid = 10 where courierid = 110;

select * from courier where userid = 1;



--3. List all couriers:
select * from courier;

--4. List all packages for a specific order:  
select * from courier where courierid = 101;

--5. List all deliveries for a specific courier:  
select * from courier where courierid = 106 and status = 'delivered';

--6. List all undelivered packages:  
select * from courier where status != 'delivered';

--7. List all packages that are scheduled for delivery today: 
select * from courier where deliverydate = cast(getdate() as date);

--8. List all packages with a specific status:  
select * from courier where status = 'in transit';

--9. Calculate the total number of packages for each courier.  
select courierid, count(*) as total_packages
from courier
group by courierid;

--10. Find the average delivery time for each courier  
alter table courier
add dispatchdate date;

update courier
set dispatchdate = case courierid
  when 1 then dateadd(day, -3, deliverydate)
  when 2 then dateadd(day, -2, deliverydate)
  when 3 then dateadd(day, -5, deliverydate)
  when 4 then dateadd(day, -4, deliverydate)
  when 5 then dateadd(day, -3, deliverydate)
  when 6 then dateadd(day, -1, deliverydate)
  when 7 then dateadd(day, -6, deliverydate)
  when 8 then dateadd(day, -2, deliverydate)
  when 9 then dateadd(day, -4, deliverydate)
  when 10 then dateadd(day, -3, deliverydate)
end;

select courierid, avg(datediff(day, dispatchdate, deliverydate)) as avg_delivery_days
from courier
group by courierid;

--11. List all packages with a specific weight range:  
select * from courier where weight between 2 and 5;

--12. Retrieve employees whose names contain 'John'  
select * from employee where name like '%john%';

--13. Retrieve all courier records with payments greater than $50.
select * 
from courier c
join payment p on c.courierid = p.courierid
where p.amount > 50;


--Task 3: GroupBy, Aggregate Functions, Having, Order By, where  

--14. Find the total number of couriers handled by each employee. 
alter table courier
add employeeid int;
update courier set employeeid = 201 where courierid = 101;
update courier set employeeid = 202 where courierid = 102;
update courier set employeeid = 203 where courierid = 103;
update courier set employeeid = 201 where courierid = 104;
update courier set employeeid = 202 where courierid = 105;
update courier set employeeid = 203 where courierid = 106;
update courier set employeeid = 201 where courierid = 107;
update courier set employeeid = 202 where courierid = 108;
update courier set employeeid = 203 where courierid = 109;
update courier set employeeid = 201 where courierid = 110;

select employeeid, count(courierid) as total_couriers
from courier
group by employeeid;

--15. Calculate the total revenue generated by each location  
select locationid, sum(amount) as total_revenue
from payment
group by locationid;

--16. Find the total number of couriers delivered to each location.  
select locationid, count(courierid) as delivered_count
from payment
group by locationid;

--17. Find the courier with the highest average delivery time:  
select top 1 courierid, avg(datediff(day, dispatchdate, deliverydate)) as avg_time
from courier
group by courierid
order by avg_time desc;

--18. Find Locations with Total Payments Less Than a Certain Amount  
select locationid, sum(amount) as total
from payment
group by locationid
having sum(amount) < 5000;

--19. Calculate Total Payments per Location  
select locationid, sum(amount) as total_payment
from payment
group by locationid;

--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):  
select courierid, sum(amount) as total_payment
from payment
where locationid = 5
group by courierid
having sum(amount) > 1000;


--21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'):
select courierid, sum(amount) as total_payment
from payment
where paymentdate > '2025-01-01'
group by courierid
having sum(amount) > 1000;

--22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD')  
select locationid, sum(amount) as total_payment
from payment
where paymentdate < '2025-01-01'
group by locationid
having sum(amount) > 5000;

--Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join  

--23. Retrieve Payments with Courier Information  
select * from payment
inner join courier on payment.courierid = courier.courierid;

--24. Retrieve Payments with Location Information  
select * from payment
inner join location on payment.locationid = location.locationid;

--25. Retrieve Payments with Courier and Location Information  
select * from payment
inner join courier on payment.courierid = courier.courierid
inner join location on payment.locationid = location.locationid;

--26. List all payments with courier details  
select * from payment
left join courier on payment.courierid = courier.courierid;

--27. Total payments received for each courier  
select courierid, sum(amount) as total_payment
from payment
group by courierid;

--28. List payments made on a specific date  
select * from payment
where paymentdate = '2025-04-14';

--29. Get Courier Information for Each Payment  
select p.paymentid, c.*
from payment p
join courier c on p.courierid = c.courierid;

--30. Get Payment Details with Location  
select p.*, l.locationname
from payment p
join location l on p.locationid = l.locationid;

--31. Calculating Total Payments for Each Courier 
select courierid, sum(amount) as total_amount
from payment
group by courierid;

--32. List Payments Within a Date Range  
select * from payment
where paymentdate between '2025-04-01' and '2025-04-14';

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side 
select u.*, c.*
from [user] u
full outer join courier c on u.userid = c.userid;

--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side 
select c.*, s.*
from courier c
full outer join courierservices s on c.courierid = s.serviceid;

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side  
select e.*, p.*
from employee e
full outer join payment p on e.employeeid = p.courierid;

--36. List all users and all courier services, showing all possible combinations.  
select * from [user]
cross join courierservices;

--37. List all employees and all locations, showing all possible combinations:  
select * from employee
cross join location;

--38. Retrieve a list of couriers and their corresponding sender information (if available)  
select courierid, sendername, senderaddress
from courier;

--39. Retrieve a list of couriers and their corresponding receiver information (if available): 
select courierid, receivername, receiveraddress
from courier;

--40. Retrieve a list of couriers along with the courier service details (if available):
select c.*, s.*
from courier c
left join courierservices s on c.courierid = s.serviceid;

--41. Retrieve a list of employees and the number of couriers assigned to each employee: 
select employeeid, count(courierid) as total_assigned
from courier
group by employeeid;

--42. Retrieve a list of locations and the total payment amount received at each location:
select locationid, sum(amount) as total_received
from payment
group by locationid;

--43. Retrieve all couriers sent by the same sender (based on SenderName).  
select * from courier
where sendername in (
  select sendername from courier
  group by sendername
  having count(*) > 1
);

--44. List all employees who share the same role.  
select * from employee
where role in (
  select role from employee
  group by role
  having count(*) > 1
);

--45. Retrieve all payments made for couriers sent from the same location.  
select p.*
from payment p
join courier c on p.courierid = c.courierid
where cast(c.senderaddress as varchar(max)) in (
  select cast(senderaddress as varchar(max))
  from courier
  group by senderaddress
  having count(*) > 1
);




--46. Retrieve all couriers sent from the same location (based on SenderAddress).  
select * from courier
where senderaddress in (
  select senderaddress from courier
  group by senderaddress
  having count(*) > 1
);

--47. List employees and the number of couriers they have delivered:  
select employeeid, count(courierid) as delivered_count
from courier
where status = 'delivered'
group by employeeid;

--48. Find couriers that were paid an amount greater than the cost of their respective courier services  
select c.courierid, p.amount, s.cost
from courier c
join payment p on c.courierid = p.courierid
join courierservices s on c.courierid = s.serviceid
where p.amount > s.cost;

--Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All  
--49. Find couriers that have a weight greater than the average weight of all couriers  
select * from courier
where weight > (select avg(weight) from courier);

--50. Find the names of all employees who have a salary greater than the average salary:  
select * from employee
where salary > (select avg(salary) from employee);

--51. Find the total cost of all courier services where the cost is less than the maximum cost  
select sum(cost) as total_cost
from courierservices
where cost < (select max(cost) from courierservices);

--52. Find all couriers that have been paid for  
select * from courier
where courierid in (select courierid from payment);

--53. Find the locations where the maximum payment amount was made  
select * from payment
where amount = (select max(amount) from payment);

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):
select * from courier
where weight > all (
  select weight from courier
  where sendername = 'ram'
);


