-- Project :- Relational Database Design in SQL server

create table role
(
Id int primary key,
role_name varchar(100) -- name varchar(100)
)

-- To rename a column we can execute sp_rename('role.name','role_name',column)

create table user_account
(
id int primary key,
User_name varchar(100),
email varchar(254),
password varchar(200),
password_salt varchar(50) not null,
password_hash_algorithm varchar(50)
)


create table status
(
Id int primary key,
status_name varchar(100),
is_user_working  bit --varchar(5) check(is_user_working in ('yes','no'))
)

create table user_has_role(
Id int primary key,
role_start_time datetime,
role_end_time datetime NOT NULL,
user_account_id int foreign key references user_account(id) ,
role_id int foreign key references role(Id)
)

create table user_has_status
(
Id int primary key,
status_start_time datetime,
status_end_time datetime NOT NULL,
user_account_id int foreign key references user_account(id) ,
status_id int foreign key references status(Id)
)

Insert into role
(Id,role_name)
select 1,'Sales'
select 2,'Technical'

Insert into status
(Id,status_name,is_user_working)
select 1,'new status',1
select 2,'new status',1

insert into user_account(id,User_name,email,password,password_salt,password_hash_algorithm)

select 1,'Ramesh','ramesh@gmail.com','xyz','xyza','xyzab'
select 2,'Suresh','suresh@gmail.com','xyz','xyza','xyzab'

insert into user_has_role
select 1,GETDATE(),

sp_help user_account

alter table role
drop constraint PK__role__3214EC074A2747A1

alter table user_has_role
drop constraint PK__user_has__3214EC078DFB2EA7

alter table user_has_role
drop constraint PK__user_has__3214EC078DFB2EA7

alter table user_has_role
drop constraint FK__user_has___user___3D5E1FD2

alter table user_account
drop constraint 


alter table user_has_role NOCHECK CONSTRAINT ALL;






