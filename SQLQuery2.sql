3
.-- constraints 
-- These are set of rules which we use while adding a data in column

-- NOT NULL 
-- Helps us identifying the columns that cannot hold Null values
-- That column cannot be left empty




create table Employee
(
EmployeeId int, 
EmployeeFirstName varchar(50) ,
EmployeeLastName varchar(50) , 
Salary int,
Address varchar(100) -- address is keyword in sql

)
insert into Employee 
values(1,'')


create table notnulltest(
Id int not null ,
name varchar(100)
)
insert into notnulltest (Id,Name)
select 1,'Dinesh'
insert into notnulltest(ID,Name)
select null,'john'
insert into notnulltest
select 3,null
insert into notnulltest
select 4,'hero'

select * from notnulltest
-- drop table notnulltest

-- unique 
-- This helps us maintaining unique data in every column
-- there is also one null value that is allowed per unique column

create table uniquetest
(
Id int unique , --Not NULL
 Name varchar(100)
)

insert into uniquetest
select 1,'dinesh' 

insert into uniquetest
select 2,'ramesh'

insert into uniquetest
select null,'shaun'

insert into uniquetest
select 3,'ramesh'

insert into uniquetest
select 4,'ram'


select * from uniquetest

-- PRIMARY KEY 
   -- Uniquely identifying a row in a table
   -- Combination of unique and NOT NULL constraint
   -- it is used to uniquely identify any row or deatils of a particular user


   create table primarykeytest
   (
   Id int primary key , 
   Name varchar (100),
      )

insert into primarykeytest
select 1,'dinesh' 
insert into primarykeytest
select 2,'suresh' 
insert into primarykeytest
select 3,'sush' 

select * from primarykeytest

-- foreing key constraint
-- to link two tables we use forieng key constraint

create table foreingkeytest
(
Id int FOREIGN KEY REFERENCES primarykeytest(Id), -- tablename(columnname)
DOB date
)
insert into  foreingkeytest
select 1,'2011-01-01'
insert into  foreingkeytest
select 2,'2011-11-01'
insert into  foreingkeytest
select 3,'2011-11-11'

select * from foreingkeytest

-- check constarint

create table checktest(
Id int
, salary int check(salary>0)
)
insert into checktest
select 1,10000

insert into checktest
select 2,-521

select * from checktest

create table checktest2
(
name varchar(100),
vaccinationFlag varchar(5) check(vaccinationFlag IN ('yes','no') )
)

INSERT into checktest2
select 'dinesh','no'


INSERT into checktest2
select 'rinesh','yes'

select * from checktest2

-- 01-01-2025
-- Default constraint
-- Helps us in inserting the default to a column when there is no value entered

create table defaulttest
(
Id int,
Name varchar(100) default('NONAMEPROVIDED')
)
insert into defaulttest
select 1,'any'
insert into defaulttest
select 2,'many'
insert into defaulttest(Id)
select 3


SELECT * FROM defaulttest

-- Identity constraint 
-- Helps us in generating identity values for each row of the table
-- Normally, you cannot insert data into a identity column manually

create table Identitytest
(
Id int identity(1,5),--(seed,increment)
Name varchar(100)
)
insert into Identitytest(Name)
select 'Dinesh' Union
select 'John'

   
insert into Identitytest(Name)
select 'Dina' Union
select 'caleb'

select * from Identitytest




-- Where clause is used to filter the search or select
-- Alias name (AS) used to set nickname for long names

-- where clause
-- select * from employee where employeeId = 5
-- select * from employee where employeeId IN (1,2)
-- select * from employee where employeeId between 3 and 6
-- we can use all the operators in where clause

-- DISTINCT cluase
-- Helps us retrieving only distinc values from table
-- Shows values only one time
create table table12
(
SalesmanId int primary key,
SalesmanName varchar(20) not null,
Commision int,
City char(20) not null,
Age smallint

)

INSERT INTO table12

select 101,'Joe',50,'California',17 UNION
select 102,'Simon',75,'Texas',25 UNION
select 103,'Jessie',105,'Florida',35 UNION
select 104,'Danny',100,'Texas',22 UNION
select 105, 'Lia',65,'New Jersey',30

