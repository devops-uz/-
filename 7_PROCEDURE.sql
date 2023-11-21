-- Процедура: Получить активный курсы
CREATE DEFINER=`nodir`@`localhost` PROCEDURE `ACTIVE_LESSONS`()
BEGIN
	SELECT * FROM document INNER JOIN courses ON document.course = courses.`code`;
END