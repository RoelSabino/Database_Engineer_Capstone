
USE little_lemon;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN booking_id INT,
    IN customer_id INT,
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE bookedTable INT DEFAULT 0;

    -- Start a transaction
    START TRANSACTION;

    -- Check if table is already booked
    SELECT COUNT(*) INTO bookedTable
    FROM Bookings
    WHERE BookingDate = booking_date
      AND TableNumber = table_number;

    IF bookedTable > 0 THEN
        -- Table already booked, rollback
        ROLLBACK;
        SELECT CONCAT('Table ', table_number, ' is already booked') AS BookingStatus;
    ELSE
        -- Insert new booking
        INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
        VALUES (booking_id, customer_id, booking_date, table_number);

        -- Commit the transaction
        COMMIT;
        SELECT CONCAT('New Booking Added: ',
                      booking_id, ', ',
                      customer_id, ', ',
                      booking_date, ', ',
                      table_number) AS BookingStatus;
    END IF;
END//

DELIMITER ;

-- DELETE FROM Bookings WHERE BookingID > 0;
CALL AddValidBooking(1, 4, '2025-10-10', 5);

