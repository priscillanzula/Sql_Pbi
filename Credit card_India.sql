use creditcards_india;

ALTER TABLE `credit cards` RENAME TO `credit_cards`;
SELECT * FROM credit_cards;
-- SUBSTRING_INDEX function to extract just "Delhi" from "Delhi, India";

UPDATE `credit_cards` 
SET city = SUBSTRING_INDEX(city, ',', 1)
WHERE city LIKE '%India';
describe credit_cards;

ALTER TABLE `credit_cards` CHANGE COLUMN `city` `city` VARCHAR(100);
ALTER TABLE `credit_cards` CHANGE COLUMN `card type` `card type` VARCHAR(100);
ALTER TABLE `credit_cards` CHANGE COLUMN `exp type` `exp type` VARCHAR(100);
ALTER TABLE `credit_cards` CHANGE COLUMN `gender` `gender` VARCHAR(100);

UPDATE credit_cards
SET date = STR_TO_DATE(date, '%d-%b-%y');

ALTER table credit_cards
modify date date;
set sql_safe_updates = 1;
SELECT * FROM credit_cards;

SELECT date, DATE_FORMAT(date, '%M') AS 'month'
FROM credit_cards 
LIMIT 1000;

SELECT date, DATE_FORMAT(date, '%Y') AS 'year'
FROM credit_cards 
LIMIT 1000;
-- First, add the new columns
ALTER TABLE credit_cards
ADD COLUMN month VARCHAR(20),
ADD COLUMN year INT;

-- Then update these columns with values from the date column
UPDATE credit_cards
SET 
    month = MONTHNAME(date),
    year = YEAR(date);


SELECT *FROM credit_cards;

