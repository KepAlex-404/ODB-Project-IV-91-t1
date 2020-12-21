START TRANSACTION;
USE `Repan`;
INSERT INTO `Repan`.`Roles` (`id`, `name`) VALUES (1, 'Manager');
INSERT INTO `Repan`.`Roles` (`id`, `name`) VALUES (2, 'Analyst');
INSERT INTO `Repan`.`Roles` (`id`, `name`) VALUES (3, 'Expert');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Repan`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `Repan`;
INSERT INTO `Repan`.`Users` (`id`, `name`, `Role_id`) VALUES (1, 'Олексій Гришин', 1);
INSERT INTO `Repan`.`Users` (`id`, `name`, `Role_id`) VALUES (2, 'Яременко Влада', 3);
INSERT INTO `Repan`.`Users` (`id`, `name`, `Role_id`) VALUES (3, 'Щоткин Максим', 3);
INSERT INTO `Repan`.`Users` (`id`, `name`, `Role_id`) VALUES (4, 'Вігор Дмитро', 2);
INSERT INTO `Repan`.`Users` (`id`, `name`, `Role_id`) VALUES (5, 'Бойко Михайло', 3);
INSERT INTO `Repan`.`Users` (`id`, `name`, `Role_id`) VALUES (6, 'Елвіс Преслі', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Repan`.`Poll`
-- -----------------------------------------------------
START TRANSACTION;
USE `Repan`;
INSERT INTO `Repan`.`Poll` (`id`, `creation_id`, `title`) VALUES (1, 2, 'Кто самый красивый в первой бригаде?');

COMMIT;

-- -----------------------------------------------------
-- Data for table `Repan`.`Questions`
-- -----------------------------------------------------
START TRANSACTION;
USE `Repan`;
INSERT INTO `Repan`.`Questions` (`id`, `text`, `poll_id`, `variant_id`) VALUES (1, 'Почему Леша самый красивый в первой бригаде?', 1, 2);
INSERT INTO `Repan`.`Questions` (`id`, `text`, `poll_id`, `variant_id`) VALUES (2, 'Почему Леша самый скромный в первой бригаде?', 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Repan`.`Answers`
-- -----------------------------------------------------
START TRANSACTION;
USE `Repan`;
INSERT INTO `Repan`.`Answers` (`id`, `date`, `text`, `user_id`, `q_id`) VALUES (1, '2020-12-20', 'Важная причина №1', 1, 1);
INSERT INTO `Repan`.`Answers` (`id`, `date`, `text`, `user_id`, `q_id`) VALUES (2, '2020-12-20', 'Важная причина №2', 2, 1);
INSERT INTO `Repan`.`Answers` (`id`, `date`, `text`, `user_id`, `q_id`) VALUES (3, '2020-12-20', 'Важная причина №3', 3, 1);
INSERT INTO `Repan`.`Answers` (`id`, `date`, `text`, `user_id`, `q_id`) VALUES (4, '2020-12-16', 'Очень важная причина №1', 4, 2);
INSERT INTO `Repan`.`Answers` (`id`, `date`, `text`, `user_id`, `q_id`) VALUES (5, '2020-12-16', 'Очень важная причина №2', 5, 2);

COMMIT;