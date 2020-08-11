use master;
go

create table Customers
(
	Id int not null primary key identity (1,1),
	FirstName nvarchar(250),
	LastName NVARCHAR(250),
	CardNumber int
)
GO

create table Products
(
	Id int not null primary key identity (1,1),
	[Name] NVARCHAR(250),
	Price money
)
GO

create table Orders
(
	Id int not null primary key identity (1,1),
	ProductId int foreign key references Products(id),
	CustomerId int foreign key references Customers(id)
)
GO

insert into customers (FirstName, LastName, CardNumber) values ('Yujun', 'Chen', 0615);
insert into customers (FirstName, LastName, CardNumber) values ('Fred', 'B', 0230);
insert into customers (FirstName, LastName, CardNumber) values ('Jeremy', 'C', 0415);
GO

insert into Products ([name], Price) values ('PC', 1500.00);
insert into Products ([name], Price) values ('VR', 1000.00);
insert into Products ([name], Price) values ('Keyboard', 80.00);
GO

insert into Orders ([ProductId], CustomerId) values (1, 1);
insert into Orders ([ProductId], CustomerId) values (1, 2);
insert into Orders ([ProductId], CustomerId) values (1, 3);
GO

insert into Products ([name], Price) values ('iPhone', 200.00);
insert into customers (FirstName, LastName, CardNumber) values ('Tina', 'Smith', null);
select id from Products where [name]='iPhone';
select id from Customers where FirstName='Tina' and LastName='Smith';
insert into Orders (ProductId, CustomerId) values (4, 4);
GO

select * from Customers where FirstName='Tina' and LastName='Smith';
GO

select sum(price) from Products where [name]='iPhone';
GO

update products set price=250.00 where [name]='iPhone';
GO