select distinct City from table12

-- TOP clause
-- Top helps us in identifying n numbers of records per request

select top 1 * 
from table12 as tbc
where city ='Texas'

-- Like operator
-- helps us in identifying patterns in the text values
-- % refers to 0to n number of alpha numeric characters
-- _refers to only one alpha numeric characters

select * from table12 as tbc
where SalesmanName like '%i' -- example of '%h'

select * from table12 as tbc
where SalesmanName like 'j%' -- example of 'd%'

select * from table12 as tbc
where SalesmanName like '%i_' -- example of '%h_'

select * from table12 as tbc
where SalesmanName like '%j%' -- example of '%h%'

 -- Module 2 (06/01/25)
 -- Joins
 -- there are three major types of joines
 /* 1. Inner join :- It returns records having matching values in both tables but will return only common values
  
    2. Outer joins  
	3. Left join
	4. Right join
	5. Full join

*/


	CREATE TABLE Employee
(
	EmployeeId int
	, EmployeeFirstName varchar(100)
	, EmployeeLastName varchar(100)
	, Salary int
	, Address varchar(500)-- Address is a keyword in SQL
)
INSERT INTO Employee
	(
		EmployeeId
		, EmployeeFirstName
		, EmployeeLastName
		, Salary
		, Address
	)
	VALUES (1,'Dinesh','Kumar', 7000, 'India')
	, (2,'John','Smith', 2000, 'US')
	, (3,'Santosh','Kumar', 3000, 'India')
	, (4,'Steve','Smith', 5000, 'Aus'),
	(5,'Disha','Kumari', 4000, 'India')
	, (6,'Johny','Diddy', 2000, 'US')
	, (7,'Suraj','Sharma ', 3000, 'India')
	, (8,'Pat','cummins', 1000, 'Aus')
	, (9,'King','Bobzy', 250, 'Pak')
	
create table EmployeeDOB
(
EmployeeID int,
EmployeeDOB date
)
insert into EmployeeDOB
values(1,GETDATE()-7000) -- GETDATE will get todays date and -7000 will reduce 7000 days from today's date
,(2,GETDATE()-7300)
,(5,GETDATE()-7900)
,(6,GETDATE()-8000)
,(7,GETDATE()-7800)
,(8,GETDATE()-7600)
,(9,GETDATE()-6000)  
,(10,GETDATE()-12000)
,(11,GETDATE()-15000)
select * from EmployeeDOB
select * from Employee

-- join functions
select Employee.*,EmployeeDOB.EmployeeDOB
from Employee
inner join  EmployeeDOB 
ON EmployeeDOB.EmployeeID = Employee.EmployeeId

select Employee.*,EmployeeDOB.EmployeeDOB
from Employee
left join  EmployeeDOB 
ON EmployeeDOB.EmployeeID = Employee.EmployeeId

select Employee.*,EmployeeDOB.EmployeeDOB
from Employee
right join  EmployeeDOB 
ON EmployeeDOB.EmployeeID = Employee.EmployeeId

/* select Employee.*,EmployeeDOB.EmployeeDOB
from Employee
full join  EmployeeDOB 
ON EmployeeDOB.EmployeeID = Employee.EmployeeId */

-- 08/01/25
-- Full Outer Join
-- Returns all records from table and the matching records from the left table
select *
from Employee
FULL outer join  EmployeeDOB 
ON EmployeeDOB.EmployeeID = Employee.EmployeeId

-- Cross Join
-- takes a cartesian product of both the tables

select *
from Employee
cross join EmployeeDOB

create table months(
Monthnum varchar(10)
)

insert into months
select 'JAN' UNION ALL
select 'FEB' UNION ALL
select 'MAR' UNION ALL
select 'APR' UNION ALL
select 'MAY' UNION ALL
select 'JUN' UNION ALL
select 'JUL' UNION ALL
select 'AUG' UNION ALL 
select 'SEP' UNION ALL
select 'OCT' UNION ALL
select 'NOV' UNION ALL
select 'DEC'
SELECT * FROM months

