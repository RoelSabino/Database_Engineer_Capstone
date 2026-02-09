-- in order to show the columns, 4 joins are required because the course and starter tables are properly normalized

USE little_lemon;

SELECT Customers.CustomerID, Customers.FullName, Orders.OrderID, Orders.TotalCost, Menus.MenuName, Courses.CourseName, Starters.StarterName
FROM Customers 
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Menus ON Menus.MenuID = Orders.MenuID
INNER JOIN Courses ON Courses.CourseID = Menus.CourseID
INNER JOIN Starters ON Starters.StarterID = Menus.StarterID
WHERE Orders.TotalCost > 150
ORDER BY Orders.TotalCost;
