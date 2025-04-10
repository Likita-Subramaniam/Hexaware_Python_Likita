///Task 1///

use SISDB;

///Students///
create table students(
student_id int primary key,
first_name varchar(30),
last_name varchar(30),
date_of_birth date,
email varchar(50),
phone_number int);

alter table students
alter column phone_number varchar(15);

///Teacher///
create table teacher(
teacher_id int primary key,
first_name varchar(30),
last_name varchar(30),
email varchar(30));

///courses///
create table courses (
course_id int primary key,
course_name varchar(30),
credits int,
teacher_id int,
foreign key (teacher_id) references teacher(teacher_id)
);

///Enrollments///
create table enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
enrollment_date date,
foreign key (student_id )references students(student_id),
foreign key (course_id) references courses(course_id));

///Payments///
create table payments(
payment_id int primary key,
student_id int,
amount int,
payment_date date,
foreign key (student_id) references students(student_id));

insert into students values
(1,'Likita','Subramaniam','2003-12-06','likislife@gmail.com','9874563210'),
(2,'Sandhya','Lingam','2003-11-03','sandy@gamil.com','9783214560'),
(3,'Asha','Sundar','2003-10-05','asha@gmail.com','9234567810'),
(4,'Bharath','Deshpande','2003-09-04','brat@gmail.com','9873456210'),
(5,'Vinod','Raman','2003-08-02','vinra@gmail.com','9687543210'),
(6,'Shraddha','Kapoor','2003-05-17','shrad@gamil.com','9654732108'),
(7,'Siddharth','Malhotra','2003-04-28','sidd@gamil.com','9567843210'),
(8,'Mani','Ganesh','2003-01-01','mani@gmail.com','9780364521'),
(9,'Kriti','Sanon','2003-03-16','kriti@gmail.com','9387654201'),
(10,'Alia','Bhat','2003-06-20','ab@gmail.com','9145632078');

insert into teacher values
(1, 'Arun', 'Kumar', 'arun@gmail.com.com'),
(2, 'Revathi', 'Sundar', 'rev@gmail.com'),
(3, 'Prakash', 'Velan', 'prakash@gmail.com'),
(4, 'Meenakshi', 'Ravi', 'meena@gmail.com'),
(5, 'Sathish', 'Raj', 'sathish@gmail.com'),
(6, 'Kavitha', 'Mohan', 'kavi@gmail.com'),
(7, 'Vignesh', 'Karthik', 'vignesh@gmail.com'),
(8, 'Anitha', 'Bala', 'ani@gmail.com'),
(9, 'Murugan', 'Selvam', 'muruga@gmail.com'),
(10, 'Divya', 'Arasu', 'divs@gmail.com');

insert into courses values
(101, 'DBMS', 4, 1),
(102, 'Java', 3, 2),
(103, 'Python', 3, 3),
(104, 'Web Development', 4, 4),
(105, 'Computer Networks', 3, 5),
(106, 'Data Structures', 4, 6),
(107, 'Operating Systems', 4, 7),
(108, 'Artificial Intelligence', 3, 8),
(109, 'Cloud Computing', 3, 9),
(110, 'Machine Learning', 4, 10);

insert into enrollments values
(1, 1, 101, '2025-04-06'),
(2, 2, 102, '2025-04-10'),
(3, 3, 103, '2025-04-12'),
(4, 4, 104, '2025-04-16'),
(5, 5, 105, '2025-04-19'),
(6, 6, 106, '2025-04-20'),
(7, 7, 107, '2025-04-23'),
(8, 8, 108, '2025-04-25'),
(9, 9, 109, '2025-04-27'),
(10, 10, 110, '2025-04-30');

insert into payments values
(1, 1, 5000, '2025-03-12'),
(2, 2, 4800, '2025-04-05'),
(3, 3, 5200, '2025-02-28'),
(4, 4, 5000, '2025-04-10'),
(5, 5, 5300, '2025-01-15'),
(6, 6, 5100, '2025-03-03'),
(7, 7, 4700, '2025-04-02'),
(8, 8, 5500, '2025-02-20'),
(9, 9, 4900, '2025-03-25'),
(10, 10, 5000, '2025-01-30');

///Task 2-select,where,between,and,like///
/1-insert /
insert into students 
values(101,'John','Doe','1995-08-15','john.doe@example.com',1234567890);
select * from students;

/2-Choose an existing student and course and 
insert a record into the "Enrollments" table with the enrollment date. /

insert into enrollments values (11,1,103,'2025-04-08');
select * from enrollments;

/3-Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
modify their email address. /

update teacher
set email='kavimoha@gmail.com' 
where teacher_id=6;
select * from teacher;

/4-Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
an enrollment record based on the student and course. 

delete from enrollments where student_id=1 and course_id=101;
select * from enrollments;

/5-Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
teacher from the respective tables. /

update courses
set teacher_id=6
where course_id=103;
select * from courses;

/6-Delete a specific student from the "Students" table and remove all their enrollment records 
from the "Enrollments" table. Be sure to maintain referential integrity./

delete from students where student_id=7;
select * from students;
delete from enrollments where student_id=7;
delete from payments where student_id=7;

/7-. Update the payment amount for a specific payment record in the "Payments" table. Choose any 
payment record and modify the payment amount. /

update payments
set amount=4800
where student_id=8;
select * from payments;

