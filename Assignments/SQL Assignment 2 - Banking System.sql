use HMBank;

----Task 1:Database design----
create table customers (
customer_id int primary key,
first_name varchar(50),
last_name varchar(50),
dob date,
email varchar(100),
phone_number varchar(15));

alter table customers
add address varchar(255);

create table accounts (
account_id int primary key,
customer_id int,
account_type varchar(50),
balance decimal(10,2),
foreign key (customer_id) references customers(customer_id));

create table transactions (
transaction_id int primary key,
account_id int,
transaction_type varchar(50),
amount decimal(10,2),
transaction_date date,
foreign key (account_id) references accounts(account_id));

-----------------------------------------------------------------------------

----Task 2:Select, Where, Between, AND, LIKE---------

--1.Insert 10 sample records--

insert into customers values
(1, 'Likita', 'Subramaniam', '1995-03-12', 'liki@gmail.com', '9876543210', 'Chennai'),
(2, 'Divya', 'Raj', '1998-06-24', 'divya@gmail.com', '9876543211', 'Madurai'),
(3, 'Vikram', 'Singh', '1992-11-05', 'vikram@gmail.com', '9876543212', 'Coimbatore'),
(4, 'Meena', 'Devi', '1997-02-18', 'meena@gmail.com', '9876543213', 'Salem'),
(5, 'Karthik', 'Ram', '1994-09-30', 'karthik@gmail.com', '9876543214', 'Trichy'),
(6, 'Latha', 'Balamurugan', '1996-07-15', 'latha@gmail.com', '9876543215', 'Vellore'),
(7, 'Ravi', 'Shankar', '1993-05-22', 'ravi@gmail.com', '9876543216', 'Theni'),
(8, 'Anitha', 'Krishnan', '1990-10-10', 'anitha@gmail.com', '9876543217', 'Erode'),
(9, 'Suresh', 'Shivan', '1991-12-01', 'suresh@gmail.com', '9876543218', 'Karur'),
(10, 'Geetha', 'Nataraj', '1999-08-08', 'geetha@gmail.com', '9876543219', 'Thanjavur');

insert into accounts values
(101, 1, 'savings', 50000.00),
(102, 2, 'current', 150000.00),
(103, 3, 'savings', 30000.00),
(104, 4, 'zero_balance', 0.00),
(105, 5, 'current', 250000.00),
(106, 6, 'savings', 12000.00),
(107, 7, 'savings', 70000.00),
(108, 8, 'zero_balance', 0.00),
(109, 9, 'current', 98000.00),
(110, 10, 'savings', 40000.00);

insert into transactions values
(1001, 101, 'deposit', 10000.00, '2024-01-10'),
(1002, 102, 'withdrawal', 5000.00, '2024-01-15'),
(1003, 103, 'deposit', 8000.00, '2024-02-01'),
(1004, 104, 'deposit', 2000.00, '2024-02-10'),
(1005, 105, 'withdrawal', 10000.00, '2024-02-15'),
(1006, 106, 'transfer', 4000.00, '2024-03-05'),
(1007, 107, 'deposit', 15000.00, '2024-03-10'),
(1008, 108, 'deposit', 3000.00, '2024-03-12'),
(1009, 109, 'withdrawal', 8000.00, '2024-03-15'),
(1010, 110, 'deposit', 5000.00, '2024-03-18');

---2.Write SQL queries for the following tasks:---

--1.SQL query to retrieve the name, account type and email of all customers--

select c.first_name,c.last_name,a.account_type,c.email
from customers c join accounts a on c.customer_id=a.customer_id;

--2.SQL query to list all transaction corresponding customer--

select c.first_name,c.last_name,t.amount
from customers c join accounts a on c.customer_id=a.customer_id
join transactions t on a.account_id=t.account_id;

--3.SQL query to increase the balance of a specific account by a certain amount--

select c.first_name+' '+c.last_name as Full_name,a.account_id,a.balance
from customers c join accounts a on c.customer_id=a.customer_id
where a.account_id=101
update accounts 
set balance = balance + 1000
where account_id = 101;

--4.SQL query to Combine first and last names of customers as a full_name--
select c.first_name+' '+c.last_name as Full_name
from customers c;

--5.SQL query to remove accounts with a balance of zero where the account type is savings--
delete from accounts
where balance = 0
and account_type = 'savings';
select * from accounts;

--6. SQL query to Find customers living in a specific city--

select c.first_name,c.last_name,c.address from 
customers c where c.address='chennai';

--7.SQL query to Get the account balance for a specific account--

select c.first_name,c.last_name,a.balance from 
customers c join accounts a on c.customer_id=a.customer_id
where a.balance=98000;

--8.SQL query to List all current accounts with a balance greater than $1,000--

select c.first_name,a.account_id,a.balance
from customers c join accounts a on c.customer_id=a.customer_id
where a.balance > 1000;

--9.SQL query to Retrieve all transactions for a specific account--

select c.customer_id,a.account_id,t.amount
from customers c join accounts a on c.customer_id=a.customer_id
join transactions t on a.account_id=t.account_id
where a.account_id = 105;

-- 10.SQL query to Calculate the interest accrued on savings accounts based on a given interest rate--

select account_id,balance,balance * 0.04 as interest_accrued
from accounts
where account_type = 'savings';

--11. SQL query to Identify accounts where the balance is less than a specified overdraft limit--
---say overdraft limit is 1000---
select account_id,customer_id,account_type,balance
from accounts
where balance < 1000;

--12. Write a SQL query to Find customers not living in a specific city-- 

select c.first_name,c.last_name,c.address from 
customers c where not c.address='chennai';

