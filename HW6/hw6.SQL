CREATE TABLE secs (
id INT AUTO_INCREMENT PRIMARY KEY,
qty_of_secs INT);

INSERT INTO secs (qty_of_secs)
VALUES(
123456
);


DELIMITER \
CREATE FUNCTION days_hours_min_sec(secs INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
-- DECLARE days_sec INT DEFAULT 86400;
-- DECLARE hours_sec INT DEFAULT 3600;
-- DECLARE minutes_sec INT DEFAULT 60;
DECLARE days INT DEFAULT 0;
DECLARE hours INT DEFAULT 0;
DECLARE minutes INT DEFAULT 0;

DECLARE res VARCHAR(50);
 
while secs > 60 DO
    SET days = floor(secs/86400);
    SET secs = secs - days*86400;
    
    SET hours = floor(secs/3600);
    SET secs = secs - hours*3600;  
    
    SET minutes = floor(secs/60);
    SET secs = secs - minutes*60;  
    

END WHILE;

SET res = concat(days,  ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' secs');
RETURN res;

 
 
END;\

-- drop function days_hours_min_sec;

SELECT qty_of_secs, days_hours_min_sec(123456) AS days_hours_min_sec
FROM secs;



INSERT INTO even_or_odd (numbers)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

SELECT numbers FROM even_or_odd
WHERE numbers % 2 = 0;






/*

DELIMITER \
CREATE PROCEDURE filing_of_table ()
DETERMINISTIC
BEGIN
DECLARE COUNTER INT DEFAULT 1;
insert into even_or_odd values (1);
WHILE COUNTER < 11 DO

INSERT INTO even_or_odd (numbers)

SELECT ID + COUNTER
FROM even_or_odd;
SELECT count(*) INTO COUNTER FROM even_or_odd;
SELECT COUNTER;

END WHILE;


END\;

DROP PROCEDURE filing_of_table;

CALL filing_of_table ();





create procedure fill_numbers()
deterministic
begin
  declare counter int default 1;
  insert into numbers values (1);
  while counter < 1000000
  do
      insert into numbers (id)
          select id + counter
          from numbers;
      select count(*) into counter from numbers;
      select counter;
  end while;
end $$
delimiter ;

call fill_numbers();
*/