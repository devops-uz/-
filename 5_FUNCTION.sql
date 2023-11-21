-- Функция для вычисления сумма НДС
CREATE FUNCTION `CALC_TAX`(courseCode VARCHAR(6))
 RETURNS float
  DETERMINISTIC
BEGIN
 DECLARE priceCode VARCHAR(6);
 DECLARE priceSumm BIGINT;
 DECLARE calcPercent FLOAT;
 SELECT price FROM courses WHERE code = courseCode INTO priceCode;
 SELECT price FROM `price-list` WHERE `code` = priceCode INTO priceSumm;
 SET calcPercent = (priceSumm / 100) * 20;
 RETURN priceSumm + calcPercent;
END