USE little_lemon;

DROP VIEW IF EXISTS OrdersView;
CREATE VIEW OrdersView AS SELECT o.OrderID, m.MenuName, m.MenuDescription, o.Quantity, o.TotalCost 
	FROM Orders AS o  
	INNER JOIN Menus AS m ON o.MenuID = m.MenuID
	WHERE o.Quantity > 2;
    
select * from OrdersView;
    