SELECT EmployeeFirstName,EmployeeLastName,Monthnum
from Employee
cross join months

-- 09/01/25
/*
Update and delete
Update is used to modify the existing statement
Delete is used to delete an existing statement
*/
-- UPDATE

-- Backing up the whole table

select *
INTO Employee_backup
from Employee

select * from Employee_backup as bak

-- Backing up selected rows

select * 
into Employee_backup1
from Employee
where EmployeeId In(1,4,7)

select * from Employee_backup1

-- Backing up selected columns

select EmployeeId , Salary
into Employee_backup2
from Employee
where EmployeeId In(1,4,7)

select * from Employee_backup2

-- Update Always 
update Employee
--set EmployeeId = 1
set EmployeeFirstName = 'Dineesh'
where EmployeeId in (1)

select * from Employee

update Employee
set EmployeeFirstName = Employee_backup.EmployeeFirstName
from Employee
inner join Employee_backup
on Employee_backup.EmployeeId = Employee.EmployeeId
select * from Employee

-- Delete command removes all the command stored in the table but the structure of the table will remain as it is.

delete Employee
from Employee
where EmployeeId In (8)
select * from Employee

delete Employee
from Employee
where EmployeeId in(1)

select * from Employee

-- 09/01/25

-- Alter 
-- add,remove or modify a column
--add
alter table Employee_backup
add Fine1 int not null default(100)

select * from Employee_backup
--drop
alter table Employee_backup
drop column fine1

create table m3
(ID int,
Name varchar(10),
salary int
)
insert into m3
select 1,'jajsd',5550 UNION
select 2,'wrwrsd',4555 UNION
select 3,'hcsdk',5565 
select * from m3
sp_help m3

alter table m3
add pincode int

alter table m3
add surname varchar(10)

alter table m3
add address int not null default(223)

alter table m3
drop constraint DF__m3__address__6754599E

alter table m3 
drop column salary

alter table m3
alter column surname varchar(20) 

delete from m3
where pincode = NULL
SELECT* FROM m3

-- Temp table

create table #LocalTempTable
(
Id int,
name varchar(100)
)
insert into #LocalTempTable(Id,name)
select 1,'Dinesh' UNION all
select 2,'Suresh' UNION all
select 3,'Mukesh'
select * from #LocalTempTable


create table ##GlobalTempTable
(
Id int,
name varchar(100)
)
insert into ##GlobalTempTable(Id,name)
select 1,'Dinesh' UNION all
select 2,'Suresh' UNION all
select 3,'Mukesh'
select * from ##GlobalTempTable


select * 
into #emeh
from m3

select * from #emeh

-- table variable
-- Things declared with @ are known as table variable


declare @hikepercent int = 10

select *,
@hikepercent AS HikePercent,
Salary *(@hikepercent/100.0) as hikedsalary,
Salary + (Salary *(@hikepercent/100.0) ) as Final
from Employee_backup

select *,
12 as Hikepercent,
Salary *(10/100.0) as Hikedsalary,
Salary +(Salary *(10/100.0)) as FinalSalary
from Employee

select * from Employee


declare @tablevariable table
(
id int,
name varchar(100)
)
insert into @tablevariable(id,name)
select 1,'hjfsgdxj' union all
select 2,'fhydgued' union all
select 3,'asfsdah'

select * from @tablevariable as t

-- functions
-- same as other coding languages

-- scalar function
select GETDATE()
select GETUTCDATE()
select GETDATE() + 2
select GETDATE()-2
select DATEADD(HOUR,2,GETDATE())
select DATEADD(HOUR,2,GETDATE())
select DATEADD(YEAR,2,GETDATE())
select DATEADD(YEAR,-2,GETDATE())
select DATEADD(MONTH,2,GETDATE())


-- STRINGS
SELECT upper('DINESH kumar')as Upper 
SELECT lower('DINESH kumar')as Lower
select len('  jhjhsgdgyusd  ') as LenghtOfString
select 'Dinesh'+' '+'Kumar' AS Full_Name
select 'psahu65'+'@'+'gmail.com' as email
select left('dinesh',4) 
select right ('dinesh',2) 
select trim('           hfvbkfd  jsdcgjbd    ')

