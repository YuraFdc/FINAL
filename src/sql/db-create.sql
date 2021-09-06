create database if not exists repair_agency;

-- these commands remove all tables from the database
DROP TABLE IF EXISTS application;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS status_translation;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS language;

-- --------------------------------------------------------------
-- ROLE
-- users role
-- --------------------------------------------------------------
CREATE TABLE `role` (
    `id_role` INT NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id_role`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

-- insert data into role table
-- --------------------------------------------------------------
-- we use ENUM as the Role entity, so the numeration must started
-- from 0 with the step equaled to 1
-- --------------------------------------------------------------
INSERT INTO role VALUES(0, 'manager');
INSERT INTO role VALUES(1, 'master');
INSERT INTO role VALUES(2, 'client');

-- --------------------------------------------------------------
-- USER
-- --------------------------------------------------------------
CREATE TABLE `user` (
    `id_user` INT NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(10) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `first_name` VARCHAR(15) NULL,
    `last_name` VARCHAR(20) NULL,
    `role_id` INT NOT NULL DEFAULT 2,
    PRIMARY KEY (`id_user`),
    UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
    INDEX `id_role_idx` (`role_id` ASC) VISIBLE,
    CONSTRAINT `id_role`
        FOREIGN KEY (`role_id`)
            REFERENCES `role` (`id_role`)
            ON DELETE CASCADE
            ON UPDATE RESTRICT);

-- insert data into users table
INSERT INTO `user` (`login`, `password`, `role_id`) VALUES ('manager', '123', '0');
INSERT INTO `user` (`login`, `password`, `role_id`) VALUES ('repairman', '123', '1');
INSERT INTO `user` (`login`, `password`, `role_id`) VALUES ('client', '123', '2');

-- --------------------------------------------------------------
-- LANGUAGE
-- languages for sttuses
-- --------------------------------------------------------------
CREATE TABLE `language` (
    `code` CHAR(2) NOT NULL,
    `name` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`code`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

-- insert data into languages table
INSERT INTO `language` VALUES ('en', 'English');
INSERT INTO `language` VALUES ('uk', 'Ukrinian');

-- --------------------------------------------------------------
-- STATUS
-- statuses for applications
-- --------------------------------------------------------------
CREATE TABLE `status` (
    `id_status` INT NOT NULL,
    PRIMARY KEY (`id_status`));

-- insert data into statuses table
-- we use ENUM as the Status entity, so the numeration must started
-- from 0 with the step equaled to 1
INSERT INTO `status` VALUES ('0');
INSERT INTO `status` VALUES ('1');
INSERT INTO `status` VALUES ('2');
INSERT INTO `status` VALUES ('3');
INSERT INTO `status` VALUES ('4');

-- status translations
CREATE TABLE `status_translation` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `status_id` INT NOT NULL,
    `language_code` CHAR(2) NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    INDEX `id_status_idx` (`status_id` ASC) VISIBLE,
    INDEX `language_idx` (`language_code` ASC) VISIBLE,
    PRIMARY KEY (`id`),
    CONSTRAINT `id_status`
        FOREIGN KEY (`status_id`)
            REFERENCES `status` (`id_status`)
            ON DELETE CASCADE
            ON UPDATE RESTRICT,
    CONSTRAINT `language`
        FOREIGN KEY (`language_code`)
            REFERENCES `language` (`code`)
            ON DELETE CASCADE
            ON UPDATE RESTRICT);

INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('0', 'uk', 'Чекає оплату');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('0', 'en', 'Awaiting payment');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('1', 'uk', 'Оплачено');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('1', 'en', 'Paid');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('2', 'uk', 'В роботі');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('2', 'en', 'In work');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('3', 'uk', 'Відмінено');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('3', 'en', 'Canceled');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('4', 'uk', 'Виконано');
INSERT INTO status_translation (`status_id`, `language_code`, `name`)
    VALUES ('4', 'en', 'Complete');

-- --------------------------------------------------------------
-- APPLICATION
-- --------------------------------------------------------------
CREATE TABLE `application` (
   `id_application` INT NOT NULL AUTO_INCREMENT,
   `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `user_id` INT NOT NULL,
   `description` VARCHAR(100) NOT NULL,
   `master_id` INT NULL,
   `price` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
   `status_id` INT NOT NULL DEFAULT 0,
   `response` VARCHAR(250),
   PRIMARY KEY (`id_application`),
   INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
   INDEX `master_id_idx` (`master_id` ASC) VISIBLE,
   INDEX `status_id_idx` (`status_id` ASC) VISIBLE,
   CONSTRAINT `user_id`
       FOREIGN KEY (`user_id`)
           REFERENCES `user` (`id_user`)
           ON DELETE CASCADE
           ON UPDATE RESTRICT,
   CONSTRAINT `master_id`
       FOREIGN KEY (`master_id`)
           REFERENCES `user` (`id_user`)
           ON DELETE NO ACTION
           ON UPDATE NO ACTION,
   CONSTRAINT `status_id`
       FOREIGN KEY (`status_id`)
           REFERENCES `status` (`id_status`)
           ON DELETE NO ACTION
           ON UPDATE NO ACTION);