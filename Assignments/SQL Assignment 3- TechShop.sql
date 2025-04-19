--Task:1. Database Design:  
--1. Create the database named "TechShop" 

create database Techshop;
use Techshop;

--2. Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables based on the provided schema. 
create table customers (
    customerid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    email varchar(100),
    phone varchar(15),
    address varchar(255)
);

create table products (
    productid int primary key,
    productname varchar(100),
    description varchar(255),
    price decimal(10,2)
);

create table orders (
    orderid int primary key,
    customerid int,
    orderdate date,
    totalamount decimal(10,2),
    foreign key (customerid) references customers(customerid)
);

create table orderdetails (
    orderdetailid int primary key,
    orderid int,
    productid int,
    quantity int,
    foreign key (orderid) references orders(orderid),
    foreign key (productid) references products(productid)
);

create table inventory (
    inventoryid int primary key,
    productid int,
    quantityinstock int,
    laststockupdate date,
    foreign key (productid) references products(productid)
);

--3. Create an ERD (Entity Relationship Diagram) for the database. 
--4. Create appropriate Primary Key and Foreign Key constraints for referential integrity. (already referenced)

create table customers (
    customerid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    email varchar(100),
    phone varchar(15),
    address varchar(255)
);

create table products (
    productid int primary key,
    productname varchar(100),
    description varchar(255),
    price decimal(10,2)
);

create table orders (
    orderid int primary key,
    customerid int,
    orderdate date,
    totalamount decimal(10,2),
    foreign key (customerid) references customers(customerid)
);

create table orderdetails (
    orderdetailid int primary key,
    orderid int,
    productid int,
    quantity int,
    foreign key (orderid) references orders(orderid),
    foreign key (productid) references products(productid)
);

create table inventory (
    inventoryid int primary key,
    productid int,
    quantityinstock int,
    laststockupdate date,
    foreign key (productid) references products(productid)
);


--5. Insert at least 10 sample records into each of the following tables.

insert into customers values
(1, 'Anish', 'Kumar', 'anish@gmail.com', '9876543210', 'Chennai'),
(2, 'Ravi', 'Shankar', 'ravi@gmail.com', '9888877776', 'Coimbatore'),
(3, 'Lakshmi', 'Priya', 'lakshmi@gmail.com', '9854321678', 'Madurai'),
(4, 'Rahul', 'Singh', 'rahul@gmail.com', '9753186420', 'Bangalore'),
(5, 'Divya', 'Raj', 'divya@gmail.com', '9543217865', 'Hyderabad'),
(6, 'Karthik', 'Vishal', 'karthik@gmail.com', '9445566778', 'Trichy'),
(7, 'Meena', 'krishnan', 'meena@gmail.com', '9123456780', 'Vellore'),
(8, 'Arun', 'Selvan', 'arun@gmail.com', '9567341280', 'Salem'),
(9, 'Nisha', 'Basha', 'nisha@gmail.com', '9234567801', 'Madurai'),
(10, 'Vinoth', 'Devan', 'vinoth@gmail.com', '9012345678', 'Chennai');

insert into products values
(1, 'bluetooth speaker', 'audio', 1200.00),
(2, 'smartphone', 'mobile', 15000.00),
(3, 'laptop', 'computing', 45000.00),
(4, 'smartwatch', 'wearable', 3500.00),
(5, 'tablet', 'mobile', 20000.00),
(6, 'earbuds', 'audio', 1800.00),
(7, 'monitor', 'display', 7000.00),
(8, 'keyboard', 'accessory', 900.00),
(9, 'power bank', 'charging', 1500.00),
(10, 'mouse', 'accessory', 500.00);

insert into orders values
(1, 1, '2025-04-01', 1200.00),
(2, 2, '2025-04-02', 18000.00),
(3, 3, '2025-04-02', 4500.00),
(4, 4, '2025-04-03', 25000.00),
(5, 5, '2025-04-04', 1800.00),
(6, 6, '2025-04-04', 5000.00),
(7, 7, '2025-04-05', 1500.00),
(8, 8, '2025-04-06', 7500.00),
(9, 9, '2025-04-06', 500.00),
(10, 10, '2025-04-07', 3500.00);

insert into orderdetails values
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 4, 1),
(4, 4, 3, 1),
(5, 5, 6, 1),
(6, 6, 5, 1),
(7, 7, 9, 1),
(8, 8, 7, 1),
(9, 9, 10, 1),
(10, 10, 4, 1);

insert into inventory values
(1, 1, 20, '2025-03-31'),
(2, 2, 15, '2025-03-31'),
(3, 3, 10, '2025-03-31'),
(4, 4, 25, '2025-03-31'),
(5, 5, 12, '2025-03-31'),
(6, 6, 30, '2025-03-31'),
(7, 7, 18, '2025-03-31'),
(8, 8, 40, '2025-03-31'),
(9, 9, 22, '2025-03-31'),
(10, 10, 35, '2025-03-31');

