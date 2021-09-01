create database if not exists repair;
USE repair;

-- these commands remove all tables from the database
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS statuses_translations;
DROP TABLE IF EXISTS statuses;
DROP TABLE IF EXISTS languages;

----------------------------------------------------------------
-- ROLES
-- users role
----------------------------------------------------------------
CREATE TABLE `roles` (
  `id_role` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
  
-- insert data into roles table
----------------------------------------------------------------
-- we use ENUM as the Role entity, so the numeration must started 
-- from 0 with the step equaled to 1
----------------------------------------------------------------
INSERT INTO roles VALUES(0, 'manager');
INSERT INTO roles VALUES(1, 'repairman');
INSERT INTO roles VALUES(2, 'client');

----------------------------------------------------------------
-- USERS
----------------------------------------------------------------
CREATE TABLE `users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(10) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `first_name` VARCHAR(15) NULL,
  `last_name` VARCHAR(20) NULL,
  `role_id` INT NOT NULL DEFAULT 2,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  INDEX `id_role_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `id_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `repair`.`roles` (`id_role`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);

-- insert data into users table    
INSERT INTO `users` (`login`, `password`, `role_id`) VALUES ('manager', '123', '0');
INSERT INTO `users` (`login`, `password`, `role_id`) VALUES ('repairman', '123', '1');
INSERT INTO `users` (`login`, `password`, `role_id`) VALUES ('client', '123', '2');

----------------------------------------------------------------
-- LANGUAGES
-- languages for sttuses
----------------------------------------------------------------
CREATE TABLE `languages` (
  `code` CHAR(2) NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

-- insert data into languages table  
INSERT INTO `languages` VALUES ('en', 'English');
INSERT INTO `languages` VALUES ('uk', 'Ukrinian');

----------------------------------------------------------------
-- STATUSES
-- statuses for applications
----------------------------------------------------------------
CREATE TABLE `statuses` (
  `id_statuses` INT NOT NULL,
  PRIMARY KEY (`id_statuses`));

-- insert data into statuses table
-- we use ENUM as the Status entity, so the numeration must started 
-- from 0 with the step equaled to 1
INSERT INTO `statuses` VALUES ('0');
INSERT INTO `statuses` VALUES ('1');
INSERT INTO `statuses` VALUES ('2');
INSERT INTO `statuses` VALUES ('3');
INSERT INTO `statuses` VALUES ('4');

-- statuses translations
CREATE TABLE `statuses_translations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status_id` INT NOT NULL,
  `language_code` CHAR(2) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  INDEX `id_status_idx` (`status_id` ASC) VISIBLE,
  INDEX `language_idx` (`language_code` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `repair`.`statuses` (`id_statuses`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `language`
    FOREIGN KEY (`language_code`)
    REFERENCES `repair`.`languages` (`code`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);
    
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('0', 'uk', 'Чекає оплату');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('0', 'en', 'Awaiting payment');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('1', 'uk', 'Оплачено');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('1', 'en', 'Paid');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('2', 'uk', 'В роботі');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('2', 'en', 'In work');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('3', 'uk', 'Відмінено');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('3', 'en', 'Canceled');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('4', 'uk', 'Виконано');
INSERT INTO statuses_translations (`status_id`, `language_code`, `name`)
    VALUES ('4', 'en', 'Complete');
