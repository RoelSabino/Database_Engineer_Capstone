
USE little_lemon;

DELETE FROM Customers WHERE CustomerID > 0;

INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email)
	VALUES
	(1, 'Customer A', 'A12345678', 'A1234@xxxx.com'),
	(2, 'Customer B', 'B12345678', 'B1234@xxxx.com'),
	(3, 'Customer C', 'C12345678', 'C1234@xxxx.com'),
	(4, 'Customer D', 'D12345678', 'D1234@xxxx.com');

SELECT * FROM Customers;
