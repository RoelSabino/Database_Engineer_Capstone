
USE little_lemon;

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //
CREATE PROCEDURE AddBooking(booking_id INT, customer_id INT, booking_date DATE, table_number INT)
BEGIN
	INSERT INTO Bookings VALUES (booking_id, customer_id, booking_date, table_number);
	SELECT CONCAT('New Booking Added: ', booking_id, customer_id, booking_date, table_number) AS Confirmation ;
END//
DELIMITER ;

DELETE FROM Bookings WHERE BookingID > 0;
CALL AddBooking(1, 4, '2025-10-10', 5);
CALL AddBooking(2, 3, '2025-11-12', 3);
CALL AddBooking(3, 2, '2025-10-11', 2);
CALL AddBooking(4, 1, '2025-10-13', 2);

SELECT * FROM Bookings;
