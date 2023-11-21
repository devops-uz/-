-- База данных: learning-center
CREATE DATABASE `learning-center` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

-- Таблица: courses
CREATE TABLE `courses`  (
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код курса',
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Имя курса',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Тип курса',
  `days` smallint NOT NULL COMMENT 'Количество дней обучения',
  `students` smallint NOT NULL COMMENT 'Количество студентов',
  `price` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код прейскуранта',
  `organization` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ответственная организация',
  PRIMARY KEY (`code`) USING BTREE,
  INDEX `check_price`(`price` ASC) USING BTREE,
  INDEX `check_organization`(`organization` ASC) USING BTREE,
  CONSTRAINT `check_price` FOREIGN KEY (`price`) REFERENCES `price-list` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `check_organization` FOREIGN KEY (`organization`) REFERENCES `learning-organization` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE
)

-- Таблица: document
CREATE TABLE `document`  (
  `course` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код курса',
  `teacher` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код преподавателя',
  INDEX `check_teacher`(`teacher` ASC) USING BTREE,
  INDEX `check_course`(`course` ASC) USING BTREE,
  CONSTRAINT `check_course` FOREIGN KEY (`course`) REFERENCES `courses` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `check_teacher` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE
)

-- Таблица: learning-organization
CREATE TABLE `learning-organization`  (
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код учебного центра',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Имя учебного центра',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Адрес учебного центра',
  `phone` mediumint NOT NULL COMMENT 'Номер телефона учебного центра',
  `mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Электронный почта учебного центра',
  PRIMARY KEY (`code`) USING BTREE
)

-- Таблица: application-organization
CREATE TABLE `application-organization`  (
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Имя заявнительный организация',
  `employees` json NOT NULL COMMENT 'Полный имя и должность сотрудники',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Адрес',
  `phone` bigint NOT NULL COMMENT 'Номер телефона',
  `mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Электронный почта',
  `course` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код курса',
  INDEX `check_course-application-organization`(`course` ASC) USING BTREE,
  CONSTRAINT `check_course-application-organization` FOREIGN KEY (`course`) REFERENCES `courses` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE
)

-- Таблица: price-list
CREATE TABLE `price-list`  (
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код прейскуранта',
  `price` int NOT NULL COMMENT 'Цена курса',
  `date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата добавления',
  PRIMARY KEY (`code`) USING BTREE
)

-- Таблица: teachers
CREATE TABLE `teachers`  (
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Код учителя',
  `full-name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Полный имя учителя',
  `brith-date` date NOT NULL COMMENT 'Дата рождения учителя',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Пол учителя',
  `education-degree` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Уровень образования',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Категория',
  PRIMARY KEY (`code`) USING BTREE
)