-- 17/01/2025

create table emptable(
ID int,EmailId varchar(100)
)
insert into emptable(ID,EmailId)
select 1,'jdhdjj@gmail.com' union all
select 2,'jhdjj@gmail.com' union all
select 3,'dhdjj@gmail.com' union all
select 4,'jddjj@gmail.com' union all
select 5,'jdhjj@gmail.com' 

select *
, SUBSTRING(EmailId,1,CHARINDEX('@',EmailId)-1)as Username
,  SUBSTRING(EmailId,CHARINDEX('@',EmailId)+1,LEN(EmailId))as Domain
from emptable

-- scalar functions
-- converting Integer To String
select 'Dinesh'+'kumar' 
select 21+21 -- number value will return
select '21'+'21' -- string will return
select 'Dinesh' + 21 -- error cannot concat string and int

-- CAST and CONVERT

select 'Dinesh'+CAST(21 as varchar) -- ANSI STANDARD SQL FUNCTION

select 'Dinesh'+convert(varchar,21) -- SPECIFIC TO TSQL

SELECT ISNULL(NULL,'VALUE NA')
FROM Employee

SELECT * FROM uniquetest
WHERE  ISNULL(Id,5) <= 6
-- ISNULL function is used to replace null values to specified values since we cannot fetch the null values in a table by directly using where clause

-- aggregate function
-- These functions operate on a collection of values and returns a single value
select MAX(Salary) as MaximumSAlary from Employee
where Address = 'US'
select MAX(Salary) as MinimumSAlary from Employee
where Address = 'US'

select AVG(Salary) from Employee
select SUM(Salary)/COUNT(EmployeeID) from Employee
select * from Employee
HAVING min(Salary) 

create or alter function fn_EmployeeFullName
(
@firstname varchar(50),
@Lastname varchar(50)
)
RETURNS VARCHAR(101)
AS 
BEGIN
RETURN(CONCAT(TRIM(@firstname),' ',TRIM(@Lastname)))
END
select dbo.fn_EmployeeFullName('John','Smith') AS Fullname union all
select dbo.fn_EmployeeFullName('Steve','Smith') AS Fullname

create or alter function fn_addnum
(
@int1 int,
@int2 int
)
returns int
as 
begin
return (isnull(@int1,0)+isnull(@int2,0))
end
select dbo.fn_addnum(1,2) AS Addition union all
select dbo.fn_addnum(25,33) AS Addition union all
select dbo.fn_addnum(25,-26) AS Addition union all
select dbo.fn_addnum(25,NULL) AS Addition

-- 20/01

create or alter function fn_GetEmployeeDetails
(
 @address varchar(100)
)

RETURNS TABLE 
AS

