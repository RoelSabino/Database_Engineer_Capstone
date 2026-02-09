PREPARE GetOrderDetail FROM '
    SELECT c.FullName, o.OrderID, m.MenuName, m.MenuDescription,
           o.Quantity, m.MenuPrice, o.TotalCost
    FROM customers c
    JOIN orders o ON c.CustomerID = o.CustomerID
    JOIN menus m ON o.MenuID = m.MenuID
    WHERE c.CustomerID = ?
';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;
