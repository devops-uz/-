-- Просмотр прайс-листа организации на заданную дату
SELECT
	`name` AS 'Имя курса',
	`organization` AS 'Организация',
	`price-list`.price AS 'Сумма',
	CALC_TAX ( courses.`code` ) AS 'НДС',
	DATE_FORMAT( `price-list`.DATE, '%m.%d.%Y' ) AS 'Дата' 
FROM
	courses
	INNER JOIN `price-list` ON courses.price = `price-list`.`code` 
WHERE
	`price-list`.DATE >= '2023-01-01' 
	AND `price-list`.DATE <= '2024-12-31';
	
-- Просмотр расписания заданного преподавателя за заданный период – название курса, дата начала, дата окончания
SELECT
	teacher AS 'Преподаватель',
	course AS 'Курс',
	DATE_FORMAT( `start`, '%m.%d.%Y' ) AS 'Дата начала',
	DATE_FORMAT( DATE_ADD( `start`, INTERVAL days DAY ), '%m.%d.%Y' ) AS 'Дата окончания' 
FROM
	document
	INNER JOIN courses ON document.course = courses.`code` 
WHERE
	document.teacher = 'T-7111' 
	AND document.`start` >= '2023-01-01' 
	AND DATE_ADD( `start`, INTERVAL days DAY ) <= '2024-12-31';
	
	
-- Просмотр для заданного (выбранного) курса, за заданный период наполнение групп – полностью ли набраны
SELECT `code` AS 'Курс', IF (( students - JSON_LENGTH( employees ) > 0 ),
	'Группа не полностью',
	'Группа заполен' 
) AS 'Текущий статус',
`application-organization`.`name` AS 'Организация',
DATE_FORMAT( `application-organization`.`date`, '%d.%m.%Y' ) AS 'Дата' 
FROM
	courses
	INNER JOIN `application-organization` ON courses.`code` = `application-organization`.course 
WHERE
	courses.`code` = 'C-9012' 
	AND `application-organization`.`date` >= '2023-01-01' 
	AND `application-organization`.`date` <= '2024-12-31';