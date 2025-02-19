USE Northwind
GO



SELECT c.*
FROM CustomersDaw as c

-- Inservar valores nuevos en l atabla CustomersDaw
INSERT INTO CustomersDaw (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES (6, 'Fruteria Paco', 'Francisco Martinez', 'Av.Juan Carlos I, 23', 'Lorca', '30800', 'Spain');


-- Da valores nulos a los campos sin datos
INSERT INTO CustomersDaw (CustomerID, CustomerName, City, PostalCode, Country)
VALUES (8,'Angeles', 'La Hoya', 30816,'Spain');


INSERT INTO CustomersDaw (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('1001', 'Daniel 2', 'Daniel Mendez', 'Ctra Granada s/n', 'Lorca', '30800', 'Spain');



SELECT c.CompanyName, c.ContactName
FROM Customers as c
WHERE PostalCode IS NULL;

SELECT c.*
FROM Customers as c
                                                                 -- IF UnitsInStock es nulo, le da el valor de 0 y si no le da su propio valor
SELECT ProductID, ProductName, UnitPrice, UnitsInStock, UnitPrice * ISNULL(UnitsInStock, 0) AS CosteTotalProducto
FROM Products
WHERE UnitPrice > 20;