-- 1. get name, city, gpa of student with gpa greater than or equal to 3.7
Select StdFirstName, StdLastName, StdCity, StdGPA
	from Student
	where StdGPA >= 3.7

-- 2. Get the name, city, and GPA of students with a GPA between 2.0 and 3.0 
--(i.e., greater than or equal to 2.0 but less than equal to 3.0).
Select StdFirstName, StdLastName, StdCity, StdGPA
	from Student
	where StdGPA>=2.0 and StdGPA <= 3.0

--3.	Get the course description and credit hours of course IS460.
Select CrsDesc, CrsUnits 
	from Course
	where CourseNo = 'IS460'

--4.	List all columns and rows of the Faculty table.
Select * from Faculty

--5.	List the name, city, and 10% increased salary of faculty hired after 2008
Select FacFirstName, FacLastName, FacCity, (FacSalary*1.1) AS Salary
	from Faculty
	where FacHireDate > '2008-12-31'

--6.	List the name, city, and hire date of faculty hired in the last 12 years.
Select FacFirstName, FacLastName, FacCity, FacHireDate
	from Faculty
	where datepart(year,FacHireDate) >= datepart(year, getdate()) - 12

--7.	List the senior level upper division IS courses. (The senior level upper division IS 
--course numbers start with ‘IS4’, e.g. ‘IS460’ and ‘IS470’.)
Select * from Course
where CourseNo like 'IS4%'

--8.	List the offering number and course number of Summer 2020 offerings without an assigned instructor
select OfferNo, CourseNo 
	from Offering
	where OffTerm = 'SUMMER' and OffYear = 2020 and FacNo is NULL

	--select * from Offering

--9.	List name and faculty number of Management Science (MS) or Finance (FIN) full professor. 
--(Note, full professors’ FacRank is recorded as PROF.)
 select FacFirstName, FacLastName from Faculty
 where FacDept = 'MS' or FacDept = 'FIN' and FacRank='PROF'

--10.	List the offering number, course number, faculty number, term, and year for course offerings scheduled in 
--FALL 2019 or WINTER 2020
select OfferNo, CourseNo, FacNo, OffTerm, OffYear
	from Offering
	where (OffTerm = 'FALL' and OffYear = 2019) or (OffTerm ='WINTER' and OffYear = 2020)

--11.	List the city and state of faculty members
 select FacCity, FacState
 from Faculty

--12.	List the unique city and state combinations in the Faculty table
 select DISTINCT FacCity, FacState
 from Faculty

--13.	List the GPA, name, city and state of juniors. Order the result by GPA in ascending order
select StdGPA, StdFirstName, StdLastName, StdCity, StdState
from student
where StdClass = 'JR'
order by StdGPA

--14.	List the rank, salary, name, and department of faculty. Order the result by ascending (alphabetic) 
--rank and descending salary
select FacFirstName, FacLastName, FacSalary, FacRank, FacDept
from Faculty
order by FacRank, FacSalary desc

