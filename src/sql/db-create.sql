create database if not exists repair_agency;

DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS application_status;
DROP TABLE IF EXISTS application;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS status;

CREATE TABLE `user` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(45) NOT NULL,
    `first_name` VARCHAR(15) NULL,
    `last_name` VARCHAR(20) NULL,
    `account` FLOAT NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`user_id`),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

CREATE TABLE `role` (
    `role_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`role_id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

CREATE TABLE `status` (
    `status_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`status_id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

CREATE TABLE `application` (
    `application_id` INT NOT NULL,
    `user_name` VARCHAR(45) NOT NULL,
    `master_name` VARCHAR(45) NOT NULL,
    `price` DECIMAL(8,2) NOT NULL,
    INDEX `user_name_idx` (`user_name` ASC) VISIBLE,
    INDEX `master_name_idx` (`master_name` ASC) VISIBLE,
    PRIMARY KEY (`application_id`),
    UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
    CONSTRAINT `user_name`
        FOREIGN KEY (`user_name`)
        REFERENCES `repair_agency`.`user` (`email`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT `master_name`
        FOREIGN KEY (`master_name`)
        REFERENCES `repair_agency`.`user` (`email`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION);

CREATE TABLE `user_role` (
    `user_email` VARCHAR(45) NOT NULL,
    `user_role` VARCHAR(20) NOT NULL,
    UNIQUE INDEX `email_UNIQUE` (`user_email` ASC) VISIBLE,
    INDEX `role_idx` (`user_role` ASC) VISIBLE,
    CONSTRAINT `email`
        FOREIGN KEY (`user_email`)
        REFERENCES `repair_agency`.`user` (`email`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT `role`
        FOREIGN KEY (`user_role`)
        REFERENCES `role` (`name`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION);

CREATE TABLE `application_status` (
    `application_id` INT NOT NULL,
    `application_status` VARCHAR(20) NOT NULL,
    UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
    UNIQUE INDEX `application_status_UNIQUE` (`application_status` ASC) VISIBLE,
    CONSTRAINT `application_id`
        FOREIGN KEY (`application_id`)
        REFERENCES `application` (`application_id`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT `application_status`
        FOREIGN KEY (`application_status`)
        REFERENCES `status` (`name`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);


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