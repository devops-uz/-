-- Триггеры для добавления префикса
CREATE TRIGGER `perfix_course` BEFORE INSERT ON `courses` FOR EACH ROW SET NEW.code = CONCAT('C-', NEW.code)
CREATE TRIGGER `perfix_learning_organization` BEFORE INSERT ON `learning-organization` FOR EACH ROW SET NEW.code = CONCAT('O-', NEW.code)
CREATE TRIGGER `perfix_price_list` BEFORE INSERT ON `price-list` FOR EACH ROW SET NEW.code = CONCAT('P-', NEW.code)
CREATE TRIGGER `perfix_teachers` BEFORE INSERT ON `teachers` FOR EACH ROW SET NEW.code = CONCAT('T-', NEW.code)