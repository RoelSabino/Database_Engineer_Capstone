
USE little_lemon;

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //
CREATE PROCEDURE UpdateBooking(booking_id INT, booking_date DATE)
BEGIN
	UPDATE Bookings SET BookingDate = booking_date
		WHERE BookingID = booking_id;
	SELECT CONCAT('Booking ID: ', booking_id, " updated to ", booking_date) AS Confirmation ;
END//
DELIMITER ;

CALL UpdateBooking(1, '2026-01-02')
