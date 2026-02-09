
USE little_lemon;

DELETE FROM Orders WHERE OrderID > 0;
DELETE FROM Menus WHERE MenuID > 0;
DELETE FROM Courses WHERE CourseID > 0;
DELETE FROM Cuisines WHERE CuisineID > 0;
DELETE FROM Starters WHERE StarterID > 0;
DELETE FROM Desserts WHERE DessertID > 0;
DELETE FROM Sides WHERE SideID > 0;

INSERT INTO Courses (CourseID, CourseName)
	VALUES (1, 'Course A'),
		(2, 'Course B');
INSERT INTO Cuisines (CuisineID, CuisineName)
	VALUES (1, 'Cuisine A'),
		(2, 'Cuisine B');
INSERT INTO Starters (StarterID, StarterName)
	VALUES (1, 'Starter A'),
		(2, 'Starter B');
INSERT INTO Desserts (DessertID, DessertName)
	VALUES (1, 'Dessert A'),
		(2, 'Dessert B');
INSERT INTO Sides (SideID, SideName)
	VALUES (1, 'Side A'),
		(2, 'Side B');

INSERT INTO Menus (MenuID, MenuName, MenuDescription, MenuPrice, CourseID, CuisineID, StarterID, DessertID, SideID)
	VALUES (1, 'Menu A', 'Menu Description A', 200, 1, 1, 1, 1, 1),
		(2, 'Menu B', 'Menu Description B', 50, 2, 2, 2, 2, 2);

INSERT INTO Orders (OrderID, Date, CustomerID, MenuID, Quantity)
	VALUES
	(1, '2026-01-02 00:00:00', 1, 1, 3),
	(2, '2026-01-23 00:00:00', 2, 2, 1),
	(3, '2026-02-04 00:00:00', 1, 2, 2);

SELECT * FROM Orders;
