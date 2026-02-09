
USE little_lemon;

DROP TRIGGER IF EXISTS calculate_total_cost;

DELIMITER //

CREATE TRIGGER calculate_total_cost
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    DECLARE menu_price DECIMAL(10,2);

    -- Get the price of the menu item
    SELECT MenuPrice INTO menu_price
    FROM Menus
    WHERE MenuID = NEW.MenuID;

    -- Calculate total cost
    SET NEW.TotalCost = menu_price * NEW.Quantity;
END//

DELIMITER ;
