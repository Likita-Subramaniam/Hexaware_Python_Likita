--1.Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”.

create database CareerHub;
use CareerHub;

--2.Create tables for Companies, Jobs, Applicants and Applications.

--Companies table
create table Companies(
CompanyID int primary key not null,
CompanyName varchar(50),
Location varchar(50));

insert into Companies values
(1, 'Hexaware', 'Chennai'),
(2, 'Cognizant', 'Mumbai'),
(3, 'TechMahindra', 'Bangalore'),
(4, 'TCS', 'Hyderabad'),
(5, 'Wipro', 'Chennai'),
(6, 'Accenture', 'Delhi'),
(7, 'Amazon', 'Pune'),
(8, 'Google', 'Kolkata'),
(9, 'Microsoft', 'Bangalore'),
(10, 'Zoho', 'Chennai');


--Jobs table
create table Jobs(
JobID int primary key not null,
CompanyID int, 
JobTitle varchar(50),
JobDescription text,
JobLocation varchar(50),
Salary decimal(10, 2),
JobType varchar(50),
PostedDate datetime,
foreign key (CompanyID) references Companies(CompanyID));

insert into Jobs values
(101, 1, 'Software Developer', 'Develop web apps', 'Chennai', 65000, 'Full-time', '2024-10-01'),
(102, 2, 'Data Analyst', 'Analyze datasets', 'Mumbai', 55000, 'Full-time', '2024-10-05'),
(103, 3, 'QA Engineer', 'Test web apps', 'Bangalore', 60000, 'Contract', '2024-10-07'),
(104, 4, 'Backend Developer', 'Create REST APIs', 'Hyderabad', 70000, 'Full-time', '2024-10-10'),
(105, 5, 'Frontend Developer', 'Design UI', 'Chennai', 72000, 'Full-time', '2024-10-12'),
(106, 6, 'HR Manager', 'Recruitment ops', 'Delhi', 50000, 'Full-time', '2024-10-15'),
(107, 7, 'Support Engineer', 'Customer support', 'Pune', 45000, 'Part-time', '2024-10-17'),
(108, 8, 'Cloud Engineer', 'Manage cloud infra', 'Kolkata', 80000, 'Full-time', '2024-10-19'),
(109, 9, 'Mobile App Dev', 'Develop Android apps', 'Bangalore', 75000, 'Contract', '2024-10-20'),
(110, 10, 'DevOps Engineer', 'CI/CD automation', 'Chennai', 85000, 'Full-time', '2024-10-21');


--Applicants table
create table Applicants(
ApplicantID int primary key not null,
FirstName varchar(30),
LastName varchar(30),
Email varchar(30),
Phone varchar(15),
Resume text);

insert into Applicants values
(201, 'Likita', 'Subu', 'liki@gmail.com', '9876543210', 'Resume A'),
(202, 'Swetha', 'Raju', 'swetha@gmail.com', '9876543211', 'Resume B'),
(203, 'Sneha', 'Murugan', 'sneha@gmail.com', '9876543212', 'Resume C'),
(204, 'Amaya', 'Rajesh', 'amaya@gmail.com', '9876543213', 'Resume D'),
(205, 'Divya', 'Singh', 'divya@gmail.com', '9876543214', 'Resume  E'),
(206, 'Arjun', 'Reddy', 'arjun@gmail.com', '9876543215', 'Resume  F'),
(207, 'Meera', 'Somu', 'meera@gmail.com', '9876543216', 'Resume G'),
(208, 'Adhithi', 'Ramu', 'adhithi@gmail.com', '9876543217', 'Resume H'),
(209, 'Riya', 'Salesia', 'riya@gmail.com', '9876543218', 'Resume I'),
(210, 'Alia', 'Bhat', 'aditya@gmail.com', '9876543219', 'Resume  J');


--Applications table
create table Applications(
ApplicationID int primary key not null,
JobID int, 
ApplicantID int ,
ApplicationDate datetime,
CoverLetter text,
foreign key (JobID) references Jobs(JobID),
foreign key (ApplicantID) references Applicants(ApplicantID));

insert into Applications values
(301, 101, 201, '2024-05-01', 'Cover letter A'),
(302, 102, 202, '2024-05-06', 'Cover letter B'),
(303, 103, 203, '2024-05-13', 'Cover letter C'),
(304, 104, 204, '2024-05-15', 'Cover letter D'),
(305, 105, 205, '2024-05-05', 'Cover letter E'),
(306, 106, 206, '2024-05-24', 'Cover letter F'),
(307, 107, 207, '2024-05-30', 'Cover letter G'),
(308, 108, 208, '2024-05-08', 'Cover letter H'),
(309, 109, 209, '2024-05-09', 'Cover letter I'),
(310, 110, 210, '2024-05-11', 'Cover letter J');


--5.Write an SQL query to count the number of applications received for each job listing in the"Jobs" table. 

