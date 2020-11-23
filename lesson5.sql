
/* 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем. */

DROP DATABASE IF EXISTS lesson5;
CREATE DATABASE lesson5;
USE lesson5;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(100),
	created_at DATETIME,
	updated_at DATETIME
);

INSERT IGNORE INTO users(id,name) VALUES
(1,'User1'),
(2,'User2');

UPDATE users 
SET
	created_at = NOW(),
	updated_at = NOW()
WHERE 
	created_at IS NULL AND updated_at IS NULL 
	