CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

DELIMITER //

CREATE FUNCTION FormatSeconds(seconds INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    DECLARE formatted_time VARCHAR(100);

    SET days = seconds DIV 86400;
    SET remaining_seconds = seconds MOD 86400;

    SET hours = remaining_seconds DIV 3600;
    SET remaining_seconds = remaining_seconds MOD 3600;

    SET minutes = remaining_seconds DIV 60;

    SET remaining_seconds = remaining_seconds MOD 60;

    SET formatted_time = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');

    RETURN formatted_time;
END //

DELIMITER ;