select j.JobTitle,count(ApplicationID)as Total_application
from Jobs j join Applications a on j.JobID=a.JobID
group by JobTitle;

--6.Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range. 

select j.JobTitle, c.CompanyName, c.Location, j.Salary  
from Companies c  join Jobs j on c.CompanyID = j.CompanyID  
where j.Salary BETWEEN 
(select min(Salary) from Jobs) and
(SELECT max(Salary) from Jobs)
order by salary desc;

--7.SQL query that retrieves the job application history for a specific applicant.

select j.JobTitle, c.CompanyName, a.ApplicationDate
from Applications a JOIN Jobs j on a.JobID = j.JobID
join Companies c on j.CompanyID = c.CompanyID
where a.ApplicantID=205;

--8.Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table.

select avg(Salary) as Average_Salary 
from Jobs 
where Salary > 0;

--9.Write an SQL query to identify the company that has posted the most job listings.

select top 1 c.Companyname, count(j.JobID) as Highest_Job_Count
from Companies c
join Jobs j on c.CompanyID = j.CompanyID
group by c.CompanyName
order by Highest_Job_Count desc;

--10.Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience

alter table applicants
add experience int;
update applicants set experience = 2 where applicantid = 201;
update applicants set experience = 4 where applicantid = 202;
update applicants set experience = 1 where applicantid = 203;
update applicants set experience = 3 where applicantid = 204;
update applicants set experience = 5 where applicantid = 205;
update applicants set experience = 2 where applicantid = 206;
update applicants set experience = 6 where applicantid = 207;
update applicants set experience = 1 where applicantid = 208;
update applicants set experience = 3 where applicantid = 209;
update applicants set experience = 7 where applicantid = 210;

select a.FirstName,a.LastName,a.ApplicantID
from Applicants a
join Applications ap ON a.ApplicantID = ap.ApplicantID
join Jobs j on ap.JobID = j.JobID
join Companies c ON j.CompanyID = c.CompanyID
where c.Location='Chennai'and a.experience >=3;

--11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.

select distinct j.JobTitle from Jobs j
where j.Salary 
between 60000 and 80000;
 
--12. Find the jobs that have not received any applications.

select j.JobTitle,a.ApplicationID 
from Jobs J Join Applications a on j.JobID=a.ApplicationID
where a.ApplicationID is null;

--13. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.

select ap.FirstName, ap.LastName, c.CompanyName, j.JobTitle
from Applicants ap
join Applications a on ap.ApplicantID = a.ApplicantID
join Jobs j on a.JobID = j.JobID
join Companies c on j.CompanyID = c.CompanyID;

--14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.

select c.CompanyName,count(j.JobID)as Job_count
from Companies c left join Jobs j on c.CompanyID=j.CompanyID
group by c.CompanyName;

--15. List all applicants along with the companies and positions they have applied for, including those who have not applied.
select ap.FirstName, ap.LastName, c.CompanyName, j.JobTitle
from Applicants ap
left join Applications a on ap.ApplicantID = a.ApplicantID
left join Jobs j on a.JobID = j.JobID
left join Companies c on j.CompanyID = c.CompanyID;

--16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.

select c.CompanyName, j.JobTitle, j.Salary
from Jobs j join Companies c on j.CompanyID = c.CompanyID
where j.Salary > (select avg(Salary) from Jobs where Salary > 0);

--17. Display a list of applicants with their names and a concatenated string of their city and state.

alter table Applicants
add city varchar(100), state varchar(100);
update Applicants set city = 'Chennai', state = 'Tamil Nadu' where ApplicantID = 201;
update Applicants set city = 'Mumbai', state = 'Maharashtra' where ApplicantID = 202;
update Applicants set city = 'Bangalore', state = 'Karnataka' where ApplicantID = 203;
update Applicants set city = 'Delhi', state = 'Delhi' where ApplicantID = 204;
update Applicants set city = 'Kolkata', state = 'West Bengal' where ApplicantID = 205;
update Applicants set city = 'Chennai', state = 'Tamil Nadu' where ApplicantID = 206;
update Applicants set city = 'Hyderabad', state = 'Telangana' where ApplicantID = 207;
update Applicants set city = 'Pune', state = 'Maharashtra' where ApplicantID = 208;
update Applicants set city = 'Chennai', state = 'Tamil Nadu' where ApplicantID= 209;
update Applicants set city = 'Bangalore', state = 'Karnataka' where ApplicantID = 210;

select a.FirstName,a.LastName ,a.city+' '+a.state as Place
from Applicants a;

--18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

select JobTitle from Jobs 
where JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

--19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.

select a.firstname + ' ' + a.lastname as FullName, j.JobTitle
from Applicants a left join Applications app on a.Applicantid = app.Applicantid
right join Jobs j on app.Jobid = j.Jobid;

--20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience.

select a.FirstName, a.LastName, c.CompanyName
from Applicants a cross join Companies c
where c.Location = 'Chennai' and A.experience > 2;
