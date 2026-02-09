-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon` DEFAULT CHARACTER SET utf8mb3 ;
USE `little_lemon` ;

-- -----------------------------------------------------
-- Table `little_lemon`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`countries` (
  `CountryID` INT NOT NULL,
  `CountryCode` CHAR(2) NOT NULL,
  `CountryName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CountryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`cities` (
  `CityID` INT NOT NULL,
  `CountryID` INT NOT NULL,
  `CityName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CityID`),
  INDEX `fk_cities_country_idx` (`CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_cities_country`
    FOREIGN KEY (`CountryID`)
    REFERENCES `little_lemon`.`countries` (`CountryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`postalcodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`postalcodes` (
  `PostalId` INT NOT NULL,
  `CityID` INT NOT NULL,
  `PostalCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PostalId`),
  INDEX `fk_postals_city_idx` (`CityID` ASC) VISIBLE,
  CONSTRAINT `fk_postals_city`
    FOREIGN KEY (`CityID`)
    REFERENCES `little_lemon`.`cities` (`CityID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`addresses` (
  `AddressID` INT NOT NULL,
  `ContactName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `CityID` INT NOT NULL,
  `CountryID` INT NOT NULL,
  `PostalID` INT NOT NULL,
  PRIMARY KEY (`AddressID`),
  INDEX `fk_addresses_postal_idx` (`PostalID` ASC) VISIBLE,
  INDEX `fk_addresses_city_idx` (`CityID` ASC) VISIBLE,
  INDEX `fk_addresses_country_idx` (`CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_addresses_city`
    FOREIGN KEY (`CityID`)
    REFERENCES `little_lemon`.`cities` (`CityID`),
  CONSTRAINT `fk_addresses_country`
    FOREIGN KEY (`CountryID`)
    REFERENCES `little_lemon`.`countries` (`CountryID`),
  CONSTRAINT `fk_addresses_postal`
    FOREIGN KEY (`PostalID`)
    REFERENCES `little_lemon`.`postalcodes` (`PostalId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_bookings_customer_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon`.`customers` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`courses` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`cuisines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`cuisines` (
  `CuisineID` INT NOT NULL,
  `CuisineName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CuisineID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`deliveries` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_deliveries_address_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `fk_deliveries_address`
    FOREIGN KEY (`AddressID`)
    REFERENCES `little_lemon`.`addresses` (`AddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`desserts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`desserts` (
  `DessertID` INT NOT NULL,
  `DessertName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`DessertID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`sides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`sides` (
  `SideID` INT NOT NULL,
  `SideName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`SideID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`starters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`starters` (
  `StarterID` INT NOT NULL,
  `StarterName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`StarterID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`menus` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `MenuDescription` VARCHAR(255) NOT NULL,
  `MenuPrice` DECIMAL(10,2) NOT NULL,
  `CourseID` INT NOT NULL,
  `CuisineID` INT NOT NULL,
  `StarterID` INT NOT NULL,
  `DessertID` INT NOT NULL,
  `SideID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_menus_cuisine_idx` (`CuisineID` ASC) VISIBLE,
  INDEX `fk_menus_starter_idx` (`StarterID` ASC) VISIBLE,
  INDEX `fk_menus_side_idx` (`SideID` ASC) VISIBLE,
  INDEX `fk_menus_dessert_idx` (`DessertID` ASC) VISIBLE,
  INDEX `fk_menus_course_idx` (`CourseID` ASC) VISIBLE,
  CONSTRAINT `fk_menus_course`
    FOREIGN KEY (`CourseID`)
    REFERENCES `little_lemon`.`courses` (`CourseID`),
  CONSTRAINT `fk_menus_cuisine`
    FOREIGN KEY (`CuisineID`)
    REFERENCES `little_lemon`.`cuisines` (`CuisineID`),
  CONSTRAINT `fk_menus_dessert`
    FOREIGN KEY (`DessertID`)
    REFERENCES `little_lemon`.`desserts` (`DessertID`),
  CONSTRAINT `fk_menus_side`
    FOREIGN KEY (`SideID`)
    REFERENCES `little_lemon`.`sides` (`SideID`),
  CONSTRAINT `fk_menus_starter`
    FOREIGN KEY (`StarterID`)
    REFERENCES `little_lemon`.`starters` (`StarterID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `little_lemon`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `DeliveryID` INT NULL DEFAULT NULL,
  `Date` DATETIME NOT NULL,
  `Quantity` INT NOT NULL DEFAULT '0',
  `TotalCost` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`OrderID`),
  INDEX `fk_orders_customer_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_orders_menu_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_orders_delivery_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon`.`customers` (`CustomerID`),
  CONSTRAINT `fk_orders_delivery`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `little_lemon`.`deliveries` (`DeliveryID`),
  CONSTRAINT `fk_orders_menu`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon`.`menus` (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `little_lemon` ;

-- -----------------------------------------------------
-- Placeholder table for view `little_lemon`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`ordersview` (`OrderID` INT, `MenuName` INT, `MenuDescription` INT, `Quantity` INT, `TotalCost` INT);

-- -----------------------------------------------------
-- procedure AddBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `AddBooking`(booking_id INT, customer_id INT, booking_date DATE, table_number INT)
BEGIN
	INSERT INTO Bookings VALUES (booking_id, customer_id, booking_date, table_number);
	SELECT CONCAT('New Booking Added: ', booking_id, customer_id, booking_date, table_number) AS Confirmation ;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `CancelBooking`(booking_id INT)
BEGIN
	DELETE FROM Bookings
		WHERE BookingID = booking_id;
	SELECT CONCAT('Booking ID: ', booking_id, " cancelled.") AS Confirmation ;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `GetMaxQuantity`()
SELECT MAX(Quantity) AS 'Max. Quantity in Order' FROM Orders$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ManageBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `ManageBooking`(booking_date DATE, table_number INT)
BEGIN
    DECLARE bookedTable INT DEFAULT 0;

    SELECT COUNT(*) 
    INTO bookedTable
    FROM Bookings 
    WHERE BookingDate = booking_date 
      AND TableNumber = table_number;

    IF bookedTable > 0 THEN
        SELECT CONCAT("Table ", table_number, " is already booked") AS BookingStatus;
    ELSE
        SELECT CONCAT("Table ", table_number, " is not booked") AS BookingStatus;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `UpdateBooking`(booking_id INT, booking_date DATE)
BEGIN
UPDATE Bookings SET BookingDate = booking_date
	WHERE BookingID = booking_id;
SELECT CONCAT('Booking ID: ', booking_id, " updated to ", booking_date) AS Confirmation ;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `little_lemon`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `little_lemon`.`ordersview`;
USE `little_lemon`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `little_lemon`.`ordersview` AS select `o`.`OrderID` AS `OrderID`,`m`.`MenuName` AS `MenuName`,`m`.`MenuDescription` AS `MenuDescription`,`o`.`Quantity` AS `Quantity`,`o`.`TotalCost` AS `TotalCost` from (`little_lemon`.`orders` `o` join `little_lemon`.`menus` `m` on((`o`.`MenuID` = `m`.`MenuID`))) where (`o`.`Quantity` > 2);
USE `little_lemon`;

DELIMITER $$
USE `little_lemon`$$
CREATE
DEFINER=`admin`@`%`
TRIGGER `little_lemon`.`calculate_total_cost`
BEFORE INSERT ON `little_lemon`.`orders`
FOR EACH ROW
BEGIN
    DECLARE menu_price DECIMAL(10,2);

    -- Get the price of the menu item
    SELECT MenuPrice INTO menu_price
    FROM Menus
    WHERE MenuID = NEW.MenuID;

    -- Calculate total cost
    SET NEW.TotalCost = menu_price * NEW.Quantity;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
