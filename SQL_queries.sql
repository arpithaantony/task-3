
CREATE DATABASE EcommerceDB;
USE EcommerceDB;



CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
City VARCHAR(50)
);

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10,2),
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
Price DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
DetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID)
);



INSERT INTO Customers VALUES
(1,'John','New York'),
(2,'Alice','Chicago'),
(3,'Bob','Dallas');

INSERT INTO Products VALUES
(101,'Laptop',800),
(102,'Phone',500),
(103,'Headphones',100);

INSERT INTO Orders VALUES
(1001,1,'2024-01-10',1300),
(1002,2,'2024-01-15',500),
(1003,1,'2024-02-01',100);

INSERT INTO OrderDetails VALUES
(1,1001,101,1),
(2,1001,102,1),
(3,1002,102,1),
(4,1003,103,1);



1. SELECT
SELECT * FROM Customers;

2. WHERE
SELECT *
FROM Orders
WHERE TotalAmount > 500;

3. ORDER BY
SELECT *
FROM Products
ORDER BY Price DESC;

4. GROUP BY + SUM
SELECT CustomerID,
SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

5. INNER JOIN
SELECT c.CustomerName,
o.OrderID,
o.TotalAmount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

6. LEFT JOIN
SELECT c.CustomerName,
o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

7. Aggregate Function - SUM
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

8. Aggregate Function - AVG
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

9. Subquery
SELECT CustomerID,
SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) >
(
SELECT AVG(TotalAmount)
FROM Orders
);

10. Create View
CREATE VIEW CustomerOrders AS
SELECT c.CustomerName,
o.OrderID,
o.TotalAmount
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT * FROM CustomerOrders;

11. Create Index
CREATE INDEX idx_customer
ON Orders(CustomerID);