------Task 3: Aggregate functions, Having, Order By, GroupBy and Joins---

--1. Write a SQL query to Find the average account balance for all customers.-- 

select c.first_name,c.last_name,avg(a.balance) as Average_balance
from  customers c join accounts a on c.customer_id=a.customer_id
group by c.first_name,c.last_name
order by c.first_name;

--2. Write a SQL query to Retrieve the top 10 highest account balances.--

select top 10 c.customer_id,a.account_id,a.balance
from  customers c join accounts a on c.customer_id=a.customer_id
order by a.balance desc;

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.--

select a.account_id,t.transaction_date,sum(t.amount) as Total_Deposit
from accounts a join transactions t on a.account_id=t.account_id
where t.transaction_date='2024-03-05'
group by a.account_id,a.account_id;

--4. Write a SQL query to Find the Oldest and Newest Customers. --

select top 1 * from customers as Oldest
order by dob asc;
select top 1 * from customers as Newest
order by dob desc;

--5. Write a SQL query to Retrieve transaction details along with the account type.--

select a.account_id,a.account_type,t.transaction_id,t.transaction_type,t.amount,t.transaction_date 
from accounts a join transactions t on a.account_id=t.account_id;

--6. Write a SQL query to Get a list of customers along with their account details. --

select c.first_name,c.last_name,a.account_id,a.account_type,a.balance
from  customers c join accounts a on c.customer_id=a.customer_id;

--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.-- 

select c.first_name,c.last_name,a.account_id,t.transaction_type,t.amount,t.transaction_date
from  customers c join accounts a on c.customer_id=a.customer_id
join transactions t on a.account_id=t.account_id
where a.account_id=104;

--8. Write a SQL query to Identify customers who have more than one account. --

select c.first_name, c.last_name, count(a.account_id) as total_accounts
from customers c
join accounts a on c.customer_id = a.customer_id
group by c.customer_id, c.first_name, c.last_name
having count(a.account_id) > 1;

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.-- 

select 
  sum(case when transaction_type = 'deposit' then amount else 0 end) as total_deposits,
  sum(case when transaction_type = 'withdrawal' then amount else 0 end) as total_withdrawals,
  sum(case when transaction_type = 'deposit' then amount else 0 end) -
  sum(case when transaction_type = 'withdrawal' then amount else 0 end) as difference
from transactions;

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period. --

select a.account_id,a.balance / datediff(day, '2024-01-01', '2024-03-31') as avg_daily_balance
from accounts a;

--11. Calculate the total balance for each account type. --

select a.account_type, sum(a.balance) as total_balance
from accounts a
group by a.account_type;

--12. Identify accounts with the highest number of transactions order by descending order. --

select a.account_id,count(t.transaction_id) as transaction_count
from accounts a join transactions t on a.account_id = t.account_id
group by a.account_id
order by transaction_count desc;

--13. List customers with high aggregate account balances, along with their account types. --

select c.first_name,c.last_name,a.account_type,a.balance as account_balance
from customers c join accounts a on c.customer_id = a.customer_id
order by a.balance desc; 

--14. Identify and list duplicate transactions based on transaction amount, date, and account. --

select account_id, transaction_date, amount, count(*) as duplicate_count
from transactions
group by account_id, transaction_date, amount
having count(*) > 1;

----------Task 4:Subquery and its type--------------
--1. Retrieve the customer(s) with the highest account balance.--

--without subquery--
select top 1 c.first_name, c.last_name,a.balance
from customers c join accounts a on c.customer_id = a.customer_id
order by a.balance desc;
--with subquery--
select c.first_name, c.last_name, a.balance
from customers c join accounts a on c.customer_id = a.customer_id
where a.balance = (
    select max(balance) 
    from accounts);

--2. Calculate the average account balance for customers who have more than one account. --

select c.customer_id, avg(a.balance) as avg_balance
from customers c join accounts a on c.customer_id = a.customer_id
where c.customer_id in (
select customer_id 
from accounts 
group by customer_id 
having count(account_id) > 1)
group by c.customer_id;

 --3. Retrieve accounts with transactions whose amounts exceed the average transaction amount. --

 select * from transactions
where amount > (select avg(amount) from transactions);

--4. Identify customers who have no recorded transactions. --

select * from customers
where customer_id not in (
select distinct customer_id
from accounts
where account_id in (
select distinct account_id
from transactions)
);

--5. Calculate the total balance of accounts with no recorded transactions. --

select sum(balance) as total_balance_without_transactions
from accounts
where account_id not in (
select distinct account_id from transactions
);

--6. Retrieve transactions for accounts with the lowest balance. -
select *from transactions
where account_id in (
select account_id
from accounts
where balance = (select min(balance) from accounts));

--7. Identify customers who have accounts of multiple types. --

select customer_id
from accounts
group by customer_id
having count(distinct account_type) > 1;

--8. Calculate the percentage of each account type out of the total number of accounts. --

select account_type,count(*) as type_count,
round((count(*) * 100.0) / total.total_count, 2) as percentage
from accounts,
    (select count(*) as total_count from accounts) 
	as total
group by account_type, total.total_count;

--9. Retrieve all transactions for a customer with a given customer_id. --

select c.first_name,c.last_name,a.account_id,t.transaction_type,t.amount,t.transaction_date
from  customers c join accounts a on c.customer_id=a.customer_id
join transactions t on a.account_id=t.account_id
where c.customer_id=(
select customer_id from customers 
where customer_id = 8);

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause. --

select account_type,sum(balance) as total_balance,
(select sum(balance) from accounts) as overall_total_balance
from accounts
group by account_type;











