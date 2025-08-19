CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE, -- yyyy-mm-dd
    birthtime TIME, -- hh-mm-ss or -- hhh-mm-ss
    birthdt DATETIME -- yyyy-mm-dd hh-mm-ss -- THERE IS ALSO TIMESTAMP DATA TYPE -- VARY FROM 1970-2038 -- TAKE LESS MEMORY
);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- TIME_STAMP

CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default NOW() -- NOW() AND CURRENT_TIMESTAMP WORKS THE SAME
);

CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Current date time time_stamp
SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT NOW();
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

-- FORMATTING DATES

SELECT 
    birthdate,
    DAY(birthdate), -- OR DAYOFMONTH
    DAYOFWEEK(birthdate), -- 1 IS SUNDAY AND 7 FOR SATURDAY
    DAYOFYEAR(birthdate)
FROM people;
 
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate),
    MONTH(birthdt) -- MONTH NUMBER -- ALSO WORK WITH DATE_TIME
FROM people;

-- FORMATTING TIME

SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime),
    SECOND(birthtime)
FROM people;
 
SELECT 
    birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;

-- DATE FORMATS -- OUTPUT THE DATES IN SPECIFIC FORMAT -- VIEW DOCS ON DATE_FORMAT FUNCTION FOR BETTER PICTURE

SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- DATE MATHS

SELECT DATEDIFF(NOW(),birthdt) FROM people;  -- DATEDIFF SUBSTRACT TWO DATES
SELECT DATEDIFF(CURDATE(),birthdate) FROM people;
SELECT DATEDIFF(NOW(),birthtime) FROM people; -- RETURN 0 FROM TIME

SELECT TIMEDIFF(CURTIME(),'10:00:00'); -- DO NOT WORK WITH NOW()

-- DATE ADD AND DATE SUB -- VIEW DOCS

SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR);
SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH);
SELECT DATE_ADD(NOW(), INTERVAL 1 SECOND); -- ADD 1 SECOND TO CURRRENT DATE

SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH);

-- WE CAN ALSO USE + N - WITH INTERVAL
SELECT birthdate, (birthdate - INTERVAL 12 YEAR) AS MINUS FROM people;
SELECT birthdate, birthdate - INTERVAL 12 YEAR AS MINUS FROM people;

