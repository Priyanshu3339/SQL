/*create database assignments
use assignments*/
create table salesmantable
(
SalesmanId int primary key,
SalesmanName varchar(20) not null,
Commision int,
City char(20) default('No City Provided'),
Age smallint

)

INSERT INTO salesmantable

select 101,'Joe',50,'California',17 UNION
select 102,'Simon',75,'Texas',25 UNION
select 103,'Jessie',105,'Florida',35 UNION
select 104,'Danny',100,'Texas',22 UNION
select 105, 'Lia',65,'New Jersey',30

select * from salesmantable

create table customertable
(
SalesmanId int, -- foreign key references salesmantable(SalesmanId),
CustomerId int ,
CustomerName varchar(40) not null,
PurchaseAmount int

)

INSERT INTO customertable

select 101,2345,'Andrew',550 UNION
select 103,1575,'Lucky',4500 UNION
select 104,2345,'Andrew',4000 UNION
select 107,3747,'Remona',2700 UNION
select 110,4004,'Julia',4545
 
 select * from customertable
 
 create table ordertable
(
orderId int primary key,
CustomerId int ,
SalesmanId int,
orderdate date,
Amount int

)

insert into ordertable
select 5001,2345,101,'07-04-2021',550 UNION
select 5003,1234,105,'02-15-2022',1500 

select * from salesmantable
select * from customertable
select * from ordertable
select * from customertable 
where CustomerName like 'A%' and PurchaseAmount > 600

select SalesmanName,CustomerName,Commision,city
from salesmantable
inner join customertable
on salesmantable.SalesmanId=customertable.SalesmanId


SELECT *
FROM salesmantable
RIGHT JOIN ordertable
ON salesmantable.SalesmanId=ordertable.SalesmanId



-- Assignment 2

create Table Assg2
(
Customer_Id int identity(1,1),
First_name varchar(50) not null,
Last_Name varchar(50),
Email varchar(40),
Address   varchar(100),
City varchar(30),
State varchar(30),
Zip int
)
insert into Assg2
select 'Suraja','sharma','surajsharma@micro.com','Mowa','Raipur','CG',492001 union all
select 'Goea','Goldberg','joe79@google.com','Street 9','San jose','California',66542 union all
select 'Suvansh','sharma','suvanshsharma@adobe.com','Killapara','Khairagarh','CG',491881 union all
select 'Priyanshu','Sahu','priyanshu@gmail.com','Indiranagar','Bangalore','KA',560017 union all
select 'Gajju','tripathi','pankaj@gmail.com.','Bus stand','Saragaon','CG',493225

select * from Assg2


select First_name , Last_name from Assg2

select * from Assg2 
where
First_name like 'G%' and city = 'San jose' 

select * from Assg2
where Email like '%gmail%'

select * from Assg2
where Last_name not like '%a'


--Assignment 3

create table Orders
(
order_id int identity(1001,1),
order_date date,
amount int,
Customer_Id int
)
insert into orders
select GETDATE()-54,6987,1 union all
select GETDATE()-50,9827,6 union all
select GETDATE()-34,7977,7 union all
select GETDATE()-44,6000,3 union all
select GETDATE()-46,10250,5 

select Assg2.*,Orders.amount,order_date,order_id
from Assg2
inner join Orders
on Assg2.Customer_Id = Orders.Customer_Id


select Assg2.*,Orders.amount,order_date,order_id
from Assg2
left join Orders
on Assg2.Customer_Id = Orders.Customer_Id


select Assg2.*,Orders.amount,order_date,order_id
from Assg2
right join Orders
on Assg2.Customer_Id = Orders.Customer_Id

select Assg2.*,Orders.amount,order_date,order_id
from Assg2
Full outer join Orders
on Assg2.Customer_Id = Orders.Customer_Id

select Assg2.*,Orders.amount,order_date,order_id
into Orders_backup
from orders

select * from orders_backup
select * from orders

update orders
set amount = 100
where Customer_Id in (3)

update orders
set Customer_Id = 3
where Customer_Id in (4)

-- New assignment

create table OrdersTable
(
OrderId int Identity(1,1),
RestaurantName varchar(50),
RestaurantType varchar(50),
Rating DECIMAL(1,1),
NumberOfRating int,
AverageCost int,
OnlineOrder varchar(3) check(OnlineOrder IN ('YES','NO')),
TableBooking varchar(3) check(TableBooking IN ('YES','NO')),
CuisinesType varchar(200)

)

-- Create a user defined functions to stuff the Chicken Into 'Quick Bites'

CREATE OR ALTER FUNCTION fn_Stuff
(
@word varchar(50)
)
Returns varchar(100)
AS
BEGIN
RETURN ('Quick '+ @word + ' Bites')
RETURN ('Quick '+ @word + ' Bites')
End
select dbo.fn_stuff('Chicken') As Cuisines


-- Use the function to display the restaurant name cuisine type which has maximum number of ratings

SELECT RestaurantName,Cuisinestype
,RANK() over(Order by NumberOfRating DESC) as RankOFRating
FROM OrdersTable

-- Use inbuilt function and find the minimum, maximum and average amount from the orders table

select min(AverageAmount) AS min_amount

FROM OrdersTable 


select max(AverageAmount) As Max_Amount
FROM OrdersTable


-- create a user defined function to multiply a number by 10

CREATE OR ALTER FUNCTION fn_M10
(
 @num int
)
RETURNS INT
AS
BEGIN 
RETURN @num*10;
END;

SELECT dbo.fn_M10(5) As RESULT