RETURN(SELECT dbo.fn_GetEmployeeFullName(EmployeeFirstName,EmployeeLastName) AS FullName
,Salary
,Address
,EmployeeDOB
from Employee_backup as emp
LEFT JOIN EmployeeDOB as eds
on emp.EmployeeId = eds.EmployeeID
where emp.Address = @address

select fn_GetEmployeeDetails(US)

-- OrderbBy It is used to sort the data 
-- By default it will arrange in ascending order
-- for descending we use DESC

select * 
from Employee_backup
order by Salary DESC,EmployeeId ASC
-- Sorting the data bye index of column number
select * 
from Employee_backup
order by 4 DESC,
1 ASC

create table insort
(
ID int
)
insert into insort(ID)
select 1 union all
select 2 union all
select 3 union all
select 5 union all
select 6 union all
select 7 union all
select 8 union all
select 9 union all
select 10 union all
select -11 union all
select 154 union all
select 221 union all
select 144 union all
select -3

select * 
from insort
order by ID DESC
create table Textsort
(
ID varchar(100)
)
insert into Textsort(ID)
select 1 union all
select 2 union all
select 3 union all
select 5 union all
select 6 union all
select 7 union all
select 8 union all
select 9 union all
select 10 union all
select -11 union all
select 154 union all
select 221 union all
select 144 union all
select -3




insert into Textsort(ID)
select '!hello' union all
select 'Hello' union all
select 'hello' union all
select '@hello' union all
select '#hello'union all
select '123.56' union all
select '-22' 

select * from Textsort
order by ID ASC

-- Write a query to find the top 5 products with the highest sales from sale table
select Top 5 * 
from sales
order by sales

create table PopulationTable
(
Country Varchar(50),
City varchar(50),
Town varchar(50),
Population int

)
INSERT INTO PopulationTable
Select 'C1','CT1','T1',100 UNION all
Select 'C1','CT1','T2',23 UNION all
Select 'C1','CT2','T3',87 UNION all
Select 'C1','CT2','T4',98 UNION all
Select 'C2','CT3','T5',74 UNION all
Select 'C2','CT3','T6',14 UNION all	
Select 'C2','CT4','T7',78 UNION all																								
Select 'C2','CT4','T8',56

select Country,sum(Population) AS Total_Population
from PopulationTable
Group by Country

select City,sum(Population) AS Total_Population
from PopulationTable
Group by City

select Town,sum(Population) AS Total_Population
from PopulationTable
Group by Town

select Country,City,sum(Population) AS Total_Population
from PopulationTable
Group by City,Country

SELECT ASCII('!'), ASCII('%') -- To know the preference number of special characters

-- Filter

select City,sum(Population) AS Total_Population
from PopulationTable
where City <> 'CT3'
Group by City

select City,sum(Population) AS Total_Population
from PopulationTable
--where City = 'CT1' OR City='CT2'
where City <> 'CT3' AND City <> 'CT4'
Group by City

-- HAVING clause should be used with group by to impose some condition with group by

select City,sum(Population) AS Total_Population
from PopulationTable
where City <> 'CT3'
Group by City
HAVING SUM(Population) < 150
order by City DESC

-- Except Operator
select Id,Name 
from defaulttest
except 
select *
from primarykeytest

select * from defaulttest 
select * from primarykeytest

-- will have duplicate values
select EmployeeId,EmployeeFirstName from Employee
union all
select * from primarykeytest
union all
select * from uniquetest

-- Will not return duplicate values
select EmployeeId,EmployeeFirstName from Employee
union 
select * from primarykeytest
union 
select * from uniquetest



-- Except Operator
-- Returns the records present only in first select and not in second select
-- It is similar to left join
create table F1(
id int identity(1,1),
Fruits varchar(50))
insert into F1
values('Mango'),
('Musk'),
('Papaya'),
('Apple')


create table F2(
id int identity(1,1),
Fruits varchar(50))
insert into F2
values('Mango'),
('Oranges'),
('watermelon'),
('Apple')


select Id,Fruits 
from F1
except 
select *
from F2

-- Intersect Operator
-- to return common records between both select statement

select Id,Fruits 
from F1
INTERSECT
select *
from F2
-- Ranking Functions
-- Helps us to rank the rows based on some values

Event Javelin Throw

Player   Score(DESC) ROW_NUMBER  RANK               DENSE_RANK
A           89.8          1        1  GOLD MEDAL       1    
B           89.6          2        2  SILVER MEDAL     2
C           89.6          3        2  SILVER MEDAL     2   
D           89.4          4        4                   3


create table RANKING_TABLE(
COUNTRY CHAR(5),
City varchar(20),
Population int
)
INSERT INTO RANKING_TABLE
Select 'A','Z',452345 UNION ALL
Select 'A','M',687688 UNION ALL
Select 'A','G',687688 UNION ALL
Select 'B','N',935676 UNION ALL
Select 'B','O',126863 UNION ALL
Select 'B','P',445678 UNION ALL
Select 'B','Q',434654 UNION ALL
Select 'B','R',789768 UNION ALL
Select 'B','S',345324 UNION ALL
Select 'B','H',345324

SELECT * FROM RANKING_TABLE
SELECT * 
,ROW_NUMBER() OVER(ORDER BY Population DESC) AS Row_values
from RANKING_TABLE
SELECT * 
,RANK() OVER(ORDER BY Population DESC) AS RANKING
from RANKING_TABLE
UNION ALL
SELECT * 
,DENSE_RANK() OVER(ORDER BY Population DESC) AS DENSE_RANKING
from RANKING_TABLE

-- ORDER BY COMBINED WITH PARTITION BY 
SELECT * ,
ROW_NUMBER() OVER(PARTITION BY Country ORDER BY Population DESC) AS NEW
FROM RANKING_TABLE

SELECT * ,
RANK() OVER(PARTITION BY Country ORDER BY Population DESC) AS NEW
FROM RANKING_TABLE

SELECT * ,
DENSE_RANK() OVER(PARTITION BY Country ORDER BY Population DESC) AS NEW
FROM RANKING_TABLE


SELECT * ,
DENSE_RANK() OVER(PARTITION BY Country ORDER BY Population DESC) AS NEW
FROM RANKING_TABLE
WHERE COUNTRY = 'A'
-- NO NEED TO USE PARTITION BY TO DISPLAY A SPECIFIED COUNTRY 
SELECT * ,
DENSE_RANK() OVER(ORDER BY Population DESC) AS NEW
FROM RANKING_TABLE
WHERE COUNTRY = 'A'

--CTE (COMMON TABLE EXPRESSION)
;WITH RANKEDPOP
AS
(
SELECT * ,
DENSE_RANK() OVER(PARTITION BY Country ORDER BY Population DESC) AS NEW
FROM RANKING_TABLE
)
SELECT * FROM RANKEDPOP
WHERE NEW = 3 -- OR WHERE NEW IN (3)

;WITH RANKEDPOP
AS
(
SELECT * ,
DENSE_RANK() OVER(ORDER BY Population DESC) AS RANK
FROM RANKING_TABLE
)
SELECT * FROM RANKEDPOP
WHERE RANK = 3 -- OR WHERE NEW IN (3)


-- INDEXES AND INDEX STRUCTURE

  -- They are routes to better performance in SQL server 
  -- When we use where clause it scans every record in database
  -- Index avoids this goes directly to the data

  CREATE TABLE IndexData(
  Id INT PRIMARY KEY,
  Name varchar(50)
 );
 DECLARE @i INT = 1
 WHILE @i <= 10000
 BEGIN 
 INSERT INTO IndexData (Id,Name)
 VALUES (@i,'Priyanshu'+ cast(@i as varchar(5)));
 SET @i =@i+1;
 END;

 SELECT * FROM IndexData

 select * into IndexTest From IndexData
 select * into IndexTest_CI From IndexData
 
 SELECT * FROM IndexTest
 WHERE Id = 3339

 create clustered index IX_IndexTest_CI_Id ON IndexTest_CI(Id)
 
 -- to fetch record from CI
 
 select * from IndexTest_CI
 where Id = 3339 Or Id =7748

 -- We create index to reduce our compiling time

 -- In clustered it will directly open the data and in the non clustered index it will point to the address of the data
 

 -- Module 5
 /*
    Stored procedure
	They are similar to function
	when we work on huge database we use procedure instead of function

	Why we use stored procedure
 1. Encapsulation :- 
 2. Reusability :-
 3. Maintainability :-
 4.Execution Plan Caching :-
   - Parsing (20%) time taken in %
   - Compiling (40%)
   - Executes (40%)

*/

CREATE or ALTER PROCEDURE csp_GetData
 AS 
 BEGIN
      SELECT * 
      FROM Employee_backup
 END


EXEC csp_GetData

CREATE OR ALTER PROCEDURE dbo.csp_Getdata
AS
BEGIN
SELECT EmployeeId,EmployeeFirstName,EmployeeLastName,Address
from Employee_backup
END

EXEC csp_Getdata

create or alter function fn_EmployeeFullName
(
@firstname varchar(50),
@Lastname varchar(50)
)
RETURNS VARCHAR(101)
AS 
BEGIN
RETURN(CONCAT(TRIM(@firstname),' ',TRIM(@Lastname)))
END

CREATE OR ALTER PROCEDURE dbo.csp_GetData
(
 @EmployeeId int = 0
)
AS
BEGIN
SELECT Employee.EmployeeId,dbo.fn_EmployeeFullName(EmployeeFirstName,EmployeeLastName) AS FullName ,Address,EmployeeDOB
FROM Employee
Left join EmployeeDOB
on Employee.EmployeeId = EmployeeDOB.EmployeeID
where Employee.EmployeeId = @EmployeeId OR @EmployeeId = 0
end

EXEC csp_GetData @EmployeeId = 5

CREATE OR ALTER PROCEDURE csp_GetData2
(
@EmployeeId int = 0,
@EmployeeAddress varchar(100)

)
AS 
BEGIN
SELECT EmployeeId,dbo.fn_EmployeeFullName(EmployeeFirstName,EmployeeLastName) AS FullName,
       Address 
	   from Employee
	   where (EmployeeId = @EmployeeId Or @EmployeeId = 0)
	   or Address = @EmployeeAddress
	   end
	   EXEC csp_GetData2  @EmployeeAddress = 'INDIA', @EmployeeId = 5

	   sp_helptext csp_GetData


-- Table valued PROCEDURE

CREATE OR ALTER PROCEDURE csp_SetData
(
@EmployeeID int
, @EmployeeFirstName varchar(100)
,@EmployeeLastName varchar(100)
,@Salary int
,@Address varchar(200)
)
AS 
BEGIN
IF NOT EXISTS (SELECT * FROM Employee_backup where EmployeeId =@EmployeeID)
INSERT INTO Employee_backup(EmployeeId,EmployeeFirstName,EmployeeLastName,Salary,Address)
SELECT @EmployeeID,@EmployeeFirstName,@EmployeeLastName,@Salary,@Address
ELSE
PRINT 'EMPLOYEE ID ALREADY EXISTS'
END
EXEC csp_SetData 10,'Leo','smith',2000,'us'


select * from Employee_backup

Create or alter procedure csp_SetData1
(
@EmployeeID int
, @EmployeeFirstName varchar(100)
,@EmployeeLastName varchar(100)
,@Salary int
,@Address varchar(200)
)
as
begin
IF NOT EXISTS (SELECT * FROM Employee WHERE EmployeeId = @EmployeeID )
insert into Employee(EmployeeId,EmployeeFirstName,EmployeeLastName,Salary,Address)
select @EmployeeID,@EmployeeFirstName,@EmployeeLastName,@Salary,@Address
Else
print 'Employee ID Already Exists Please Enter New Id'
end

exec csp_SetData1 1,'dd','dsd',95898,'IND'
select * from Employee

-- VIEW

create or alter view vw_GetEmployeeData
AS
select EmployeeId,EmployeeFirstName,EmployeeLastName,Address

from Employee
where EmployeeId > 3

select * from vw_GetEmployeeData

CREATE OR ALTER VIEW VW_GetEmployeeData
AS
select Employee.EmployeeId,dbo.fn_EmployeeFullName(EmployeeFirstName,EmployeeLastName) as FullName,Address,EmployeeDOB.EmployeeDOB
from Employee
left join EmployeeDOB
on EmployeeDOB.EmployeeID = Employee.EmployeeId
where Employee.EmployeeId > 3

select * from VW_GetEmployeeData
where EmployeeId In (5,6)

-- Orphan View

CREATE OR ALTER VIEW vw_GetEmployeeBackupData
with SCHEMABINDING
AS 
SELECT EmployeeId,EmployeeFirstName,Address 
from dbo.Employee_backup1

ALTER TABLE Employee_backup1
drop column EmployeeId

select * from vw_GetEmployeeBackupData
select * from Employee_backup1
insert into  vw_GetEmployeeBackupData(EmployeeId,EmployeeFirstName,Address)
select 77,'Manas','Adarsh nagar'

update vw_GetEmployeeBackupData
set Address = 'Saddhu'
where EmployeeId = 77

select * from vw_GetEmployeeBackupData
select * from Employee_backup1




-- Transaction
-- we use transaction when multiple number of rows are inserted , deleted or update in a sequence
-- ACID properties

BEGIN TRANSACTION

UPDATE Employee_backup1
SET Employee_backup1.EmployeeLastName = 'PUNJABI'
WHERE EmployeeId = 1
COMMIT TRANSACTION

UPDATE Employee_backup1
SET Employee_backup1.EmployeeLastName = 'PUNJAB'
WHERE EmployeeId = 1
ROLLBACK TRANSACTION

SELECT @@TRANCOUNT




select *, Grade =
case
when salary <= 2000 then 'C'
when salary <= 3000 then 'B'
when salary > 3000 then 'A'

ELSE
'No data provided'
end
from Employee

update Employee
set Salary = NULL
where EmployeeFirstName = 'King'

-- Error/Exception Handling


DECLARE @numerator int = 40
,@denominator int = 0

BEGIN TRY
SELECT @numerator/@denominator AS RESULT
END TRY
BEGIN CATCH
SELECT 'CATCH BLOCK IS HIT' AS ERROR

DECLARE @ERRORMESSAGE VARCHAR(500)
SET @ERRORMESSAGE = ERROR_MESSAGE()

select @ERRORMESSAGE As Error_Name

end catch

/* 
 
  Schema

  */


CREATE SCHEMA Clothing
GO

CREATE SCHEMA Electronics
GO


DROP SCHEMA Food 
GO

CREATE SCHEMA Food 
GO
CREATE Food.Employee
(
EmployeeId int,
EmployeeFirstName varchar(50),
EmployeeLastName varchar(50),
Salary int,
Address Varchar(100)

)

CREATE TABLE DupTest
(
ID int,
Name varchar(100)
)
insert into DupTest
select 1,'Dinesh' union all
select 1,'Dinesh' union all
select 1,'Dinesh' union all
select 2,'John' union all
select 2,'John' union all
select 2,'Smith' union all
select 3,'Santosh' 

select Id,Name ,count(*) as Count_Of_Records
from DupTest
group by ID,Name
Having count(*) > 1

;with cte
as
(Select * ,
ROW_NUMBER() over(PARTITION BY Id,Name order by Id) as RowNumber
From DupTest )

Delete from cte
where RowNumber > 1

select * from DupTest

-- Normalization :- It is used to reduce for data redundancy
-- Type Of Normalization
-- First Normal Form (1 NF)
-- Second Normal Form (2 NF)
-- Third Normal Form (3 NF)

-- Drwabacks of Data Redundancy
-- Dat Manipulation isuue

-- First Normal Form
-- Every cell (Intersection of a row and column) must have a single data value.

-- Normalized Steps
-- First create a database table (Lookup Table) giving each department a particular id (Department_Id)
/*
-- Denormalized Table

Emp_ID     Name       Emp_Age       Department
  1        Dinesh      27           Software,Testing,Finance
  2        Santosh     28           Management,Sales,Finance    
  3        John        25           SW,nhdcgxjh,fhdcuy      
  4        Smith       29           cbhjs,dbasuyb,hbascj


 -- Normalized Steps
-- First create a database table (Lookup Table) giving each department a particular id (Department_Id)

Dept_Id         Department
   1             Software
   2             Testing
   3             Finance
   4             Management

 Emp_ID     Name       Emp_Age       Department_Id
  1        Dinesh        27               2
  2        Santosh       28               3
  3        John          25               1 
  4        Smith         29               4


Second Normal Form

In this Partial dependencies are removed and placed in different table

Third Normal Form

Non primary key column should not depend on non primary key columns


*/

-- declare @EmployeeId
select * from Employee_backup1

create or alter procedure csp_GetEmployeeDet( @EmployeeID int )
as
begin

select * 
from Employee_backup1
where EmployeeId = @EmployeeID
END

EXEC csp_GetEmployeeDet @EmployeeID = 1

select * from Employee_backup1
alter table Employee_backup1
alter column EmployeeFirstName varchar(20)






















