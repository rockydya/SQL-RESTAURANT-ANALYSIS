CREATE TABLE Salesman 
(
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);
---------------------------------------------------------
CREATE TABLE Customer
(
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);
-------------------------------------------------------
CREATE TABLE Orders
(
OrderId int, 
CustomerId int, 
SalesmanId int,
Orderdate Date, 
Amount money
);

INSERT INTO Orders
Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500);
-------------------------------------------------------------



1---Insert a new record in your Orders table.
insert into orders (orderid,customerid,SalesmanId,Orderdate,Amount)
values(5006,1234,103,'2003-09-20',3000)

2---Add Primary key constraint for SalesmanId column in Salesman table. Add default
---constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
---column in Customer table. Add not null constraint in Customer_name column for the
---Customer table.
alter table salesman
alter column salesmanid int not null;

alter table salesman 
add constraints pk_name primary key (salesmanid);

alter table salesman ------------------------------------------2
add constraint fk_salesman_city default 'unknown' for city;

alter table customer-------------------------------------------3
add constraint fk_name foreign key (salesmanid)
references salesman(salesmanid);

alter table customer-------------------------------------------4
alter column customername varchar(100)  not null; 

3---Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
---amount value greater than 500.
select customername,purchaseamount
from customer
where customername like '%n'
and purchaseamount>500--------not getting proper ans hence change in table

select name
from salesman
where name like '%n'
select purchaseamount 
from customer 
where purchaseamount >500;

4---Using SET operators, retrieve the first result with unique SalesmanId values from two
----tables, and the other result containing SalesmanId with duplicates from two tables.

select Salesmanid--------------------a
from salesman
union 
select salesmanid 
from customer;

select salesmanid-------------------b
from salesman
intersect
select salesmanid
from customer;

5---Display the below columns which has the matching data.
----Orderdate, Salesman Name, Customer Name, Commission, and City which has the
----range of Purchase Amount between 500 to 1500.
select * from Customer
select * from Salesman
select * from orders

select 
   o.orderdate,
   s.name as salesmanName,
   c.customername,
   s.commission,
   s.city
from orders o
join customer c on o.customerid = c.customerid
join Salesman s on o.salesmanid = s.salesmanid
where o.Amount between 500 and 1500;

6---Using right join fetch all the results from Salesman and Orders table
select * 
from salesman s
right join orders o on s.salesmanid=o.SalesmanId;

 