///Task 3-Agg.fns,Having,Order by,group by,joins///

/1-calculate the total payments made by a specific student. /

select s.student_id,s.first_name,s.last_name,p.amount 
from payments p join students s on p.student_id=s.student_id;

/2- to retrieve a list of courses along with the count of students enrolled in each 
course./

select c.course_name,count(e.student_id) as Total_count
from courses c join enrollments e on c.course_id=e.course_id
group by c.course_name;

/3- find the names of students who have not enrolled in any course. /

select s.first_name,s.last_name
from students s left join enrollments e on s.student_id=e.student_id
where e.enrollment_id is null;

/4- to retrieve the first name, last name of students, and the names of the 
courses they are enrolled in./

select s.first_name,s.last_name,c.course_name as course_enrolled
from students s join enrollments e on s.student_id=e.student_id
join courses c on c.course_id=e.course_id;

/5-list the names of teachers and the courses they are assigned to./

select t.first_name,t.last_name,c.course_name
from teacher t join courses c on c.teacher_id=t.teacher_id;

/6- list of students and their enrollment dates for a specific course./

select s.first_name,s.last_name,c.course_name,e.enrollment_date
from students s join enrollments e on s.student_id=e.enrollment_id
join courses c on c.course_id=e.course_id;

/7-names of students who have not made any payments./

select s.first_name,s.last_name,p.amount
from students s left join payments p on s.student_id=p.student_id
where p.amount is null;

/8-query to identify courses that have no enrollments./

select c.course_id,c.course_name
from courses c left join enrollments e on c.course_id=e.course_id
where e.enrollment_id  is null;

/9-Identify students who are enrolled in more than one course./

select distinct s.student_id, s.first_name, s.last_name
from students s join enrollments e on s.student_id = e.student_id
group by s.student_id, s.first_name, s.last_name
having count(e.course_id) > 1;

/10-Find teachers who are not assigned to any courses./

select t.teacher_id,t.first_name,t.last_name,c.course_name
from teacher t left join courses c on t.teacher_id=c.teacher_id
where c.course_id is null;

///Task 4-Subquery///

/1-calculate the average number of students enrolled in each course./

select avg(sub.total_enrollment) as Average_enrollment_per_course
from(
select c.course_name,count(e.enrollment_id) as total_enrollment
from courses c join enrollments e on c.course_id=e.course_id
group by c.course_name)as sub;

/2-Identify the student(s) who made the highest payment/

select s.first_name, s.last_name,p.amount
from students s join payments p on s.student_id = p.student_id
where p.amount = (
select MAX(amount)
from payments );
select * from payments;

/3-Retrieve a list of courses with the highest number of enrollments/

select course_id, course_name from courses
where course_id in (
select course_id from enrollments
group by course_id
having count(*) = (
select max(enrollment_count)
from (
select course_id, count(*) as enrollment_count
from enrollments
group by course_id
) as sub
));

/4- Calculate the total payments made to courses taught by each teacher./

select t.teacher_id, t.first_name, t.last_name,
(
  select sum(p.amount)
  from payments p
  join students s on p.student_id = s.student_id
  join enrollments e on s.student_id = e.student_id
  join courses c on e.course_id = c.course_id
  where c.teacher_id = t.teacher_id
) as total_payment
from teacher t;

/5-. Identify students who are enrolled in all available courses. /

select s.student_id, s.first_name, s.last_name
from students s
join enrollments e on s.student_id = e.student_id
group by s.student_id, s.first_name, s.last_name
having count(distinct e.course_id) = (select count(*) from courses);

/6-Retrieve the names of teachers who have not been assigned to any courses. /(subquery not needed)

select t.teacher_id, t.first_name, t.last_name
from teacher t left join courses c on t.teacher_id = c.teacher_id
where c.course_id is null;
---using subquery---
select teacher_id, first_name, last_name
from teacher
where teacher_id not in (
select teacher_id from courses where teacher_id is not null
);


/7-Calculate the average age of all students. U/

select avg(age) as average_age
from (
select datediff(year, date_of_birth, getdate()) as age
from students
) as sub;

/8-Identify courses with no enrollments./(subquery not needed)

select c.course_name from courses c  left join enrollments e on c.course_id=e.course_id
where e.course_id is null;
--using subquery--
select course_name 
from courses 
where course_id not in (
    select distinct course_id 
    from enrollments
);

/9-the total payments made by each student for each course they are enrolled in. Use 
subqueries/

select s.first_name,s.last_name,c.course_name,
(select sum(p.amount)from payments p
where p.student_id = s.student_id) as total_payment
from students s join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id;

/10-Identify students who have made more than one payment./

select s.first_name, s.last_name, p.amount
from students s join payments p on s.student_id = p.student_id
where s.student_id in(
select student_id from payments
group by student_id
having count(*) > 1);

/11-Write an SQL query to calculate the total payments made by each student./

select  student_id, first_name, last_name,
( select sum(amount)
  from payments
   where payments.student_id = students.student_id
    ) as total_payment
from students;


/12-Retrieve a list of course names along with the count of students enrolled in each course./

select course_name,
( select count(*)
  from enrollments
  where enrollments.course_id = courses.course_id
) as total_students
from courses;


/13- the average payment amount made by students. /

select student_id, first_name, last_name,
(select avg(amount)
 from payments
 where payments.student_id = students.student_id
 ) as average_payment
from students;

























