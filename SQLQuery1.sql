-- create database class1 :- command to create a database
use class1
-- single line comment
/* Multiple line comment
here this is a comment */
-- create database class2
-- drop database class2
/* Datatypes in SQL
1.numeric:-
Bigint
int 
tinyint
2.string:-
char(n)
varchar(n)
nvarchar(n)
3.decimal
4.DATETIME
date - MM-DD-YYYY HH:MM:SS My laptops configuration
date - DD-MM-YYYY HH:MM:SS

Operators in sql :-
=,
<,
>,
<=,
>=,
!=
BETWEEN - for searching in a range
lIKE - search a pattern
IN - to specify particular value

// Create Table:- */
 /*CREATE TABLE customer2
(CustomerID int,
CustomerName char(15),
ContactName char(25),
Address Varchar(50),
City char(15),
PostalCode int,
Country char(20)) 
/*select * from customer1 */ -- to view all the data we use star(*)
-- inserting valu in the above table
/*1. values method
 2.select method*/
 -- values method
 insert into customer2
 values(1,'alfred','maria','141 sdycfsu.jgdsch','bhopal','493225','England'),
 (2,'NAina','ria','142 sdycfsu.jgdsch','bhopal','493225','England'),
 (3,'Sunaina','maia','143 sdycfsu.jgdsch','bhopal','493225','England'),
 (4,'Rishi','aria','144 sdycfsu.jgdsch','bhopal','493225','England'),
 (5,'Nikhil','mari','145 sdycfsu.jgdsch','bhopal','493225','England')
 select * from customer2 
 drop table customer2 -- command to drop or delete the table */
/* CREATE TABLE customer2
(CustomerID int,
CustomerName char(15),
ContactName char(25),
Address Varchar(50),
City char(15),
PostalCode int,
Country char(20)) 

insert into customer2
select 1,'alfred','maria','141 sdycfsu.jgdsch','bhopal','493225','England' UNION
select 2,'NAina','ria','142 sdycfsu.jgdsch','bhopal','493225','England' UNION
select 3,'Sunaina','maia','143 sdycfsu.jgdsch','bhopal','493225','England' UNION
select 4,'Rishi','aria','144 sdycfsu.jgdsch','bhopal','493225','England' UNION
select 5,'Nikhil','mari','145 sdycfsu.jgdsch','bhopal','493225','England' UNION
select 1,'alfred','maria','141 sdycfsu.jgdsch','bhopal','493225','England'

select * from customer2 */

-- 06/01/2025

select * from ##GlobalTempTable
select * from #LocalTempTable






 