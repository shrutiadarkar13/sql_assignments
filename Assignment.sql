CREATE DATABASE "Assignment"
CREATE TABLE "Customer" (
  "Id" int PRIMARY KEY,
  "FirstName" nvarchar (40),
  "LastName" nvarchar (40),
  "City" nvarchar (40),
  "Country" nvarchar (40),
  "Phone" nvarchar (20)
);
CREATE TABLE "Order" (
  "Id" int PRIMARY KEY,
  "OrderDate" datetime,
  "OrderNumber" nvarchar(10),
  "CustomerId" int FOREIGN KEY REFERENCES customer(Id),
  "TotalAmount" decimal(12,2)
);

CREATE TABLE "Product" (
  "Id" int PRIMARY KEY,
  "ProductName" nvarchar(50),
  "UnitPrice" decimal(12,2),
  "Package" nvarchar(30),
  "IsDiscontinued" bit
);



CREATE TABLE "Orderitem" (
  "Id" int PRIMARY KEY,
  "OrderId" int FOREIGN KEY REFERENCES "order"(Id),
  "ProductId" int FOREIGN KEY REFERENCES "product"(Id),
  "UnitPrice" decimal(12,2),
  "Quantity" int
);

CREATE INDEX Customername on Customer (LastName, FirstName);
CREATE INDEX OrderCustomerId on "Order" (CustomerId);
CREATE INDEX OrderOrderDate on "Order" (OrderDate);
CREATE INDEX OrderItemOrderId on OrderItem (OrderId);
CREATE INDEX OrderitemProductId on OrderItem (ProductId);
CREATE INDEX ProductSupplierId on Product (Id);
CREATE INDEX ProductName on Product (ProductName);


INSERT INTO "Customer" values(1122, 'sujay','rao','ert','canada',8667453921),(1234, 'Sanika','Raut','nagpur','india',1235682934),(1235, 'rutika', 'jain','mumbai','india',9922838638),(1236,'teiak','white','Texas','USA',1235466458),(1237,'john','fernandes','murmur','America',6756905778),(1238,'ruchika','gawde','phuket','thailand',1234889632),(1239,'mansi','naik','pune','india',9346781290),(1240,'kiran','yadav','nashik','india',9021784578);
INSERT INTO "Order" values(3100,'2022-11-17',102,1234,12312),(3101,'2022-11-18',102,1235,1215),(3102,'2022-11-19',102,1236,2010),(3103,'2022-11-20',102,1237,123123);
INSERT INTO "Product" values(21,'Product1',2345.00,'Package1',0),(22,'Product2',5235.00,'Package2',1),(23,'Product3',535.00,'Package3',0),(24,'Product4',135.00,'Package4',0);
INSERT INTO "Orderitem" values(1,3100,22,11.00,3),(2,3101,23,100.00,4),(3,3102,24,102.02,5),(4,3103,21,10.04,7);

DROP INDEX CustomerName ON Customer;
ALTER TABLE Customer ALTER COLUMN FirstName nvarchar(40) NOT NULL;
CREATE INDEX Customername on Customer (LastName, FirstName);

DROP INDEX OrderOrderDate ON "Order";
ALTER TABLE "Order" ALTER COLUMN OrderDate datetime NOT NULL;
CREATE INDEX OrderOrderDate on "Order" (OrderDate);


SELECT * from Customer;

SELECT Country FROM Customer WHERE Country like 'A%' OR Country like 'I%';

SELECT FirstName FROM Customer WHERE FirstName like '__i%';

INSERT INTO "Customer" values(5264, 'sujay','Desai','FrankFurt','Germany',86653921);

create table employee
(
emp_id int,
emp_name nvarchar(40),
depart_name nvarchar(40),
manager_name nvarchar(40),
joining date,
rating int
);

insert into employee values(13,'Riddhi','Incometax','priti','2002-05-13',4),(14,'Manasi','service','meet','2002-07-19',2),(17,'vishwajeeta','head','apurv','2005-09-5',3),(18,'Reena','desk','simu','2004-05-3',6);

SELECT emp_name from employee;

alter table Customer add fax_number int;

UPDATE Customer SET fax_number = '123456156' WHERE Id = 1122;

SELECT * from Customer where fax_number IS NOT NULL;

SELECT * from Customer where FirstName LIKE '_u%'

SELECT UnitPrice from OrderItem WHERE UnitPrice>'10' and UnitPrice<'20';

alter table "Order" add shipping_name nvarchar(40);

UPDATE "Order" SET shipping_name = 'DHL' WHERE Id= 3100;
UPDATE "Order" SET shipping_name = 'FEDEX' WHERE Id= 3101;
UPDATE "Order" SET shipping_name = 'BLUEDART' WHERE Id= 3102;

SELECT * from "Order" WHERE shipping_name IS NOT NULL ORDER BY OrderDate ASC;

INSERT INTO "Order" values(3201,'2022-10-17',102,1234,12312,'La corned abondance',NULL),(3202,'2022-09-18',102,1235,1215,'La corned abondance',NULL),(3203,'2022-11-20',102,1235,1215,'La corned abondance',NULL);

SELECT * FROM "Order" WHERE shipping_name = 'La corned abondance' AND OrderDate BETWEEN '2022-10-15' AND '2022-10-17'

CREATE TABLE "Suppliers" (
  "Id" int PRIMARY KEY,
  "Name" nvarchar(20),
);
INSERT INTO Suppliers values (1,'Exotic Liquids');
UPDATE Product SET supplierId = 1 WHERE Id <22;
ALTER TABLE Product ADD CONSTRAINT fk_supplier_id FOREIGN KEY (supplierId) REFERENCES Suppliers(Id);

SELECT Product.ProductName FROM Product INNER JOIN Suppliers ON Product.SupplierId = Suppliers.Id WHERE Suppliers.Name = 'Exotic Liquids';

SELECT ProductId,AVG(Quantity) FROM OrderItem GROUP BY ProductId;