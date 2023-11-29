-- Добавить курс
INSERT INTO `courses` (code, name, type, days, students, price, organization) VALUES ('C-6201', 'Эконом Плюс', 'Маркетинг', 30, 10, 'P-9011', 'O-8911');

-- Назначить преподаватель
INSERT INTO `document` (course, teacher, start) VALUES ('C-7811', 'T-6511');

-- Добавить учебный организация
INSERT INTO `learning-organization` (code, name, address, phone, mail) VALUES ('O-3111', 'Внуки Ньютона', 'г. Гомель', 2091121, 'vnuki@nyuton.by');

-- Добавить новый прайс-лист
INSERT INTO `price-list` (code, price, date) VALUES ('P-1189', 200, '2023-11-21 05:51:15');

-- Добавить новый преподаватель
INSERT INTO `teachers` (code, `full-name`, `brith-date`, sex, `education-degree`, category) VALUES ('T-7111', 'Носов Всеволод Русланович', '1991-11-21', 'М', 'Аспирант', 'Третий');

-- Заявления на курсы
INSERT INTO `application-organization` (name, employees, address, phone, mail, course, date) VALUES ('Генеральный прокуратура', '{\"1\": \"Русанов Иван Фёдорович\", \"2\": \"Кузин Михаил Денисович\", \"3\": \"Воронов Всеволод Максимович\", \"4\": \"Захаров Фёдор Артёмович\"}', 'г. Минск', 1010202, 'prok@minsk.by', 'C-9012');