--Tasks 2: Select, Where, Between, AND, LIKE:  

--1.SQL query to retrieve the names and emails of all customers.  

select firstname, lastname, email from customers;

--2.SQL query to list all orders with their order dates and corresponding customer names. 

select o.orderid, o.orderdate, c.firstname, c.lastname
from orders o
join customers c on o.customerid = c.customerid;

--3.SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address. 
insert into customers (customerid, firstname, lastname, email, phone, address)
values (11, 'Asha', 'Shetty', 'asha@gmail.com', '9888877776', 'Coimbatore');

--4.SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%. 

update products set price = price * 1.10;

--5.SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables.

declare @order_id int = 5;
delete from orderdetails where orderid = @order_id;
delete from orders where orderid = @order_id;

--6.SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.

insert into orders (orderid, customerid, orderdate, totalamount)
values (11, 1, '2025-04-02', 3000.00);

--7.SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. 

update customers set email = 'anishkumar@gmail.com', address = 'Trichy'
where customerid = 1;

--8.SQL query to recalculate and update the total cost of each order in the "Orders" 

update orders
set totalamount = (
  select sum(od.quantity * p.price)
  from orderdetails od
  join products p on od.productid = p.productid
  where od.orderid = orders.orderid
);
 
--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables.

declare @cust_id int = 3;

delete from orderdetails
where orderid in (select orderid from orders where customerid = @cust_id);

delete from orders
where customerid = @cust_id;

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details. 

insert into products (productid, productname, description, price)
values (11, 'smart watch', 'health tracking smartwatch', 4500.00);

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped")

declare @orderid int = 6;
alter table orders add status varchar(20); 
update orders set status = 'shipped' where orderid = @orderid;

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table. 

alter table customers add ordercount int;
update customers set ordercount = (
  select count(*) from orders where customers.customerid = orders.customerid
);


--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:  

--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.

select o.orderid, o.orderdate, c.firstname, c.lastname, o.totalamount
from orders o
join customers c on o.customerid = c.customerid;

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. 

select p.productname, sum(od.quantity * p.price) as totalrevenue
from orderdetails od
join products p on od.productid = p.productid
group by p.productname;


--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.

select distinct c.firstname, c.lastname, c.email, c.phone
from customers c
join orders o on c.customerid = o.customerid;

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered. 

select top 1 p.productname, sum(od.quantity) as totalquantity
from orderdetails od
join products p on od.productid = p.productid
group by p.productname
order by totalquantity desc;

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories. 

select productname, description as category
from products;

--6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value. 
select c.firstname, c.lastname, avg(o.totalamount) as avgordervalue
from customers c
join orders o on c.customerid = o.customerid
group by c.firstname, c.lastname ;

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue. 

select top 1 o.orderid, c.firstname, c.lastname, o.totalamount
from orders o
join customers c on o.customerid = c.customerid
order by o.totalamount desc;

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered. 

select p.productname, count(od.orderdetailid) as timesordered
from orderdetails od
join products p on od.productid = p.productid
group by p.productname;

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter. 

declare @productname varchar(100) = 'smartwatch';

select distinct c.firstname, c.lastname
from customers c
join orders o on c.customerid = o.customerid
join orderdetails od on o.orderid = od.orderid
join products p on od.productid = p.productid
where p.productname = @productname;


--10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period.

declare @startdate date = '2025-04-01';
declare @enddate date = '2025-04-05';

select sum(totalamount) as total_revenue
from orders
where orderdate between @startdate and @enddate;


--Task 4. Subquery and its type:  

--1. Write an SQL query to find out which customers have not placed any orders. 

select * from customers
where customerid not in (select distinct customerid from orders);

--2. Write an SQL query to find the total number of products available for sale.  

select count(*) as totalproducts from products;

--3. Write an SQL query to calculate the total revenue generated by TechShop.  

select sum(totalamount) as totalrevenue from orders;

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. 

declare @category varchar(100) = 'audio';

select avg(od.quantity) as avgqty
from orderdetails od
join products p on od.productid = p.productid
where p.description = @category;


--5. Write an SQL query to calculate the total revenue generated by a specific customer. 

declare @cust_id int = 3;

select sum(totalamount) as customerrevenue
from orders
where customerid = @cust_id;

--6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed. 

select top 1 c.firstname, c.lastname, count(o.orderid) as ordercount
from customers c
join orders o on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname
order by ordercount desc;

--7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders. 

select top 1 p.description as category, sum(od.quantity) as totalqty
from orderdetails od
join products p on od.productid = p.productid
group by p.description
order by totalqty desc;

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending. 

select top 1 c.firstname, c.lastname, sum(o.totalamount) as totalspent
from customers c
join orders o on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname
order by totalspent desc;

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers. 

select avg(totalamount) as averageordervalue from orders;


--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count. 

select c.firstname, c.lastname, count(o.orderid) as totalorders
from customers c
join orders o on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname;















