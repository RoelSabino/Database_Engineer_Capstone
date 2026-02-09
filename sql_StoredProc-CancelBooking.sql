
USE little_lemon;

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //
CREATE PROCEDURE CancelBooking(booking_id INT)
BEGIN
	DELETE FROM Bookings
		WHERE BookingID = booking_id;
	SELECT CONCAT('Booking ID: ', booking_id, " cancelled.") AS Confirmation ;
END//
DELIMITER ;

CALL CancelBooking(1);
SELECT * FROM Bookings;

