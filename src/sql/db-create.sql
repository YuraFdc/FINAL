create database if not exists repair_agency;

DROP TABLE IF EXISTS user;
CREATE TABLE `user` (
                        `user_id` INT NOT NULL AUTO_INCREMENT,
                        `email` VARCHAR(45) NOT NULL,
                        `first_name` VARCHAR(45) NULL,
                        `last_name` VARCHAR(45) NULL,
                        `score` FLOAT NOT NULL DEFAULT 0.00,
                        `role` ENUM('user', 'master', 'manager') NOT NULL DEFAULT 'user',
                        PRIMARY KEY (`user_id`),
                        UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
                        UNIQUE INDEX `usercol_UNIQUE` (`score` ASC) VISIBLE);

DROP TRIGGER IF EXISTS `user_BEFORE_INSERT`;

DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `repair_agency`.`user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW
BEGIN
	IF NEW.`email` NOT LIKE '%_@%_.__%' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = '[table:user] - `email` column is not valid';
END IF;
END$$
DELIMITER ;

INSERT INTO user (email)
VALUES ('fedor@gmail.com');